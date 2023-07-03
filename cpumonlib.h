
#ifndef CPUMONLIB
#define CPUMONLIB

/* Terminal formatting*/
#define BOLD        "\e[1m"
#define BOLD_OFF    "\e[m"
#define CLEAR       "\e[1;1H\e[2J"
#define DEFAULT_COLOR  "\x1B[0m"
#define BLACK       "\x1B[30m"
#define RED         "\x1B[31m"
#define GREEN       "\x1B[32m"
#define YELLOW      "\x1B[33m"
#define BLUE        "\x1B[34m"
#define MAGENTA     "\x1B[35m"
#define CYAN        "\x1B[36m"
#define WHITE       "\x1B[37m"


#define AVG_WINDOW 60
#define POWER_LIMIT_COUNT 2
#define BUFSIZE     64
#define POLL_INTERVAL_S 1
#define POWER_DOMAIN_COUNT   3       // pkg, cores, gpu

#define MSR_PERF_STATUS         0x198
#define MSR_RAPL_POWER_UNIT		0x606
#define MSR_PKG_POWER_LIMIT     0x610
#define IA32_PACKAGE_THERM_STATUS       0x1B1

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

#define CPU_TIGERLAKE       140

struct sensor 
{
    float cpu_avg;
    float runtime_avg;
    float cumulative;
    float min;
    float max;
    float *per_core;
};

struct sensor *create_sensor(struct sensor *new_sensor);
char *read_string(const char *filepath);
char *identifiy_cpu(void);
int * power_limits_w(void);
void power_config(void);
long * power_uw(void);
float * temp_core_c(int core_count);
float * freq_ghz(int core_count);
float * cpucore_load(int core_count, long long *work_jiffies_before, long long *total_jiffies_before);
int acc_cmdln(char *cmd);
int open_msr(int core);
long long read_msr(int fd, int which);
float * voltage_v(int core_count);
void power_limit_msr(int core_count);
double * power_units(void);
int gpu(void);
char * draw(float percentage);
char * draw_relative(float * value_abs);
void * draw_power(long * value);
void  moving_average(int i, float * freq, int *load, int *temp, float *voltage, float *power);
float runtime_avg(long poll_cycle_counter, float * samples_cumulative, float * sample_next);
float calc_average(float *, int);
float min(float previous_min_value, float sample_next);
int print_fanspeed(void);


#endif