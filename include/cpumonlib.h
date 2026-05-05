#include <stdint.h>
#include <stdbool.h>

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

struct sensor_history {
    float min;
    float max;
    float avg;
    float cumulative;
};

struct statistics {
    float core_avg;
    struct sensor_history session;
    float per_core[];
};

struct cpu_power {
    float *core_energy_before;
    float *core_energy_after;
    float *per_domain;
    int n_domains;
    float time_unit, energy_unit, power_unit;
    struct statistics *stats;
};

struct battery {
    struct statistics *stats;
    char status[BATTERY_STATUS_BUF_SIZE];
};

/* Forward declaration so cpu_ops function pointers can reference cpu_sensors */
struct cpu_sensors;

struct cpu_ops {
    int  (*read_power)          (struct cpu_sensors *cpu);
    int  (*read_temperature)    (struct cpu_sensors *cpu);
    int  (*read_voltage)        (struct cpu_sensors *cpu);
    void (*display_power_config)(bool privileged);
};

struct cpu_sensors {
    struct statistics   *freq;
    struct statistics   *load;
    struct statistics   *temperature;
    struct statistics   *voltage;
    struct cpu_power    *power;
    enum cpu_designer    designer;
    uint8_t              core_count;
    uint8_t              physical_core_count;
    const struct cpu_ops *ops;
};

struct gpu_voltage {
    float northbridge;
    struct statistics *stats;
};

struct gpu_sensors {
    struct statistics  *freq;
    struct statistics  *load;
    struct statistics  *temperature;
    struct statistics  *power;
    struct gpu_voltage *voltage;
};

struct sensor_suite {
    struct cpu_sensors *cpu;
    struct gpu_sensors *gpu;
    struct battery *battery;
};

struct app_context {
    int core_count;
    bool running_with_privileges;
    long history_cntr;
    long period_cntr;
    char charging_status_before[BATTERY_STATUS_BUF_SIZE];
    float freq_his[AVG_WINDOW];
    float load_his[AVG_WINDOW];
    float temp_his[AVG_WINDOW];
    float voltage_his[AVG_WINDOW];
    float power_his[AVG_WINDOW];
};

void init_environment(struct app_context *ctx);
struct statistics *init_statistics(int core_count);
struct cpu_power *init_sensor_power(enum cpu_designer cpu_designer, int core_count, int physical_core_count);
struct battery *init_sensor_battery(void);
struct sensor_suite *init_sensor_suite(enum cpu_designer designer, int core_count);

int read_sensors(struct sensor_suite *, struct app_context *ctx);
int read_cpu_sensors(struct cpu_sensors *cpu, bool running_with_privileges);
int read_gpu_sensors(struct gpu_sensors *gpu);
int read_battery_sensors(struct battery *battery);
int update_sensor_statistics(struct statistics *sensor, uint8_t, long period_cntr);
int update_sensor_suite_statistics(struct sensor_suite *, struct app_context *ctx);

int print_fanspeed(void);

#endif // CPUMONLIB
