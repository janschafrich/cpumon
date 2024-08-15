
// General functions that answer requests from main


#include <stdio.h>                   // printf
#include <stdlib.h>                 // malloc
#include <string.h>                 // strlen
#include <stdint.h>
#include <locale.h>
#include <unistd.h>                 // cpus online
#include <math.h>
#include <ncurses.h>
#include "../include/cpumonlib.h"
#include "../include/machine_specific_registers.h"
#include "../include/sysfs.h"


extern long period_counter;
extern long poll_cycle_counter;
extern bool display_power_config_flag;
extern bool display_moving_average_flag;

int core_count = 0;
char charging_status_before[BATTERY_STATUS_BUF_SIZE];
bool running_with_privileges;

extern float freq_his[AVG_WINDOW];
extern float load_his[AVG_WINDOW];
extern float temp_his[AVG_WINDOW];
extern float voltage_his[AVG_WINDOW];
extern float power_his[AVG_WINDOW];


void init_environment(void)
{
    FILE *fp;
    if ((fp = popen("sudo modprobe msr", "r")) == NULL)
    {
        printf("Error modprobe msr\n");
    }
    
    setlocale(LC_NUMERIC, "");

    core_count = sysconf(_SC_NPROCESSORS_ONLN);
    if (core_count == -1)
    {
        fprintf(stderr, "Could not determine CPU core count from sysconf\n");
    }

    running_with_privileges = FALSE;
    if (geteuid() == 0)
    {
        running_with_privileges = TRUE; 
    } 
}

int init_sensors(cpu_designer_e designer)
{
    return 0;
}


char *read_string(const char *filepath)     // function from data type pointer
{     
#if DEBUG_ENABLE
        printf("read_string filepath = %s\n", filepath);
#endif
    FILE *fp = fopen(filepath, "r");
    static char file_buf[BUFSIZE];          // allocate memory on the heap to store file content 
    int i = 0;
    int single_character;

    if(fp == NULL) {
        perror("Error opening file\n");
        return NULL;
    }

    while ((single_character = fgetc(fp)) != EOF && i < BUFSIZE -1 ){
        if(single_character == '\n') {
            continue;           // skip newline characters
        } else {
            file_buf[i] = single_character;
        }
    i++;
    }

    file_buf[i] = '\0';                 // terminate string
    fclose(fp);

    return file_buf;                    // return address to file
}

int read_line(char *return_string, const char *filepath) 
{     
#if DEBUG_ENABLE
        printf("read_line filepath = %s\n", filepath);
#endif
    FILE *fp = fopen(filepath, "r");

    if(fp == NULL) {
        perror("Error opening file\n");
        return -1;
    } 
    if (fscanf(fp, "%s", return_string) == 1)
    {
        fclose(fp);
        return 0;
    }
    if (fscanf(fp, "%s", return_string) == EOF)
    {
        //printf("Couldnt read data from \"%s\"\n", filepath);
        fclose(fp);
        return -1;
    }

    fclose(fp);
    return -1;
                
}

void update_sensor_data(sensor* freq, sensor *load, sensor* temperature, sensor *voltage, float *power_per_domain, power *my_power, battery *my_battery)
{   
    
    sysfs_freq_ghz(freq->per_core, &freq->cpu_avg, core_count);
    freq->min = get_min_value(freq->min, freq->per_core, core_count);
    freq->max = get_max_value(freq->max, freq->per_core, core_count);
    freq->runtime_avg = runtime_avg(poll_cycle_counter, &freq->cumulative, &freq->cpu_avg);

    freq_his[period_counter] = freq->cpu_avg;

    get_sysfs_power_battery_w(&my_battery->power_now);
    get_battery_status(my_battery->status);
    reset_if_status_change(&my_battery->power_cumulative, my_battery->status, charging_status_before);
    my_battery->power_runtime_avg = runtime_avg(poll_cycle_counter, &my_battery->power_cumulative, &my_battery->power_now);
    my_battery->min = get_min_value(my_battery->min, &my_battery->power_now, 1);
    my_battery->max = get_max_value(my_battery->max, &my_battery->power_now, 1);

    if (running_with_privileges == TRUE)
    {
/*         msr_temperature_c(temperature->per_core, &temperature->cpu_avg, core_count);
        temperature->min = get_min_value(temperature->min, temperature->per_core, core_count);
        temperature->max = get_max_value(temperature->max, temperature->per_core, core_count);
        temperature->runtime_avg = runtime_avg(poll_cycle_counter, &temperature->cumulative, &temperature->cpu_avg);
        temp_his[period_counter] = temperature->cpu_avg;
        
        voltage_v(voltage->per_core, &voltage->cpu_avg, core_count);
        voltage->min = get_min_value(voltage->min, voltage->per_core, core_count);
        voltage->max = get_max_value(voltage->max, voltage->per_core, core_count);
        voltage->runtime_avg = runtime_avg(poll_cycle_counter, &voltage->cumulative, &voltage->cpu_avg);
        voltage_his[period_counter] = voltage->cpu_avg; */
        
/*         get_intel_msr_power_w(power_per_domain);
        power_his[period_counter] = *power_per_domain;
        if (period_counter == 1)
        {
            power_his[0] = *power_per_domain;      // over write the first (wrong) power calculation, so that it doesnt affect the avg as much
        } */

        get_amd_pck_power_w(power_per_domain);
//        rapl_msr_amd_core(my_power, core_count);
        power_his[period_counter] = *power_per_domain;
        if (period_counter == 1)
        {
            power_his[0] = *power_per_domain;      // over write the first (wrong) power calculation, so that it doesnt affect the avg as much
        }
        
        my_power->pkg_now = power_per_domain[0];
        my_power->pkg_runtime_avg = runtime_avg(poll_cycle_counter, &my_power->pkg_cumulative, &my_power->pkg_now);      

    }
}




// based on this example: https://stackoverflow.com/questions/43116/how-can-i-run-an-external-program-from-c-and-parse-its-output
int acc_cmdln(char *cmd){
    char buf[BUFSIZE];  // response buffer
    FILE *fp;

    if ((fp = popen(cmd, "r")) == NULL) {
        printf("cmd = %s\n", cmd);
        printf("Error opening pipe\n");
        return -1;
    }

    while (fgets(buf, BUFSIZE, fp) != NULL) {
        printf(" %s", buf);  // print response to console
    }

    if (pclose(fp) == -1) {
        printf("Command not found or exited with error status\n");
        return -1;
    }

    return 0;
}






void  moving_average(int i, float * freq, float *load, float *temp, float *voltage, float *power){

    i += 1;
    double freq_total = 0;
    long load_total = 0;
    long temp_total = 0;
    double voltage_total = 0;
    double power_total = 0;


    for (int j = 0; j < i; j++){
        freq_total += (double)freq[j];
        load_total += (long)load[j];
        temp_total += (long)temp[j];
        voltage_total += (double)voltage[j];
        power_total += (double)power[j];
    }

    if (i != 0){        // only divide is divisor is non zero
        printf("CPU\t%.1f\t%ld\t%ld\t%.2f\tlast minute avg\n", freq_total/i, load_total/i, temp_total/i, voltage_total/i );
        printf("Avg Pwr %.2f W\n", power_total/i);
    }
}

float runtime_avg(long poll_cycle_counter, float *samples_cumulative, float *sample_next){
    
    float avg = 0;
    *samples_cumulative += *sample_next;
    if (poll_cycle_counter != 0) 
    {
        avg = *samples_cumulative / (float) poll_cycle_counter;
    }

    return avg;
}


float get_min_value(float previous_min_value, float *sample_next, int sample_count)
{
    for (int i = 0; i < sample_count; i++)
        {
        if (sample_next[i] < previous_min_value) 
        {
            previous_min_value = sample_next[i];
        } 
    }
    return previous_min_value;
}

float get_max_value(float previous_max_value, float *sample_next, int sample_count)
{
    for (int i = 0; i < sample_count; i++)
        {
        if (sample_next[i] > previous_max_value) 
        {
            previous_max_value = sample_next[i];
        } 
    }
    return previous_max_value;
}

// requires ectool, a programm to communicate with the embedded controller build from this repository: https://github.com/DHowett/framework-ec
int print_fanspeed(void){  // based on this example: https://stackoverflow.com/questions/43116/how-can-i-run-an-external-program-from-c-and-parse-its-output
    char buf[BUFSIZE];  // response buffer
    FILE *fp;

    int duty = 0;
    if ((fp = popen("ectool pwmgetduty 0", "r")) == NULL) {
        printw("Error accessing the ectool. Error opening pipe\n");
        return -1;
    }
    while (fgets(buf, BUFSIZE, fp) != NULL) {
        sscanf(buf, "%*s%*s%*s%d", &duty);
        printw("Fan speed %d %% ", (100 * duty)/ 65536 );  // print response to console
    }
    if (pclose(fp)) {   // error
        return -1;
    }
    
    int rpm = 0;
    if ((fp = popen("ectool pwmgetfanrpm", "r")) == NULL) {
        printw("Error accessing the ectool. Error opening pipe\n");
        return -1;
    }
    while (fgets(buf, BUFSIZE, fp) != NULL) {
        sscanf(buf, "%*s%*d%*s%d", &rpm);
        printw("(%d RPM)\n", rpm);  // print response to console
    }
    if (pclose(fp)) {
        return -1;
    }

    return 0;
}

