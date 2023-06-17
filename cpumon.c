#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <locale.h>
#include <unistd.h>                 // uid_t
#include <sys/types.h>
#include <dirent.h>
#include <errno.h>
#include <fcntl.h>                  // open()
#include <sys/stat.h>               // open()
#include "cpumonlib.h"


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
    int period_counter = 0;
    
    char *file[20];
    char *bar[30];
    char *path;
    int *temp, *load, gpu_freq;

    float *freq, *voltage;
    long *power;

    long long *work_jiffies_before = malloc((core_count+1) * sizeof(*work_jiffies_before));                  // store for next interval
    long long *total_jiffies_before = malloc((core_count+1) * sizeof(*total_jiffies_before));

    static float freq_his[AVG_WINDOW];
    static int load_his[AVG_WINDOW];
    static int temp_his[AVG_WINDOW];
    static float voltage_his[AVG_WINDOW];
    static float power_his[AVG_WINDOW];

    const uid_t root = geteuid();

    char *cpu_model[1];
    *cpu_model = identifiy_cpu();  

    int c;

    while ((c =getopt(argc, argv, "c:hmps")) != -1){
        switch (c) {
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
			    fprintf(stderr,"Unknown option %c\n",c); exit(EXIT_FAILURE);
        }
    }
    
    while (1) {
        
        printf(CLEAR);                 // clear console

        if (root != 0){
            printf("To monitor all metrics, pls run as root.\n\n");
            printf("CPU Cores: %d\n", core_count);
        }
        
        printf(BOLD "\n\t\t%s\n\n" BOLD_OFF, *cpu_model);

        freq = freq_ghz(core_count);
        load = cpucore_load(core_count, work_jiffies_before, total_jiffies_before);
        temp = temp_core_c(core_count);

        freq_his[period_counter] = *freq;
        load_his[period_counter] = *load;
        temp_his[period_counter] = *temp;

        gpu_freq = gpu();
        
        if (root == 0) {
            voltage = voltage_v(core_count);
            power = power_uw();

            voltage_his[period_counter] = *voltage;
            power_his[period_counter] = *power*1e-6;
            
            if (period_counter == 1){
                power_his[0] = *power*1e-6;      // over write the first (wrong) power calculation, so that it doesnt affect the avg as much
            }
        }

        if (period_counter < AVG_WINDOW/POLL_INTERVAL_S){   // for last minute history
            period_counter++;
        } else {
            period_counter = 0;                    // reset index
        }

        // ------------------  output to terminal ------------------------------
        if (root == 0) {
            printf("       f/GHz \tC0%%   Temp/°C\tU/V\n");
            printf("-------------------------------------\n");
            for (int i = 0; i < core_count; i++){   
                printf("Core %d \t%.1f\t%-d\t%d\t%.2f\n", i, freq[i], load[i], temp[i], voltage[i]);
            }
            printf("\nCPU\t%.1f\t%d\t%d\t%.2f\tcurrent avg\n", freq[core_count], load[core_count], temp[core_count], voltage[core_count]);
        
            if (display_moving_average_flag == 1) {
                moving_average(period_counter, freq_his, load_his, temp_his, voltage_his, power_his);   
            }
        
            printf("\nGPU\t%d MHz\t\t%.2f W\n\n", gpu_freq, ((float)power[2])*1e-6);
            draw_power(power);

            *file = read_string("/sys/class/power_supply/BAT1/status");
            printf("\nBattery power draw = %.2f W (%s)\n", ((double)power[3])*1e-12, *file);

            if (print_fanspeed() != 0) {
                printf("Error accessing the embedded controller. Check if ectool is installed.\n");
            }

            if (display_power_config_flag == 1) {
                power_config();
            } 
            power_limit_msr(core_count);
        } 
        else // --------------   non root ----------------------------- in Visual Code debugging requires non root 
        {
            printf("\tf/GHz \tC0%% \tTemp/°C\n");
            for (int i = 0; i < core_count; i++){   
                printf("Core %d \t%.1f\t%d\t%d\n", i, freq[i], load[i], temp[i]);
            }
            printf("\nCPU\t%.1f\t%d\t%d\n", freq[core_count], load[core_count], temp[core_count]);
            printf("\nGPU\t%d\n", gpu_freq);
            printf("\nPkg: \t\t%d %%\n", load[core_count]); 
            power_config();
        }


       sleep (POLL_INTERVAL_S);
    }
    return (EXIT_SUCCESS);

}
