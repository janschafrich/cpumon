#ifndef SYSFS
#define SYSFS


char *identifiy_cpu(void);
int * get_sysfs_power_limits_w(void);
void get_power_config(bool running_with_privileges, enum cpu_designer);
int get_sysfs_power_battery_w(float *battery_power);
int get_battery_status(char *status);
void reset_if_status_changed(float *cumulative, char *status, char *status_before);

void get_sysfs_freq_ghz(float *, float *, int core_count); 
void get_cpucore_load(float *load, float *avg, int core_count);

int get_amdgpu_voltage_mV(float *); 
int get_amdgpu_soc_power_uW(float *); 
int get_amdgpu_northbridge_mV(float*);
int get_amdgpu_temperature_mC(float *);
int read_gpu(void);






#endif

