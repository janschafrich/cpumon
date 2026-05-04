// monitored CPU values read from the Linux kernel sysfs


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ncurses.h>
#include "../include/utils.h"
#include "../include/cpumonlib.h"
#include "../include/sysfs.h"



char *identify_cpu(void)
{
    FILE *fp = fopen("/proc/cpuinfo", "r");
    if (fp == NULL) {
        perror("Error opening file /proc/cpuinfo");
        return (NULL);
    } 

    char file_buf[BUFSIZ];
    char *model = malloc(128);
    char *line;

    if (!model) {
        fclose(fp);
        return NULL;
    }
    model[0] = '\0';

    while(1) {
        line = fgets(file_buf, BUFSIZ, fp);
        if (line == NULL) break;

        if(!strncmp(line, "model name", 10)) {
            char *colon = strchr(line, ':');
            if (colon) {
                colon++;
                while (*colon == ' ') colon++;
                strncpy(model, colon, 127);
                model[127] = '\0';
                char *nl = strchr(model, '\n');
                if (nl) *nl = '\0';
            }
            break;
        }
    }

    fclose(fp);
    return model;
}

int * get_sysfs_power_limits_w(void)
{
    FILE *fp;
    char results[BUFSIZE];
    long power_uw[POWER_LIMIT_COUNT];
    static int power_limits[POWER_LIMIT_COUNT];
    char path[256];

    for ( int i = 0; i < POWER_LIMIT_COUNT; i++) {
        sprintf(path,"/sys/class/powercap/intel-rapl:0/constraint_%d_power_limit_uw",i);
        fp = fopen(path, "r");
        if (fp == NULL) {
#if DEBUG_ENABLE
            printf("get_sysfs_power_limits filepath %s\n", path);
#endif
            perror("Error opening file\n");
        }
        if (fgets(results,BUFSIZE, fp) == NULL)
        {
            printf("Couldn't read power from %s", path);
        }
        sscanf(results, "%ld", &power_uw[i]);
        fclose(fp);
    }

    for (int i = 0; i < POWER_LIMIT_COUNT; i++) {
        power_limits[i] = (int)(power_uw[i]/1000000);
    }
    return power_limits;
}

void get_power_config(bool running_with_privileges, enum cpu_designer designer)
{
    char buf[BUFSIZE];

    if (running_with_privileges == TRUE && designer == INTEL)
    {
        int *power_limits = get_sysfs_power_limits_w();
        printw("Power Limits: \t\tPL1 = %d W, PL2 = %d\n", power_limits[0], power_limits[1]);
    }

    if (read_sysfs_string("/sys/devices/system/cpu/cpu0/cpufreq/energy_performance_preference", buf, sizeof(buf)))
        printw("Energy-Performance-Preference: \t%s \n", buf);

    if (read_sysfs_string("/sys/devices/system/cpu/cpufreq/policy0/scaling_driver", buf, sizeof(buf)))
        printw("Scaling Driver: \t\t%s \n", buf);

    if (read_sysfs_string("/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor", buf, sizeof(buf)))
        printw("CPU Frequency Scaling Governor: %s \n", buf);

    if (designer == AMD)
    {
        if (read_sysfs_string("/sys/devices/system/cpu/amd_pstate/prefcore", buf, sizeof(buf)))
            printw("AMD Preferential Core: \t\t%s \n", buf);
    }
}


int get_sysfs_power_battery_w(float *battery_power)
{
    char read_value[12];
    char read_value2[12];
    
    if (read_sysfs_string("/sys/class/power_supply/BAT0/power_now", read_value, sizeof(read_value)))
    {
        long power_uw = 0;
        sscanf(read_value, "%ld", &power_uw);
        *battery_power = (float)power_uw * 1e-6;
        return 0;
    }
    if (read_sysfs_string("/sys/class/power_supply/BAT1/voltage_now", read_value, sizeof(read_value)) &&
        read_sysfs_string("/sys/class/power_supply/BAT1/current_now", read_value2, sizeof(read_value2)))
    {
        long voltage_uv = 0;
        sscanf(read_value, "%ld", &voltage_uv);
        long current_ua = 0;
        sscanf(read_value2, "%ld", &current_ua);
        *battery_power = (float)(voltage_uv * current_ua * 1e-12);
        return 0;
    }
    
    return -1;
}

int get_battery_status(char *status)
{
    // check for battery under multiple paths
    if (read_sysfs_string("/sys/class/power_supply/BAT0/status", status, 13))
        return 0;
    if (read_sysfs_string("/sys/class/power_supply/BAT1/status", status, 13))
        return 0;

    strcpy(status, "Status unknown");
    return -1;
}


void reset_if_status_changed(float *cumulative, char *status, char *status_before)
{
    if (strcmp(status, status_before) != 0)
    {
        *cumulative = 0;
        strcpy(status_before, status);
    }
}



void get_sysfs_freq_ghz(float *freq_ghz, float *average, int core_count) 
{

    char file_buf[BUFSIZE];
    char path[70];
    float total = 0;

    for (int i = 0; i < core_count; i++){
        sprintf(path, "/sys/devices/system/cpu/cpufreq/policy%d/scaling_cur_freq", i);
        if (read_sysfs_string(path, file_buf, sizeof(file_buf)))
        {
            freq_ghz[i] = (float)strtol(file_buf, NULL, 10) / 1000000;
            total += freq_ghz[i];
        }
        else
        {
            freq_ghz[i] = -1;
        }
    }

    *average = total / core_count;
}


void get_cpucore_load(float *load_per_core, float *average, int core_count) {

    //  load is calculated as a difference between two jiffy counts at different time stampts
    static long long *work_jiffies_before = NULL;
    static long long *total_jiffies_before = NULL;
    static int initialized_core_count = 0;
    
    char file_buf[BUFSIZ];
    long long user, nice, system, idle, iowait, irq, softirq;

    long long work_jiffies_after[core_count];
    long long total_jiffies_after[core_count];

    // read load per logical core
    FILE *fp = fopen("/proc/stat", "r");
    if (fp == NULL) {
        perror("Error opening file /proc/stat");
    }

    char *line = fgets(file_buf, BUFSIZ, fp);
    if (line == NULL) {
        printf("Error %s\n", file_buf);
    }

    for (int core = 0; core < core_count; core++) {
        line = fgets(file_buf, BUFSIZ, fp);
        if (line == NULL) {
            break;
        }
        
        char comparator[16];
        sprintf(comparator,"cpu%d ", core);
        
        if (!strncmp(line, comparator, 5)) {
            
            sscanf(line, "%*s %lld %lld %lld %lld %lld %lld %lld", &user, &nice, &system, &idle, &iowait, &irq, &softirq);
            
            work_jiffies_after[core] = user + nice + system;
            total_jiffies_after[core] = user + nice + system + idle + iowait + irq + softirq;
        } 
    }
    fclose(fp);

    if (work_jiffies_before == NULL) {
        initialized_core_count = core_count;
        work_jiffies_before = malloc(sizeof(long long) * initialized_core_count);
        total_jiffies_before = malloc(sizeof(long long) * initialized_core_count);
    }

    // two baseline readings needed before deltas are meaningful
    static int warmup = 2;
    if (warmup > 0) {
        --warmup;
        for (int i = 0; i < initialized_core_count; i++) {
            work_jiffies_before[i] = work_jiffies_after[i];
            total_jiffies_before[i] = total_jiffies_after[i];
        }
        return;
    }
        

    // Calculate load for each core (from third call onwards)
    float total = 0;
    for (int core = 0; core < initialized_core_count; core++) {
        long long work_diff = work_jiffies_after[core] - work_jiffies_before[core];
        long long total_diff = total_jiffies_after[core] - total_jiffies_before[core];
        
        if (total_diff > 0) {
            load_per_core[core] = (float)(100.0 * work_diff) / (float)total_diff;
        } else {
            load_per_core[core] = 0.0; // No time passed, assume 0% load
        }
        
        total += load_per_core[core];
    }

    *average = total / (float)initialized_core_count;

    for (int i = 0; i < initialized_core_count; i++) {
        work_jiffies_before[i] = work_jiffies_after[i];
        total_jiffies_before[i] = total_jiffies_after[i];
    }

}


int read_gpu(void){
    
    char file_buf[BUFSIZE];

    if (read_sysfs_string("/sys/class/drm/card0/gt_cur_freq_mhz", file_buf, sizeof(file_buf)))
        return atoi(file_buf);
    return -1;
    

/*     FILE *fp = fopen("/sys/class/drm/card0/gt_cur_freq_mhz", "r");
    if (fp == NULL){
        perror("Error opening /sys/class/drm/card0/gt_cur_freq_mhz\n");
    }
    if (fgets(file_buf, BUFSIZE, fp) == NULL)
    {
        printf("Couldnt read GPU frequency from \"/sys/class/drm/card0/gt_cur_freq_mhz\"\n");
    }
    sscanf(file_buf, "%d", &freq_mhz);
    fclose(fp); */

}


int get_amdgpu_hwmon_id() 
{
    uint8_t n_hwmon = 15;   // random guess
    char file_buf[20];
    char path[70];

    static int8_t hwmon_id;
    static bool initialized = FALSE;
    
    if (!initialized)
    {
        for (int i = 0; i < n_hwmon; i++){
            sprintf(path, "/sys/class/hwmon/hwmon%d/name", i);

            hwmon_id = -1;
            if (read_sysfs_string(path, file_buf, 20) != NULL)
            {
                if (strncmp(file_buf, "amdgpu", 6) == 0)
                {
                    hwmon_id = i;
                    initialized = TRUE;
                    break;
                }
            }
        }
    }

    return hwmon_id;
}



int get_amdgpu_value(float *freq_mhz, char *interface) 
{
    char file_buf[20];
    char path[70];
        
    int8_t hwmon_id = get_amdgpu_hwmon_id();
    
    if (hwmon_id >= 0)
    {
        sprintf(path, "/sys/class/hwmon/hwmon%d/%s", hwmon_id, interface);
        if (read_sysfs_string(path, file_buf, 20) != NULL)
        {
            *freq_mhz = strtof(file_buf, NULL); // Convert string to float
            return 0;
        }
    }
    return -1;
}


int get_amdgpu_voltage_mV(float *voltage)
{
    // According to the kernel documentation in0_input is the GPU voltage in millivolts.
    if (get_amdgpu_value(voltage, "in0_input") == 0) 
    {
        return 0;
    }
    return -1;
}

int get_amdgpu_northbridge_mV(float *value)
{
    // According to the kernel documentation this is the SoC power in microwatts.
    if (get_amdgpu_value(value, "in1_input") == 0) 
    {
        return 0;
    }
    return -1;
}

int get_amdgpu_soc_power_uW(float *power)
{
    // According to the kernel documentation this is the SoC power in microwatts.
    if (get_amdgpu_value(power, "power1_input") == 0) 
    {
        return 0;
    }
    return -1;
}

int get_amdgpu_temperature_mC(float *value)
{
    // According to the kernel documentation this is the GPU temperature in millicelsius.
    if (get_amdgpu_value(value, "temp1_input") == 0) 
    {
        return 0;
    }
    return -1;
}






