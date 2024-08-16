
#ifndef CPUMONLIB
#define CPUMONLIB


#define AVG_WINDOW 60
#define BATTERY_STATUS_BUF_SIZE     20
#define POWER_LIMIT_COUNT 2
#define BUFSIZE     64
#define POLL_INTERVAL_S 1


#define DEBUG_ENABLE 1

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
    float cores;
    float gpu;
    float pkg_now;
    float pkg_cumulative;
    float pkg_runtime_avg; 
    float time_unit, energy_unit, power_unit;
    float *core_energy_before;
    float *core_energy_after;
    float per_core[];
};
typedef struct power power;

typedef struct core_energy_s {
    float *energy_before;
    float *energy_after;
}   core_energy_s;


typedef struct battery_s {
    float power_now;
    float power_cumulative;
    float power_runtime_avg;
    float min;
    float max;
    char status[BATTERY_STATUS_BUF_SIZE];
} battery_s;

typedef enum { INTEL, AMD } cpu_designer_e;


void init_environment(void);
void *init_sensor(int core_count);
void *init_sensor_battery();
void *init_sensor_power(cpu_designer_e cpu_designer, int core_count);

void update_sensor_data(sensor* freq, sensor *load, sensor* temperature, sensor *voltage, float *power_per_domain, power *my_power, battery_s *battery);

int print_fanspeed(void);


#endif