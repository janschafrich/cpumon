
#ifndef CPUMONLIB
#define CPUMONLIB


#define AVG_WINDOW 60
#define BATTERY_STATUS_BUF_SIZE     20
#define POWER_LIMIT_COUNT 2
#define BUFSIZE     64
#define POLL_INTERVAL_S 1
#define POWER_DOMAIN_COUNT   3       // pkg, cores, gpu

#define MSR_PERF_STATUS         0x198
#define MSR_RAPL_POWER_UNIT		0x606
#define MSR_PKG_POWER_LIMIT     0x610
#define IA32_PACKAGE_THERM_STATUS       0x1B1
#define MSR_TEMPERATURE_TARGET          0x1A2       // since Sandy Bridge
#define IA32_THERM_STATUS               0x19C      // since Sandy Bridge

#define PKG_THERMAL_STATUS          1           // Table 2-2 IA-32 Architectural MSRs
#define PKG_CRITICAL_TEMPERATURE_STATUS 16
#define PKG_POWER_LIMITATION_STATUS     1024

#define MSR_CORE_PERF_LIMIT_REASONS     0x64F  // 6th gen and newer
#define PROCHOT                         1
#define THERMAL_STATUS                  2
#define RESIDENCY_STATE_REGULATION_STATUS   16
#define RUNNING_AVERAGE_THERMAL_LIMIT_STATUS 32
#define VR_THERM_ALERT_STATUS           64
#define VR_THERM_DESIGN_CURRENT_STATUS  128
#define OTHER_STATUS                    256
#define PKG_PL1_STATUS                  1024
#define PKG_PL2_STATUS                  2048
#define MAX_TURBO_LIMIT_STATUS          4096
#define TURBO_TRANSITION_ATTENUATION_STATUS 8192

#define BIT31                           0x8000000

#define CPU_TIGERLAKE       140


// AMD

#define AMD_CPUID                       0x80000007

struct sensor {

    float cpu_avg;
    float runtime_avg;
    float cumulative;
    float min;
    float max;
    float per_core[];
};
typedef struct sensor sensor;

struct power {
    float pkg_now;
    float cores;
    float gpu;
    float pkg_cumulative;
    float pkg_runtime_avg; 
};
typedef struct power power;

struct battery {
    float power_now;
    float power_cumulative;
    float power_runtime_avg;
    float min;
    float max;
    char status[BATTERY_STATUS_BUF_SIZE];
};
typedef struct battery battery;


void init_environment(void);
char *read_string(const char *filepath);
int read_line(char *return_string, const char *filepath);

void update_sensor_data(sensor* freq, sensor *load, sensor* temperature, sensor *voltage, float *power_per_domain, power *my_power, battery *my_battery);
char *identifiy_cpu(void);
int * power_limits_w(void);
void power_config(void);
void power_w(float * power_w);


void freq_ghz(float *, float *, int core_count); 
void cpucore_load(float *load, float *, long long *work_jiffies_before, long long *total_jiffies_before, int core_count);

int acc_cmdln(char *cmd);
int open_msr(int core);
long long read_msr(int fd, int which);

int get_power_battery_w(float *battery_power);
int get_battery_status(char *status);
void reset_if_status_change(float *cumulative, char *status, char *status_before);
void temperature_c(float *temperature, float *average, int core_count);
void voltage_v(float *voltage, float *average, int core_count);
void power_limit_msr(int core_count);
double * power_units(void);
int gpu(void);

void  moving_average(int i, float * freq, float *load, float *temp, float *voltage, float *power);
float runtime_avg(long poll_cycle_counter, float *samples_cumulative, float *sample_next);
float get_min_value(float previous_min_value, float *sample_next, int sample_count);
float get_max_value(float previous_min_value, float *sample_next, int sample_count);
int print_fanspeed(void);


#endif