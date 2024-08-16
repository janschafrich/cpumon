
/* cpumon
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
#include "../include/machine_specific_registers.h"
#include "../include/sysfs.h"




long period_counter = 0;
long poll_cycle_counter = 0;
bool display_power_config_flag = 1;
bool display_moving_average_flag = 0;
cpu_designer_e cpu_designer = AMD;

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

    float power_per_domain[POWER_DOMAIN_COUNT];

    sensor *freq = init_sensor(core_count);
    sensor *load = init_sensor(core_count);
    sensor *temperature = init_sensor(core_count);
    sensor *voltage = init_sensor(core_count); 
    
    battery_s *battery = init_sensor_battery();

    power *my_power = init_sensor_power(AMD, core_count);
    
    long long *work_jiffies_before = malloc((core_count) * sizeof(*work_jiffies_before));                  // store for next interval
    long long *total_jiffies_before = malloc((core_count) * sizeof(*total_jiffies_before));

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


    int gpu_freq;
  
    // ------------------------------ run infinitely ------------------------------------------ //
    while (1) {
        
        command = kbhit();
        switch (command) {
            case 'p':
                display_power_config_flag = display_power_config_flag ^ 1; break;
            default: 
                sleep(POLL_INTERVAL_S);
        }
        
        update_sensor_data(freq, load, temperature, voltage, power_per_domain, my_power, battery);

        cpucore_load(load->per_core, &load->cpu_avg, work_jiffies_before, total_jiffies_before, core_count);
        load->runtime_avg = runtime_avg(poll_cycle_counter, &load->cumulative, &load->cpu_avg);
        load_his[period_counter] = load->cpu_avg;
        
        gpu_freq = gpu();      

        if (period_counter < AVG_WINDOW/POLL_INTERVAL_S)    // for last minute history
        {   
            period_counter++;
        } else {
            period_counter = 0;                    // reset index
        }
        poll_cycle_counter += 1;
        
        

        // ------------------  output to terminal ------------------------------
        
        clear();

#if DEBUG_ENABLE
        // printw("Core 0 f = %.1f GHz\n", freq->per_core[0]);
        // printw("Core 0 C0%% = %.2f\n", load->per_core[0]);
        printw("Core 0 E bef = %.2f J\n", my_power->core_energy_before[0]);
        printw("Core 0 E after = %.2f J\n", my_power->core_energy_after[0]);
        printw("Core 0 P = %.2f W\n", my_power->per_core[0]);
        printw("All Core P = %.2f W\n", my_power->cores);
#endif

        attron(A_BOLD);
        printw("\n\t\t%s\n\n", cpu_model);
        attroff(A_BOLD);
        
        if (running_with_privileges == TRUE)
        {
            printw("Core    f/GHz \tC0%%   Temp/°C\tU/V\tP/W\n");
            printw("-------------------------------------\n");
            for (int core = 0; core < core_count; core++)
            {   
                printw("%d \t%.1f\t%.f\t%.f\t%.2f\t%.2f\n", core, freq->per_core[core], load->per_core[core], temperature->per_core[core], voltage->per_core[core] , my_power->per_core[core]);
            }
            printw("\n");
            //printw("CPU\t%.2f\t%.2f\t%.1f\t%.2f\t60-s-avg\n", freq->cpu_avg, load->cpu_avg, temperature->cpu_avg, voltage->cpu_avg); 
            printw("avg\t%.2f\t%.2f\t%.1f\t%.2f\n", freq->runtime_avg, load->runtime_avg, temperature->runtime_avg, voltage->runtime_avg);
            printw("min\t%.2f\t%.2f\t%.0f\t%.2f\n", freq->min, load->min, temperature->min, voltage->min);
            printw("max\t%.2f\t%.2f\t%.0f\t%.2f\n", freq->max, load->max, temperature->max, voltage->max);
            if (display_moving_average_flag == TRUE)
            {
                moving_average(period_counter, freq_his, load_his, temp_his, voltage_his, power_his);   
            }
            printw("\n");
            printw("Pwr Pkg = %.2f W\n", my_power->pkg_now);
            //draw_power(power_per_domain, my_power->pkg_runtime_avg);
            printw("\n");
            printw("GPU\t%d MHz\t\t%.2f W\n", gpu_freq, power_per_domain[2]);
            printw("\n");
            // if (print_fanspeed() != 0)
            // {
            //     printw("Error accessing the embedded controller. Check if ectool is accessible via commandline.\n");
            // }
        } 
        else
        {
            printw("To monitor all metrics, pls run as root.\n\n");

            printw("\t\tf/GHz \tC0%% \n");
            for (int i = 0; i < core_count; i++){   
                printw("Core \t%d \t%.1f\t%.f\n", i, freq->per_core[i], load->per_core[i]);
            }
            printw("\n");
            printw("avg\t\t%.2f\t%.2f\n", freq->runtime_avg, load->runtime_avg);
            printw("min\t\t%.2f\t\n", freq->min);
            printw("max\t\t%.2f\t\n", freq->max);
            //printw("\nCPU\t%.2f\t%.2f\t60-s-avg\n", freq->cpu_avg, load->cpu_avg);
        }

        printw("\n");
        printw("---------- Battery (%s) ----------\n", battery->status);
        printw("    now      avg      min      max\n");
        printw("  %.2f W   %.2f W   %.2f W   %.2f W\n", battery->power_now, battery->power_runtime_avg, battery->min, battery->max);
        printw("\n");
        if (display_power_config_flag == TRUE)
        {
            power_config(running_with_privileges, cpu_designer);
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


