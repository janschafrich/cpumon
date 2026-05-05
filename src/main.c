
/* cpumon (c) Jan-Eric Schäfrich
 * a tool to repeatedly read current processors values  and print them to the terminal
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA 02110-1301, USA.
 *
*/

#include <stdio.h>
#include <string.h>                 // strlen
#include <stdlib.h>                 // malloc
#include <unistd.h>                 // uid_t sleep()
#include <ncurses.h>
#include "../include/utils.h"
#include "../include/cpumonlib.h"
#include "../include/guilib.h"
#include "../include/sysfs.h"


static bool display_power_config_flag = TRUE;
static bool display_moving_average_flag = FALSE;


static void poll_sensors(struct sensor_suite *sensors, struct app_context *ctx)
{
    read_sensors(sensors, ctx);
    ctx->period_cntr++;
    update_sensor_suite_statistics(sensors, ctx);
    ctx->history_cntr = (ctx->history_cntr + 1) % AVG_WINDOW;
}


static void render_frame(struct sensor_suite *sensors, const char *cpu_model, struct app_context *ctx)
{
    clear();

#if DEBUG_ENABLE
    printw("CPU Time Uint = %f W\n", sensors->cpu->power->time_unit);
    printw("CPU Energy Uint = %f W\n", sensors->cpu->power->energy_unit);
    printw("CPU POWER Uint = %f W\n", sensors->cpu->power->power_unit);
#endif

    attron(A_BOLD);
    printw("\n\t\t%s\n\n", cpu_model);
    attroff(A_BOLD);

    if (ctx->running_with_privileges == TRUE)
    {
        printw("Core    f/MHz \tC0%%   Temp/°C\t U/V\n");
        printw("------------------------------------\n");
        for (int core = 0; core < ctx->core_count; core++)
        {
            printw("%2d \t%.0f\t%2.f\t%.f\t%.2f\n",
                core,
                1000 * sensors->cpu->freq->per_core[core],
                sensors->cpu->load->per_core[core],
                sensors->cpu->temperature->per_core[core],
                sensors->cpu->voltage->per_core[core]);
        }
        printw("\n");
        printw("avg\t%.0f\t%.2f\t%.1f\t%.2f\n",
            sensors->cpu->freq->session.avg * 1000,
            sensors->cpu->load->session.avg,
            sensors->cpu->temperature->session.avg,
            sensors->cpu->voltage->session.avg);
        printw("min\t%.0f\t%.2f\t%.0f\t%.2f\n",
            sensors->cpu->freq->session.min * 1000,
            sensors->cpu->load->session.min,
            sensors->cpu->temperature->session.min,
            sensors->cpu->voltage->session.min);
        printw("max\t%.0f\t%.1f\t%.0f\t%.2f\n",
            sensors->cpu->freq->session.max * 1000,
            sensors->cpu->load->session.max,
            sensors->cpu->temperature->session.max,
            sensors->cpu->voltage->session.max);
        if (display_moving_average_flag == TRUE)
        {
            int window = ctx->period_cntr < AVG_WINDOW ? (int)ctx->period_cntr : AVG_WINDOW;
            compute_moving_average(window, ctx->freq_his, ctx->load_his, ctx->temp_his, ctx->voltage_his, ctx->power_his);
        }
        printw("\n");
        printw("\tPkg Power: %.2f W, avg: %.2f W\n",
            sensors->cpu->power->per_domain[PKG],
            sensors->cpu->power->stats->session.avg);
        draw_power(sensors->cpu->power->per_domain, sensors->cpu->power->n_domains,
            sensors->cpu->power->stats->session.avg);
        printw("\n");
        printw("GPU\t\t%.0f mV\t%.2f W\t%0.f °C\n",
            sensors->gpu->voltage->stats->per_core[0],
            sensors->gpu->power->per_core[0] / 1e6,
            sensors->gpu->temperature->per_core[0] / 1e3);
        printw("Northbridge\t%0.f mV", sensors->gpu->voltage->northbridge);
        printw("\n");
    }
    else
    {
        printw("To monitor all metrics, pls run as root.\n\n");

        printw("Core\tf/GHz \tC0%% \n");
        for (int i = 0; i < ctx->core_count; i++)
        {
            printw("%d \t%.1f\t%.f\n", i,
                sensors->cpu->freq->per_core[i],
                sensors->cpu->load->per_core[i]);
        }
        printw("\n");
        printw("avg\t%.2f\t%.2f\n",
            sensors->cpu->freq->session.avg,
            sensors->cpu->load->session.avg);
        printw("min\t%.2f\t\n", sensors->cpu->freq->session.min);
        printw("max\t%.2f\t\n", sensors->cpu->freq->session.max);
    }

    printw("\n");
    printw("---------- Battery (%s) ----------\n", sensors->battery->status);
    printw("    now      avg      min      max\n");
    printw("  %.2f W   %.2f W   %.2f W   %.2f W\n",
        sensors->battery->stats->per_core[0],
        sensors->battery->stats->session.avg,
        sensors->battery->stats->session.min,
        sensors->battery->stats->session.max);
    printw("\n");
    if (display_power_config_flag == TRUE)
    {
        get_power_config(ctx->running_with_privileges, sensors->cpu->ops);
    }
}


int main(int argc, char **argv)
{
    struct app_context ctx = {0};
    init_environment(&ctx);

    int command;
    while ((command = getopt(argc, argv, "c:hmps")) != -1) {
        switch (command) {
            case 'p':
                display_power_config_flag = TRUE; break;
            case 'h':
                printf("\t-p    : displays performance and power configurations\n");
                printf("\t-h    : displays this help\n");
                exit(EXIT_SUCCESS);
            default:
                fprintf(stderr, "Unknown option %c\n", command);
                exit(EXIT_FAILURE);
        }
    }

    struct sensor_suite *sensors = init_sensor_suite(detect_cpu_designer(), ctx.core_count);
    if (!sensors) {
        fprintf(stderr, "Failed to initialize sensor suite\n");
        exit(EXIT_FAILURE);
    }

    char *cpu_model = identify_cpu();

    init_gui();

    while (1) {
        command = kbhit();
        switch (command) {
            case 'p':
                display_power_config_flag = display_power_config_flag ^ 1; break;
            default:
                sleep(POLL_INTERVAL_S);
        }

        poll_sensors(sensors, &ctx);
        render_frame(sensors, cpu_model, &ctx);
    }

    return EXIT_SUCCESS;
}
