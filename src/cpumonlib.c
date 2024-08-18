
// General functions that answer requests from main


#include <stdio.h>                   // printf
#include <stdlib.h>                 // malloc
#include <string.h>                 // strlen
#include <stdint.h>
#include <locale.h>
#include <unistd.h>                 // cpus online
#include <math.h>
#include <ncurses.h>
#include "../include/utils.h"
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

void *init_sensor(int core_count)
{
    sensor_s *sensor = malloc( sizeof(sensor_s) + core_count * sizeof(sensor->per_core[0]) );
    if (sensor == NULL)
    {
        fprintf(stderr, "Memory allocation for \"sensor\" failed\n");
    }
    *sensor = (sensor_s) {.min = 1000, .max = 0}; 
    
    return sensor;
}

void *init_sensor_power(cpu_designer_e cpu_designer, int core_count)
{
    
    power_s *power;
    float *core_enrgy_bfr, *core_enrgy_aftr, *domains;
    switch (cpu_designer)
    {
        case INTEL: 
            power = malloc(sizeof(power_s)); 
            power->n_domains = 3;      // PKG, CORES, GPU
            break;
        case AMD : 
            power = malloc( sizeof(power_s)    + core_count * sizeof(power->per_core[0]) );
            if (power == NULL)
            {
                fprintf(stderr, "Memory allocation for power failed\n");
            }

            core_enrgy_bfr = malloc( sizeof(*core_enrgy_bfr) * core_count/2);
            if (core_enrgy_bfr == NULL)
            {
                fprintf(stderr, "Memory allocation for core_energy_before failed\n");
                free(power); // Clean up previously allocated memory
            }

            core_enrgy_aftr = malloc( sizeof(*core_enrgy_aftr) * core_count/2);
            if (core_enrgy_aftr == NULL)
            {
                fprintf(stderr, "Memory allocation for core_energy_after failed\n");
                free(core_enrgy_bfr); // Clean up previously allocated memory
                free(power);
            }
            power->core_energy_before = core_enrgy_bfr;
            power->core_energy_after = core_enrgy_aftr;
            power->n_domains = 2;      // PKG, CORES
            break;
        default: 
            power = malloc(sizeof(power_s)); 
            
            break;
    }
    domains = malloc( sizeof(*domains) * power->n_domains);
    power->per_domain = domains;
    if (running_with_privileges == TRUE)
    {
        get_msr_core_units(power, cpu_designer);
    }
    
    return power;
}


void *init_sensor_battery()
{
    battery_s *battery = malloc(sizeof(battery_s));
    if (battery == NULL)
    {
        fprintf(stderr, "Memory allocation for \"battery\" failed\n");
    }
    *battery = (battery_s) {.min = 1000, .max = 0};
    
    return battery;
}


void update_sensor_data(sensor_s* freq, sensor_s *load, sensor_s* temperature, sensor_s *voltage, float *power_per_domain, power_s *power, battery_s *battery, cpu_designer_e designer)
{   
    
    sysfs_freq_ghz(freq->per_core, &freq->cpu_avg, core_count);
    freq->min = get_min_value(freq->min, freq->per_core, core_count);
    freq->max = get_max_value(freq->max, freq->per_core, core_count);
    freq->runtime_avg = runtime_avg(poll_cycle_counter, &freq->cumulative, &freq->cpu_avg);

    freq_his[period_counter] = freq->cpu_avg;

    get_sysfs_power_battery_w(&battery->power_now);
    get_battery_status(battery->status);
    reset_if_status_change(&battery->power_cumulative, battery->status, charging_status_before);
    battery->power_runtime_avg = runtime_avg(poll_cycle_counter, &battery->power_cumulative, &battery->power_now);
    battery->min = get_min_value(battery->min, &battery->power_now, 1);
    battery->max = get_max_value(battery->max, &battery->power_now, 1);

    if (running_with_privileges == TRUE && designer == INTEL)
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


        
        power->per_domain[PKG] = power_per_domain[0];
        power->pkg_runtime_avg = runtime_avg(poll_cycle_counter, &power->pkg_cumulative, &power->per_domain[PKG]);      

    }
    if (running_with_privileges == TRUE && designer == AMD)
    {
        get_amd_pkg_power_w(&power->per_domain[PKG], power->energy_unit);
        get_amd_msr_core_power_w(power, core_count);
    }
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

