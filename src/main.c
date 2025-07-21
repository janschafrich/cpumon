
/* cpumon (c) Jan-Eric Schäfrich
 * a tool to read current processors values continously and print them to the terminal
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


long history_cntr = 0;
long period_cntr = 0;
bool display_power_config_flag = 1;
bool display_moving_average_flag = 0;
enum cpu_designer cpu = AMD;

extern int core_count;
extern bool running_with_privileges;

float freq_his[AVG_WINDOW];
float load_his[AVG_WINDOW];
float temp_his[AVG_WINDOW];
float voltage_his[AVG_WINDOW];
float power_his[AVG_WINDOW];



int main (int argc, char **argv)
{   
    init_environment();

    struct sensor_suite *sensors = init_sensor_suite(cpu, core_count);
    if (!sensors) {
        fprintf(stderr, "Failed to initialize sensor suite\n");
        exit(EXIT_FAILURE);
    }

    char *cpu_model = identifiy_cpu();
    
    int command;

    while ((command =getopt(argc, argv, "c:hmps")) != -1){
        switch (command) {
            case 'p':
                display_power_config_flag = 1; break;
            case 'a':
                display_moving_average_flag = 1; break;
            case 'h': 
                //printf("\t-a    : calculates a moving average over the last minute\n");
                printf("\t-p    : displays performance and power configurations\n");
			    printf("\t-h    : displays this help\n");
			    exit(EXIT_SUCCESS);
            default:
			    fprintf(stderr,"Unknown option %c\n",command); exit(EXIT_FAILURE);
        }
    }

    init_gui();


    // int gpu_freq;
  
    // ------------------------------ run infinitely ------------------------------------------ //
    while (1) {
        
        command = kbhit();
        switch (command) {
            case 'p':
                display_power_config_flag = display_power_config_flag ^ 1; break;
            default: 
                sleep(POLL_INTERVAL_S);
        }
        
        read_sensors(sensors);

        if (history_cntr < (AVG_WINDOW/POLL_INTERVAL_S - 1) )    // for last minute history
        {   
            history_cntr++;                     // use as array index
        } else {
            history_cntr = 0;                    // reset index
        }
        period_cntr += 1;
        
        update_sensor_suite_statistics(sensors);

        // ------------------  output to terminal ------------------------------
        
        clear();

#if DEBUG_ENABLE
        printw("CPU Time Uint = %f W\n", sensors->cpu->power->time_unit);
        printw("CPU Energy Uint = %f W\n", sensors->cpu->power->energy_unit);
        printw("CPU POWER Uint = %f W\n", sensors->cpu->power->power_unit);
#endif

        attron(A_BOLD);
        printw("\n\t\t%s\n\n", cpu_model);
        attroff(A_BOLD);
        
        if (running_with_privileges == TRUE)
        {
            printw("Core    f/MHz \tC0%%   Temp/°C\t U/V\n");
            printw("------------------------------------\n");
            for (int core = 0; core < core_count; core++)
            {   
                printw("%2d \t%.0f\t%2.f\t%.f\t%.2f\n", 
                    core, 1000*sensors->cpu->freq->stats->present[core], sensors->cpu->load->stats->present[core], sensors->cpu->temperature->stats->present[core], sensors->cpu->voltage->stats->present[core]);
            }
            printw("\n");
            //printw("CPU\t%.2f\t%.2f\t%.1f\t%.2f\t60-s-avg\n", sensors->cpu->->stats->cpu_avg, sensors->cpu->load->stats->cpu_avg, sensors->cpu->temperature->stats->cpu_avg, sensors->cpu->voltage->stats->cpu_avg); 
            printw("avg\t%.0f\t%.2f\t%.1f\t%.2f\n", 
                sensors->cpu->freq->stats->runtime_avg*1000, 
                sensors->cpu->load->stats->runtime_avg, sensors->cpu->temperature->stats->runtime_avg, sensors->cpu->voltage->stats->runtime_avg);
            printw("min\t%.0f\t%.2f\t%.0f\t%.2f\n", 
                sensors->cpu->freq->stats->min*1000, 
                sensors->cpu->load->stats->min, 
                sensors->cpu->temperature->stats->min, 
                sensors->cpu->voltage->stats->min);
            printw("max\t%.0f\t%.1f\t%.0f\t%.2f\n", 
                sensors->cpu->freq->stats->max*1000, 
                sensors->cpu->load->stats->max, 
                sensors->cpu->temperature->stats->max, 
                sensors->cpu->voltage->stats->max);
            if (display_moving_average_flag == TRUE)
            {
                compute_moving_average(history_cntr, freq_his, load_his, temp_his, voltage_his, power_his);   
            }
            printw("\n");
            printw("\tPkg Power: %.2f W, avg: %.2f W\n",
                sensors->cpu->power->per_domain[PKG], sensors->cpu->power->stats->runtime_avg);
            draw_power(sensors->cpu->power->per_domain, sensors->cpu->power->n_domains, sensors->cpu->power->stats->runtime_avg, cpu);
            printw("\n");
            printw("GPU\t\t%.0f mV\t%.2f W\t%0.f °C\n", 
                sensors->gpu->voltage->stats->present[0], 
                sensors->gpu->power->stats->present[0]/1e6,
                sensors->gpu->temperature->stats->present[0]/1e3);
            printw("Northbridge\t%0.f mV", sensors->gpu->voltage->northbridge);
            printw("\n");
            // if (print_fanspeed() != 0)
            // {
            //     printw("Error accessing the embedded controller. Check if ectool is accessible via commandline.\n");
            // }
        } 
        else
        {
            printw("To monitor all metrics, pls run as root.\n\n");

            printw("Core\tf/GHz \tC0%% \n");
            for (int i = 0; i < core_count; i++){   
                printw("%d \t%.1f\t%.f\n", i, sensors->cpu->freq->stats->present[i], sensors->cpu->load->stats->present[i]);
            }
            printw("\n");
            printw("avg\t%.2f\t%.2f\n", sensors->cpu->freq->stats->runtime_avg, sensors->cpu->load->stats->runtime_avg);
            printw("min\t%.2f\t\n", sensors->cpu->freq->stats->min);
            printw("max\t%.2f\t\n", sensors->cpu->freq->stats->max);
            //printw("\nCPU\t%.2f\t%.2f\t60-s-avg\n", sensors->cpu->freq->cpu_avg, sensors->cpu->->stats->cpu_avg);
        }

        printw("\n");
        printw("---------- Battery (%s) ----------\n", sensors->battery->status);
        printw("    now      avg      min      max\n");
        printw("  %.2f W   %.2f W   %.2f W   %.2f W\n", sensors->battery->stats->present[0], sensors->battery->stats->runtime_avg, sensors->battery->stats->min, sensors->battery->stats->max);
        printw("\n");
        if (display_power_config_flag == TRUE)
        {
            get_power_config(running_with_privileges, sensors->cpu->designer);
        } 

        // if (running_with_privileges == TRUE)
        // {
        //     attron(COLOR_PAIR(RED));
        //     get_msr_power_limits_w(core_count);
        //     attroff(COLOR_PAIR(RED));
        // } 
    }
    return (EXIT_SUCCESS);

}


