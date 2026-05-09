// monitored CPU values read from the Linux kernel sysfs


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <dirent.h>
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

void get_sysfs_power_limits_w(int *power_limits)
{
    FILE *fp;
    char results[BUFSIZE];
    long power_uw[POWER_LIMIT_COUNT];
    char path[256];

    for (int i = 0; i < POWER_LIMIT_COUNT; i++) {
        sprintf(path, "/sys/class/powercap/intel-rapl:0/constraint_%d_power_limit_uw", i);
        fp = fopen(path, "r");
        if (fp == NULL) {
#if DEBUG_ENABLE
            printf("get_sysfs_power_limits filepath %s\n", path);
#endif
            perror("Error opening file\n");
            power_limits[i] = 0;
            continue;
        }
        if (fgets(results, BUFSIZE, fp) == NULL)
            printf("Couldn't read power from %s", path);
        sscanf(results, "%ld", &power_uw[i]);
        fclose(fp);
        power_limits[i] = (int)(power_uw[i] / 1000000);
    }
}

enum cpu_designer detect_cpu_designer(void)
{
    FILE *fp = fopen("/proc/cpuinfo", "r");
    if (!fp) return AMD;

    char buf[256];
    enum cpu_designer designer = AMD;
    while (fgets(buf, sizeof(buf), fp)) {
        if (strncmp(buf, "vendor_id", 9) == 0) {
            if (strstr(buf, "GenuineIntel")) designer = INTEL;
            break;
        }
    }
    fclose(fp);
    return designer;
}

void get_power_config(bool running_with_privileges, const struct cpu_ops *ops)
{
    char buf[BUFSIZE];

    if (ops && ops->display_power_config)
        ops->display_power_config(running_with_privileges);

    if (read_sysfs_string("/sys/devices/system/cpu/cpu0/cpufreq/energy_performance_preference", buf, sizeof(buf)))
        printw("Energy-Performance-Preference: \t%s \n", buf);

    if (read_sysfs_string("/sys/devices/system/cpu/cpufreq/policy0/scaling_driver", buf, sizeof(buf)))
        printw("Scaling Driver: \t\t%s \n", buf);

    if (read_sysfs_string("/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor", buf, sizeof(buf)))
        printw("CPU Frequency Scaling Governor: %s \n", buf);
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


void reset_if_status_changed(float *sum, char *status, char *status_before)
{
    if (strcmp(status, status_before) != 0)
    {
        *sum = 0;
        strcpy(status_before, status);
    }
}



void get_sysfs_freq_ghz(float *freq_ghz, float *average, int core_count)
{
    static int *fds = NULL;

    if (fds == NULL) {
        fds = malloc(sizeof(int) * core_count);
        for (int i = 0; i < core_count; i++) {
            char path[80];
            snprintf(path, sizeof(path),
                     "/sys/devices/system/cpu/cpufreq/policy%d/scaling_cur_freq", i);
            fds[i] = open(path, O_RDONLY);
        }
    }

    char buf[16];
    float total = 0;
    for (int i = 0; i < core_count; i++) {
        if (fds[i] < 0) {
            freq_ghz[i] = -1;
            continue;
        }
        lseek(fds[i], 0, SEEK_SET);
        ssize_t n = read(fds[i], buf, sizeof(buf) - 1);
        if (n > 0) {
            buf[n] = '\0';
            freq_ghz[i] = (float)strtol(buf, NULL, 10) / 1000000.0f;
            total += freq_ghz[i];
        } else {
            freq_ghz[i] = -1;
        }
    }

    *average = total / core_count;
}


void get_cpucore_load(float *load_per_core, float *average, int core_count)
{
    // load is calculated as a difference between two jiffy counts at different timestamps
    static long long *work_jiffies_before = NULL;
    static long long *total_jiffies_before = NULL;
    static int initialized_core_count = 0;
    static int stat_fd = -1;        // repeated allocations and deallocations scale poorly with higher core counts

    if (stat_fd < 0) {
        stat_fd = open("/proc/stat", O_RDONLY);
        if (stat_fd < 0) {
            perror("Error opening /proc/stat");
            return;
        }
    }

    // Single read pulls the whole file into user space
    // Rely on kernel to keep the virtual FS up to date
    char stat_buf[8192];
    lseek(stat_fd, 0, SEEK_SET);
    ssize_t bytes_read = read(stat_fd, stat_buf, sizeof(stat_buf) - 1);
    if (bytes_read <= 0) return;
    stat_buf[bytes_read] = '\0';

    long long user, nice, system, idle, iowait, irq, softirq;
    long long work_jiffies_after[core_count];
    long long total_jiffies_after[core_count];

    // Skip aggregate "cpu " line, parse one line per logical core
    char *line = strchr(stat_buf, '\n');
    if (!line) return;
    line++;

    for (int core = 0; core < core_count; core++) {
        char comparator[16];
        sprintf(comparator, "cpu%d ", core);

        if (!strncmp(line, comparator, strlen(comparator))) {
            sscanf(line, "%*s %lld %lld %lld %lld %lld %lld %lld",
                   &user, &nice, &system, &idle, &iowait, &irq, &softirq);
            work_jiffies_after[core]  = user + nice + system;
            total_jiffies_after[core] = user + nice + system + idle + iowait + irq + softirq;
        }

        char *nl = strchr(line, '\n');
        if (!nl) break;
        line = nl + 1;
    }

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



static int find_hwmon_id(const char *driver_name)
{
    DIR *dir = opendir("/sys/class/hwmon");
    if (!dir) return -1;

    struct dirent *entry;
    char path[280], name[32];   // 280 = len("/sys/class/hwmon/") + NAME_MAX + len("/name")
    int result = -1;
    while ((entry = readdir(dir)) != NULL) {
        if (strncmp(entry->d_name, "hwmon", 5) != 0) continue;
        snprintf(path, sizeof(path), "/sys/class/hwmon/%s/name", entry->d_name);
        if (read_sysfs_string(path, name, sizeof(name)) &&
            strcmp(name, driver_name) == 0) {
            result = atoi(entry->d_name + 5);
            break;
        }
    }
    closedir(dir);
    return result;
}

int get_amdgpu_hwmon_id(void)
{
    static int8_t hwmon_id = -1;
    static bool initialized = FALSE;

    if (!initialized) {
        initialized = TRUE;
        hwmon_id = (int8_t)find_hwmon_id("amdgpu");
    }
    return hwmon_id;
}

int get_k10temp_temperature_c(float *temperature_c)
{
    static int8_t hwmon_id = -1;
    static bool initialized = FALSE;

    if (!initialized) {
        initialized = TRUE;
        hwmon_id = (int8_t)find_hwmon_id("k10temp");
    }
    if (hwmon_id < 0) return -1;

    char buf[20], path[70];

    // Prefer Tdie (temp2) over Tctl (temp1): Tdie has no artificial offset applied
    snprintf(path, sizeof(path), "/sys/class/hwmon/hwmon%d/temp2_input", hwmon_id);
    if (read_sysfs_string(path, buf, sizeof(buf))) {
        *temperature_c = strtof(buf, NULL) / 1000.0f;
        return 0;
    }
    snprintf(path, sizeof(path), "/sys/class/hwmon/hwmon%d/temp1_input", hwmon_id);
    if (read_sysfs_string(path, buf, sizeof(buf))) {
        *temperature_c = strtof(buf, NULL) / 1000.0f;
        return 0;
    }
    return -1;
}



int get_amdgpu_value(float *value, char *interface)
{
    char file_buf[20];
    char path[70];

    int8_t hwmon_id = get_amdgpu_hwmon_id();

    if (hwmon_id >= 0)
    {
        sprintf(path, "/sys/class/hwmon/hwmon%d/%s", hwmon_id, interface);
        if (read_sysfs_string(path, file_buf, 20) != NULL)
        {
            *value = strtof(file_buf, NULL);
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






