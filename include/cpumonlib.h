#include <stdint.h>
#include <stdbool.h>

#ifndef CPUMONLIB
#define CPUMONLIB

#define AVG_WINDOW              60
#define BATTERY_STATUS_BUF_SIZE 20
#define POWER_LIMIT_COUNT       2
#define BUFSIZE                 64
#define POLL_INTERVAL_S         1

#define DEBUG_ENABLE 0
#define LOG_ENABLE   1

enum cpu_designer  { INTEL, AMD };
enum power_domains { PKG, CORES, GPU };

/*
 * Single sensor type for all measured quantities.
 * per_core[] holds the current reading for each core/channel.
 * core_avg is the cross-core mean for this tick (set by the reader).
 * min/max/sum track session statistics across all ticks.
 * history[] is a ring buffer of core_avg, one slot per tick.
 */
struct sensor {
    int   count;
    float core_avg;
    float min, max, sum;
    float history[AVG_WINDOW];
    float per_core[];           /* flexible array, must be last */
};

struct cpu_power {
    float time_unit, energy_unit, power_unit;
    struct sensor *domains;     /* per_core[PKG/CORES/GPU] = per-domain watts */
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
    struct sensor    *freq;
    struct sensor    *load;
    struct sensor    *temperature;
    struct sensor    *voltage;
    struct cpu_power *power;
    enum cpu_designer designer;
    uint8_t           core_count;
    uint8_t           physical_core_count;
    const struct cpu_ops *ops;
};

struct gpu_sensors {
    struct sensor *freq;
    struct sensor *load;
    struct sensor *temperature;
    struct sensor *power;
    struct sensor *voltage;     /* per_core[0]=GPU mV, per_core[1]=northbridge mV */
};

struct battery {
    struct sensor *stats;       /* count=1; per_core[0]=current watts */
    char status[BATTERY_STATUS_BUF_SIZE];
};

struct sensor_suite {
    struct cpu_sensors *cpu;
    struct gpu_sensors *gpu;
    struct battery     *battery;
};

struct app_context {
    int  core_count;
    bool running_with_privileges;
    long history_cntr;
    long period_cntr;
    bool power_initialized;
    char charging_status_before[BATTERY_STATUS_BUF_SIZE];
};

void              init_environment(struct app_context *ctx);
struct sensor    *init_sensor(int count);
struct cpu_power *init_sensor_power(enum cpu_designer designer, int n_domains);
struct battery   *init_sensor_battery(void);
struct sensor_suite *init_sensor_suite(enum cpu_designer designer, int core_count);

int read_sensors(struct sensor_suite *, struct app_context *ctx);
int read_cpu_sensors(struct cpu_sensors *cpu, bool running_with_privileges);
int read_gpu_sensors(struct gpu_sensors *gpu);
int read_battery_sensors(struct battery *battery);
int update_sensor(struct sensor *s, int history_cntr);
int update_sensor_suite_statistics(struct sensor_suite *, struct app_context *ctx);

int print_fanspeed(void);

#endif // CPUMONLIB
