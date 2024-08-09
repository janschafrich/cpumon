// monitored CPU values read from the Linux kernel sysfs


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ncurses.h>
#include "cpumonlib.h"
#include "sysfs.h"



char *identifiy_cpu(void)
{
    FILE *fp = fopen("/proc/cpuinfo", "r");
    if (fp == NULL) {
        perror("Error opening file /proc/cpuinfo");
        return (NULL);
    } 

    char file_buf[BUFSIZ];
    char *model = malloc ((sizeof *model) * 15);
    char *line;
    
    
    while(1) {
        line = fgets(file_buf, BUFSIZ, fp);
        if (line == NULL) break;
    
        if(!strncmp(line, "model name", 10)) {
            sscanf(line,"%*s%*s%*s%*s%*s%*s%*s%s", model);         // every whitespace starts a new string, asterisk = ignore
            break;
        //} else {
        //    printf("Error reading CPU model name from /proc/cpuinfo\n");
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

void power_config(bool running_with_privileges, cpu_designer_e designer)
{
    if (running_with_privileges == TRUE)
    {
        int *power_limits = get_sysfs_power_limits_w();
        printw("Power Limits: \t\tPL1 = %d W, PL2 = %d\n", power_limits[0], power_limits[1]);
    }


    char *file = read_string("/sys/devices/system/cpu/intel_pstate/no_turbo");

    // if (strncmp(file, "0", 1) == 0) {
    //     printw("Turbo: \t\t\t\tenabled\n");     
    // } else {
    //     printw("Turbo: \t\t\t\tdisabled\n");
    // }
    
    file = read_string("/sys/devices/system/cpu/cpu0/cpufreq/energy_performance_preference");
    printw("Energy-Performance-Preference: \t%s \n", file);

    file = read_string("/sys/devices/system/cpu/cpufreq/policy0/scaling_driver");
    printw("Scaling Driver: \t\t%s \n",file);
    
    file = read_string("/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor");
    printw("CPU Frequency Scaling Governor: %s \n", file);   

    if (designer = AMD)
    {
        file = read_string("/sys/devices/system/cpu/amd_pstate/prefcore");
        printw("AMD Preferential Core: \t\t%s \n", file);
    }
       
}

int get_sysfs_power_battery_w(float *battery_power)
{
    char read_value[12];
    char read_value2[12];
    
    if (read_line(read_value, "/sys/class/power_supply/BAT0/power_now") == 0)
    {
        long power_uw = 0;
        sscanf(read_value, "%ld", &power_uw);
        *battery_power = (float)power_uw * 1e-6;
    }
    if ((read_line(read_value,"/sys/class/power_supply/BAT1/voltage_now") == 0)  && (read_line(read_value2,"/sys/class/power_supply/BAT1/current_now") == 0))
    {
        long voltage_uv = 0;
        sscanf(read_value, "%ld", &voltage_uv);
        long current_ua = 0;
        sscanf(read_value2, "%ld", &current_ua);
        *battery_power = (float)(voltage_uv * current_ua * 1e-12);
    }
    
    return -1;
}

int get_battery_status(char *status)
{
    // check for battery under multiple paths
    if (read_line(status, "/sys/class/power_supply/BAT0/status") == 0)
    {
        return 0;
    } 
    else
    if  (read_line(status, "/sys/class/power_supply/BAT1/status") == 0)
    {
        return 0;
    }

    strcpy(status, "Status unknown");
    return -1;
}

void reset_if_status_change(float *cumulative, char *status, char *status_before)
{
    if (strcmp(status, status_before) != 0)
    {
        *cumulative = 0;
        strcpy(status_before, status);
    }
}



void sysfs_freq_ghz(float *freq_ghz, float *average, int core_count) 
{

    char file_buf[BUFSIZE];
    char path[70];
    float total = 0;

    for (int i = 0; i < core_count; i++){
        sprintf(path, "/sys/devices/system/cpu/cpufreq/policy%d/scaling_cur_freq", i);
        if (read_line(file_buf, path) == 0)
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


void cpucore_load(float *load, float * average, long long *work_jiffies_before, long long *total_jiffies_before, int core_count) {
    
    FILE *fp = fopen("/proc/stat", "r");
    if (fp == NULL) {
        perror("Error opening file /proc/stat");
    }

    char file_buf[BUFSIZ];
    char *line;
    long long user, nice, system, idle, iowait, irq, softirq;
    long long work_jiffies_after[core_count];
    long long total_jiffies_after[core_count];
    char comparator[16];
    float total = 0;

        line = fgets(file_buf, BUFSIZ, fp);
        if (line == NULL) {
            printf("Error %s\n", file_buf);
        }
        
        for (int core = 0; core < core_count; core++) {
            line = fgets(file_buf, BUFSIZ, fp);
            if (line == NULL) {
                break;
            }
            
            sprintf(comparator,"cpu%d ", core);
            
            if (!strncmp(line, comparator, 5)) {
                
                sscanf(line, "%*s %lld %lld %lld %lld %lld %lld %lld", &user, &nice, &system, &idle, &iowait, &irq, &softirq);
                
                work_jiffies_after[core] = user + nice + system;
                total_jiffies_after[core] = user + nice + system + idle + iowait + irq + softirq;
            } 
        }
    fclose(fp);

    // calculate the load
    for (int core = 0; core < (core_count); core++){
        if (total_jiffies_after[core] - total_jiffies_before[core] != 0) {        // only divide if we sure divisor is non zero
        load[core] = (float)(100 * (work_jiffies_after[core] - work_jiffies_before[core])) / (float)(total_jiffies_after[core] - total_jiffies_before[core]);
        } else {
            load[core] = (100 * (work_jiffies_after[core] - work_jiffies_before[core])) / 1;     // pick the next closest difference to zero
        }
        total += load[core];
    }

    *average = total / core_count;

    // save the jiffy count for the next interval
    for (int i = 0; i < (core_count); i++){
        work_jiffies_before[i] = work_jiffies_after[i];
        total_jiffies_before[i] = total_jiffies_after[i];
    }
}



int gpu(void){
    
    char file_buf[BUFSIZE];
    int freq_mhz = 0;

    int return_val = read_line(file_buf, "/sys/class/drm/card0/gt_cur_freq_mhz");

    if (return_val == 0)
    {
        return freq_mhz = atoi(file_buf);
    } 
    else 
    {
        return return_val;
    }
    

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