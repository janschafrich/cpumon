#include <stdint.h>

#ifndef CPUMONLIB
#define CPUMONLIB


#define AVG_WINDOW 60
#define BATTERY_STATUS_BUF_SIZE     20
#define POWER_LIMIT_COUNT 2
#define BUFSIZE     64
#define POLL_INTERVAL_S 1


#define DEBUG_ENABLE 0
#define LOG_ENABLE 1

typedef enum { INTEL, AMD } cpu_designer_e;
typedef enum { PKG, CORES, GPU} power_domains_e;
typedef enum { CHARGING, DISCHARGING, NOT_CHARGING } battery_status_t;


typedef struct {
    float min;
    float max;
    float structural_avg;
    float runtime_avg;
    float cumulative;
    float present[];
} statistics_t;


typedef struct power_s {
    float *core_energy_before;
    float *core_energy_after;
    float *per_domain;
    int n_domains;
    float time_unit, energy_unit, power_unit;
    statistics_t *stats;
} cpu_power_t;


typedef struct {
    statistics_t *stats;
} frequency_t;


typedef struct {
    statistics_t *stats;
} voltage_t;


typedef struct {
    statistics_t *stats;
} temperature_t;


typedef struct load_s {
    long long *work_jiffies_before;
    long long *total_jiffies_before;
    statistics_t *stats;
} cpu_load_t;


typedef struct battery_s {
    statistics_t *stats;
    char status[BATTERY_STATUS_BUF_SIZE];
} battery_t;


typedef struct {
    frequency_t *freq;
    cpu_load_t *load;
    temperature_t *temperature;
    voltage_t *voltage;
    cpu_power_t *power;
    cpu_designer_e designer;
    uint8_t core_count;
} cpu_sensors_t;


typedef struct {
    statistics_t *stats;
} gpu_power_t;


typedef struct {
    float northbridge;
    statistics_t *stats;
} gpu_voltage_t;



typedef struct {
    frequency_t *freq;
    cpu_load_t *load;
    temperature_t *temperature;
    gpu_power_t *power;
    gpu_voltage_t *voltage;
} gpu_sensors_t; 


typedef struct {
    cpu_sensors_t *cpu;
    gpu_sensors_t *gpu;
    battery_t *battery;
} sensor_suite_t;




void init_environment(void);
statistics_t *init_statistics(int core_count);
frequency_t *init_frequency(int core_count);
temperature_t *init_temperature(int core_count);
voltage_t *init_voltage(int core_count);
cpu_power_t *init_sensor_power(cpu_designer_e cpu_designer, int core_count);
cpu_load_t *init_sensor_load(int core_count);
battery_t *init_sensor_battery();
sensor_suite_t *init_sensor_suite(cpu_designer_e designer, int core_count);

int read_sensors(sensor_suite_t *);
int read_cpu_sensors(cpu_sensors_t *cpu);
int read_gpu_sensors(gpu_sensors_t *cpu);
int read_battery_sensors(battery_t *battery);
int update_sensor_statistics(statistics_t *sensor, uint8_t);
int update_sensor_suite_statistics(sensor_suite_t *);

int print_fanspeed(void);


#endif // CPUMONLIB