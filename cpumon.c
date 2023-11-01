#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <locale.h>
#include <unistd.h>                 // uid_t sleep()
#include <sys/types.h>
#include <dirent.h>
#include <errno.h>
#include <fcntl.h>                  // open()
#include <sys/stat.h>               // open()
#include <ncurses.h>
#include "cpumonlib.h"
#include "guilib.h"



int main (int argc, char **argv)
{   
    FILE *fp;

    if ((fp = popen("sudo modprobe msr", "r")) == NULL) {
        printf("Error modprobe msr\n");
        return EXIT_FAILURE;
    }
    
    setlocale(LC_NUMERIC, "");

    int core_count = -1;
    core_count = (const int)sysconf(_SC_NPROCESSORS_ONLN);
    if (core_count == -1){
        fprintf(stderr, "Could not determine CPU core count from sysconf\n");
        exit(EXIT_FAILURE);
    }
    
    // flags
    bool display_power_config_flag = 0;
    bool display_moving_average_flag = 0;
    
    char *file[20];
    //char *bar[30];
    //char *path;
    int gpu_freq;

    long *power_per_domain;

    static long period_counter = 0;
    static long poll_cycle_counter = 0;

    static float power_pkg = 0;
    static float power_cumulative = 0;
    static float power_runtime_avg = 0;


    // TODO : create working structs
    sensor *freq = malloc( sizeof(sensor) + core_count * sizeof(freq->per_core[0]) ); 
    sensor *load = malloc( sizeof(sensor) + core_count * sizeof(load->per_core[0]) ); 
    sensor *temperature = malloc( sizeof(sensor) + core_count * sizeof(temperature->per_core[0]) ); 
    sensor *voltage = malloc( sizeof(sensor) + core_count * sizeof(voltage->per_core[0]) ); 

        long long *work_jiffies_before = malloc((core_count) * sizeof(*work_jiffies_before));                  // store for next interval
    long long *total_jiffies_before = malloc((core_count) * sizeof(*total_jiffies_before));

    static float freq_his[AVG_WINDOW];
    static int load_his[AVG_WINDOW];
    static int temp_his[AVG_WINDOW];
    static float voltage_his[AVG_WINDOW];
    static float power_his[AVG_WINDOW];

    bool running_with_privileges = FALSE;
    if (geteuid() == 0) {
        running_with_privileges = TRUE; 
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

  
    while (1) {
        
        command = kbhit();
        switch (command) {
            case 'p':
                display_power_config_flag = display_power_config_flag ^ 1; break;
            default: 
                sleep(POLL_INTERVAL_S);
        }
        
        freq_ghz(freq->per_core, core_count);
        cpucore_load(load->per_core ,core_count, work_jiffies_before, total_jiffies_before);
        temp_core_c(temperature->per_core, core_count);

        freq->cpu_avg = calc_average(freq->per_core, core_count);
        load->cpu_avg = calc_average(load->per_core, core_count);
        temperature->cpu_avg = calc_average(temperature->per_core, core_count);

        freq->runtime_avg = runtime_avg(poll_cycle_counter, &freq->cumulative, &freq->cpu_avg);
        load->runtime_avg = runtime_avg(poll_cycle_counter, &load->cumulative, &load->cpu_avg);
        temperature->runtime_avg = runtime_avg(poll_cycle_counter, &temperature->cumulative, &temperature->cpu_avg);
                                                   
        freq_his[period_counter] = freq->cpu_avg;
        load_his[period_counter] = load->per_core;
        temp_his[period_counter] = temperature->per_core;

        gpu_freq = gpu();
        
        if (running_with_privileges == TRUE) {
            
            voltage_v(voltage->per_core, core_count);
            power_per_domain = power_uw();

            voltage->cpu_avg = calc_average(voltage->per_core, core_count);
            power_pkg = power_per_domain[0];
            
            voltage->runtime_avg = runtime_avg(poll_cycle_counter, &voltage->cumulative, &voltage->cpu_avg);
            power_runtime_avg = runtime_avg(poll_cycle_counter, &power_cumulative, &power_pkg);

            voltage_his[period_counter] = voltage->cpu_avg;
            power_his[period_counter] = *power_per_domain*1e-6;
            
            if (period_counter == 1){
                power_his[0] = *power_per_domain*1e-6;      // over write the first (wrong) power calculation, so that it doesnt affect the avg as much
            }
        }
        

        if (period_counter < AVG_WINDOW/POLL_INTERVAL_S){   // for last minute history
            period_counter++;
        } else {
            period_counter = 0;                    // reset index
        }
        poll_cycle_counter += 1;
        

        // ------------------  output to terminal ------------------------------
        
        clear();

        attron(A_BOLD);
        printw("\n\t\t%s\n\n", cpu_model);
        attroff(A_BOLD);
        
        
        if (running_with_privileges == TRUE) {
            printw("       f/GHz \tC0%%   Temp/°C\tU/V\n");
            printw("-------------------------------------\n");
            for (int i = 0; i < core_count; i++){   
                printw("Core %d \t%.1f\t%.f\t%.f\t%.2f\n", i, freq->per_core[i], load->per_core[i], temperature->per_core[i], voltage->per_core[i]);
            }
            
            printw("\nCPU\t%.1f\t%.1f\t%.f\t%.2f\tcurrent avg\n", freq->cpu_avg, load->cpu_avg, temperature->cpu_avg, voltage->cpu_avg); 
            printw("CPU\t%.1f\t%.1f\t%.f\t%.2f\truntime avg\n", freq->runtime_avg, load->runtime_avg, temperature->runtime_avg, voltage->runtime_avg);
                                                                           
            if (display_moving_average_flag == TRUE) {
                moving_average(period_counter, freq_his, load_his, temp_his, voltage_his, power_his);   
            }
        
            printw("\nGPU\t%d MHz\t\t%.2f W\n\n", gpu_freq, ((float)power_per_domain[2])*1e-6);
            draw_power(power_per_domain);

            *file = read_string("/sys/class/power_supply/BAT1/status");
            printw("\n\nBattery power draw = %.2f W (%s)\n", ((double)power_per_domain[3])*1e-12, *file);

            if (print_fanspeed() != 0) {
                printw("Error accessing the embedded controller. Check if ectool is accessible via commandline.\n");
            }

            if (display_power_config_flag == TRUE) {
                power_config();
            } 
            attron(COLOR_PAIR(RED));
            power_limit_msr(core_count);
            attroff(COLOR_PAIR(RED));
        } 

        
        
        // for debugging purposes, in Visual Code debugging works not in root mode
        if (running_with_privileges == FALSE) 
        {       
            printw("To monitor all metrics, pls run as root.\n\n");

            printw("\tf/GHz \tC0%% \tTemp/°C\n");
            for (int i = 0; i < core_count; i++){   
                printw("Core %d \t%.1f\t%.f\t%.f\n", i, freq->per_core[i], load->per_core[i], temperature->per_core[i]);
            }
            printw("\nCPU\t%.1f\t%.1f\t%.f\tcurrent avg\n", freq->cpu_avg, load->cpu_avg, temperature->cpu_avg);
            printw("CPU\t%.1f\t%.1f\t%.f\truntime avg\n", freq->runtime_avg, load->runtime_avg, temperature->runtime_avg);
            printw("\nGPU\t%d\n", gpu_freq);
    
            if (display_power_config_flag == TRUE){
                power_config();
            }
            
        }

    }
    return (EXIT_SUCCESS);

}
