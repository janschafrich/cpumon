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

    int core_count = (int)sysconf(_SC_NPROCESSORS_ONLN);
    (const int)core_count;
    
    // flags
    int display_power_config_flag = 0;
    int display_moving_average_flag = 0;
    
    
    char *file[20];
    char *bar[30];
    char *path;
    int gpu_freq;

    float *freq_per_core, *load_per_core, *temp_per_core, *voltage_per_core;
    long *power_per_domain;

    long long *work_jiffies_before = malloc((core_count) * sizeof(*work_jiffies_before));                  // store for next interval
    long long *total_jiffies_before = malloc((core_count) * sizeof(*total_jiffies_before));

    static long period_counter = 0;
    static long poll_cycle_counter = 0;

    static float power_pkg = 0;
    static float power_cumulative = 0;
    static float power_runtime_avg = 0;

    struct sensor* freq = create_sensor(freq);
    struct sensor* load = create_sensor(load);
    struct sensor* temp = create_sensor(temp);
    struct sensor* voltage = create_sensor(voltage);

    static float freq_his[AVG_WINDOW];
    static int load_his[AVG_WINDOW];
    static int temp_his[AVG_WINDOW];
    static float voltage_his[AVG_WINDOW];
    static float power_his[AVG_WINDOW];

    int running_with_privileges;

    if (geteuid() == 0) {
        running_with_privileges = 1; 
    } 
    else {
        running_with_privileges = 0;
    }

    char *cpu_model[1];
    *cpu_model = identifiy_cpu();  

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
        
        freq_per_core = freq_ghz(core_count);
        load_per_core = cpucore_load(core_count, work_jiffies_before, total_jiffies_before);
        temp_per_core = temp_core_c(core_count);

        freq->cpu_avg = calc_average(freq_per_core, core_count);
        load->cpu_avg = calc_average(load_per_core, core_count);
        temp->cpu_avg = calc_average(temp_per_core, core_count);

        freq->runtime_avg = runtime_avg(poll_cycle_counter, &freq->cumulative, &freq->cpu_avg);
        load->runtime_avg = runtime_avg(poll_cycle_counter, &load->cumulative, &load->cpu_avg);
        temp->runtime_avg = runtime_avg(poll_cycle_counter, &temp->cumulative, &temp->cpu_avg);
                                                   
        freq_his[period_counter] = *freq_per_core;
        load_his[period_counter] = *load_per_core;
        temp_his[period_counter] = *temp_per_core;

        gpu_freq = gpu();

        if (running_with_privileges == 1) {
            
            voltage_per_core = voltage_v(core_count);
            power_per_domain = power_uw();

            voltage->cpu_avg = calc_average(voltage_per_core, core_count);
            power_pkg = power_per_domain[0];
            
            voltage->runtime_avg = runtime_avg(poll_cycle_counter, &voltage->cumulative, &voltage->cpu_avg);
            power_runtime_avg = runtime_avg(poll_cycle_counter, &power_cumulative, &power_pkg);

            voltage_his[period_counter] = *voltage_per_core;
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
        printw("\n\t\t%s\n\n", *cpu_model);
        attroff(A_BOLD);
        
        if (running_with_privileges == 1) {
            printw("       f/GHz \tC0%%   Temp/°C\tU/V\n");
            printw("-------------------------------------\n");
            for (int i = 0; i < core_count; i++){   
                printw("Core %d \t%.1f\t%.f\t%.f\t%.2f\n", i, freq_per_core[i], load_per_core[i], temp_per_core[i], voltage_per_core[i]);
            }
            
            printw("\nCPU\t%.1f\t%.1f\t%.f\t%.2f\tcurrent avg\n", freq->cpu_avg, load->cpu_avg, temp->cpu_avg, voltage->cpu_avg); 
            printw("CPU\t%.1f\t%.1f\t%.f\t%.2f\truntime avg\n", freq->runtime_avg, load->runtime_avg, temp->runtime_avg, voltage->runtime_avg);
                                                                           
            if (display_moving_average_flag == 1) {
                moving_average(period_counter, freq_his, load_his, temp_his, voltage_his, power_his);   
            }
        
            printw("\nGPU\t%d MHz\t\t%.2f W\n\n", gpu_freq, ((float)power_per_domain[2])*1e-6);
            draw_power(power_per_domain);

            *file = read_string("/sys/class/power_supply/BAT1/status");
            printw("\n\nBattery power draw = %.2f W (%s)\n", ((double)power_per_domain[3])*1e-12, *file);

            if (print_fanspeed() != 0) {
                printw("Error accessing the embedded controller. Check if ectool is accessible via commandline.\n");
            }

            if (display_power_config_flag == 1) {
                power_config();
            } 
            attron(COLOR_PAIR(RED));
            power_limit_msr(core_count);
            attroff(COLOR_PAIR(RED));
        } 
        
        // for debugging purposes, in Visual Code debugging works not in root mode
        if (running_with_privileges == 0) 
        {       
            printw("To monitor all metrics, pls run as root.\n\n");

            printw("\tf/GHz \tC0%% \tTemp/°C\n");
            for (int i = 0; i < core_count; i++){   
                printw("Core %d \t%.1f\t%.f\t%.f\n", i, freq_per_core[i], load_per_core[i], temp_per_core[i]);
            }
            printw("\nCPU\t%.1f\t%.1f\t%.f\tcurrent avg\n", freq->cpu_avg, load->cpu_avg, temp->cpu_avg);
            printw("CPU\t%.1f\t%.1f\t%.f\truntime avg\n", freq->runtime_avg, load->runtime_avg, temp->runtime_avg);
            printw("\nGPU\t%d\n", gpu_freq);
    
            if (display_power_config_flag == 1){
                power_config();
            }
            
        }

    }
    return (EXIT_SUCCESS);

}
