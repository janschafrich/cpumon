#ifndef SYSFS
#define SYSFS


char *identifiy_cpu(void);
int * get_sysfs_power_limits_w(void);
void get_power_config(bool running_with_privileges, cpu_designer_e);
int get_sysfs_power_battery_w(float *battery_power);
int get_battery_status(char *status);
void reset_if_status_changed(float *cumulative, char *status, char *status_before);

void get_sysfs_freq_ghz(float *, float *, int core_count); 
void get_cpucore_load(float *load, float *, long long *work_jiffies_before, long long *total_jiffies_before, int core_count);
int get_cpucore_load_new(load_s *load, int core_count);

int read_gpu(void);






#endif

