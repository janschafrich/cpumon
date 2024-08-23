
#ifndef CPUMONLIB
#define CPUMONLIB


#define AVG_WINDOW 60
#define BATTERY_STATUS_BUF_SIZE     20
#define POWER_LIMIT_COUNT 2
#define BUFSIZE     64
#define POLL_INTERVAL_S 1


#define DEBUG_ENABLE 0

typedef struct sensor_s {

    float cpu_avg;
    float runtime_avg;
    float cumulative;
    float min;
    float max;
    float per_core[];
} sensor_s;

typedef struct power_s {
    float cores;
    float gpu;
    float pkg_cumulative;
    float pkg_runtime_avg; 
    float time_unit, energy_unit, power_unit;
    float *core_energy_before;
    float *core_energy_after;
    float *per_domain;
    int n_domains;
    float per_core[];
} power_s;


typedef struct battery_s {
    float power_now;
    float power_cumulative;
    float power_runtime_avg;
    float min;
    float max;
    char status[BATTERY_STATUS_BUF_SIZE];
} battery_s;

typedef enum { INTEL, AMD } cpu_designer_e;
typedef enum { PKG, CORES, GPU} power_domains_e;


void init_environment(void);
void *init_sensor(int core_count);
void *init_sensor_battery();
void *init_sensor_power(cpu_designer_e cpu_designer, int core_count);

void read_sensors(    sensor_s* freq, 
                            sensor_s *load, 
                            sensor_s* temperature, 
                            sensor_s *voltage, 
                            float *power_per_domain, 
                            power_s *power, 
                            battery_s *battery,
                            cpu_designer_e designer);

int print_fanspeed(void);


#endif