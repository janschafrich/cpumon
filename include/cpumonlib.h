
#ifndef CPUMONLIB
#define CPUMONLIB


#define AVG_WINDOW 60
#define BATTERY_STATUS_BUF_SIZE     20
#define POWER_LIMIT_COUNT 2
#define BUFSIZE     64
#define POLL_INTERVAL_S 1
#define POWER_DOMAIN_COUNT   3       // pkg, cores, gpu



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
int gpu(void);

void  moving_average(int i, float * freq, float *load, float *temp, float *voltage, float *power);
float runtime_avg(long poll_cycle_counter, float *samples_cumulative, float *sample_next);
float get_min_value(float previous_min_value, float *sample_next, int sample_count);
float get_max_value(float previous_min_value, float *sample_next, int sample_count);
int print_fanspeed(void);


#endif