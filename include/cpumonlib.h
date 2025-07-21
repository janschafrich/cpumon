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

enum cpu_designer { INTEL, AMD };
enum power_domains { PKG, CORES, GPU };
enum battery_status { CHARGING, DISCHARGING, NOT_CHARGING };

struct statistics {
    float min;
    float max;
    float structural_avg;
    float runtime_avg;
    float cumulative;
    float present[];
};

struct cpu_power {
    float *core_energy_before;
    float *core_energy_after;
    float *per_domain;
    int n_domains;
    float time_unit, energy_unit, power_unit;
    struct statistics *stats;
};

struct frequency {
    struct statistics *stats;
};

struct voltage {
    struct statistics *stats;
};

struct temperature {
    struct statistics *stats;
};

struct cpu_load {
    struct statistics *stats;
};

struct battery {
    struct statistics *stats;
    char status[BATTERY_STATUS_BUF_SIZE];
};

struct cpu_sensors {
    struct frequency *freq;
    struct cpu_load *load;
    struct temperature *temperature;
    struct voltage *voltage;
    struct cpu_power *power;
    enum cpu_designer designer;
    uint8_t core_count;
};

struct gpu_power {
    struct statistics *stats;
};

struct gpu_voltage {
    float northbridge;
    struct statistics *stats;
};

struct gpu_sensors {
    struct frequency *freq;
    struct cpu_load *load;
    struct temperature *temperature;
    struct gpu_power *power;
    struct gpu_voltage *voltage;
}; 

struct sensor_suite {
    struct cpu_sensors *cpu;
    struct gpu_sensors *gpu;
    struct battery *battery;
};

void init_environment(void);
struct statistics *init_statistics(int core_count);
struct frequency *init_frequency(int core_count);
struct temperature *init_temperature(int core_count);
struct voltage *init_voltage(int core_count);
struct cpu_power *init_sensor_power(enum cpu_designer cpu_designer, int core_count);
struct cpu_load *init_sensor_load(int core_count);
struct battery *init_sensor_battery(void);
struct sensor_suite *init_sensor_suite(enum cpu_designer designer, int core_count);

int read_sensors(struct sensor_suite *);
int read_cpu_sensors(struct cpu_sensors *cpu);
int read_gpu_sensors(struct gpu_sensors *gpu);
int read_battery_sensors(struct battery *battery);
int update_sensor_statistics(struct statistics *sensor, uint8_t);
int update_sensor_suite_statistics(struct sensor_suite *);

int print_fanspeed(void);

#endif // CPUMONLIB
