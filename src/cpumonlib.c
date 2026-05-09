// General functions that answer requests from main

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <float.h>
#include <fcntl.h>
#include <locale.h>
#include <unistd.h>
#include <math.h>
#include <ncurses.h>
#include "../include/utils.h"
#include "../include/cpumonlib.h"
#include "../include/machine_specific_registers.h"
#include "../include/sysfs.h"


/////////////////////////////////////////
// CPU ops implementations
////////////////////////////////////////

static int intel_read_power(struct cpu_sensors *cpu) {
    get_intel_msr_power_w(cpu->power->domains->per_core);
    cpu->power->domains->core_avg = cpu->power->domains->per_core[PKG];
    return 0;
}

static int intel_read_temperature(struct cpu_sensors *cpu) {
    msr_temperature_c(cpu->temperature->per_core,
                      &cpu->temperature->core_avg,
                      cpu->core_count);
    return 0;
}

static int intel_read_voltage(struct cpu_sensors *cpu) {
    intel_voltage_v(cpu->voltage->per_core,
                    &cpu->voltage->core_avg,
                    cpu->physical_core_count);
    return 0;
}

static void intel_display_power_config(bool privileged) {
    if (!privileged) return;
    int power_limits[POWER_LIMIT_COUNT];
    get_sysfs_power_limits_w(power_limits);
    printw("Power Limits: \t\tPL1 = %d W, PL2 = %d W\n",
           power_limits[0], power_limits[1]);
}

static const struct cpu_ops intel_ops = {
    .read_power            = intel_read_power,
    .read_temperature      = intel_read_temperature,
    .read_voltage          = intel_read_voltage,
    .display_power_config  = intel_display_power_config,
};

static int amd_read_power(struct cpu_sensors *cpu) {
    get_amd_pkg_power_w(&cpu->power->domains->per_core[PKG], cpu->power->energy_unit);
    get_amd_msr_core_power_w(cpu->power->domains, cpu->power->energy_unit, cpu->physical_core_count);
    cpu->power->domains->core_avg = cpu->power->domains->per_core[PKG];
    return 0;
}

static int amd_read_temperature(struct cpu_sensors *cpu) {
    float pkg_temp;
    if (get_k10temp_temperature_c(&pkg_temp) != 0)
        return -1;
    for (int c = 0; c < cpu->core_count; c++)
        cpu->temperature->per_core[c] = pkg_temp;
    cpu->temperature->core_avg = pkg_temp;
    return 0;
}

static int amd_read_voltage(struct cpu_sensors *cpu) {
    amd_voltage_v(cpu->voltage->per_core,
                  &cpu->voltage->core_avg,
                  cpu->physical_core_count);
    // Propagate per-physical-core voltage to SMT sibling threads.
    // Topology assumed: logical 0..N-1 are one thread per physical core,
    // logical N..2N-1 are the sibling threads (holds for 7840U "0,8" siblings).
    for (int c = cpu->physical_core_count; c < cpu->core_count; c++)
        cpu->voltage->per_core[c] =
            cpu->voltage->per_core[c % cpu->physical_core_count];
    return 0;
}

static void amd_display_power_config(bool privileged) {
    (void)privileged;
    char buf[BUFSIZE];
    if (read_sysfs_string("/sys/devices/system/cpu/amd_pstate/prefcore", buf, sizeof(buf)))
        printw("AMD Preferential Core: \t\t%s \n", buf);
}

static const struct cpu_ops amd_ops = {
    .read_power            = amd_read_power,
    .read_temperature      = amd_read_temperature,
    .read_voltage          = amd_read_voltage,
    .display_power_config  = amd_display_power_config,
};

/////////////////////////////////////////
// Init functions
////////////////////////////////////////

static int detect_physical_core_count(int logical_count)
{
    char buf[256];
    if (!read_sysfs_string("/sys/devices/system/cpu/cpu0/topology/thread_siblings_list",
                           buf, sizeof(buf)))
        return logical_count;

    // Format: "0" (no SMT), "0,8" (SMT-2 comma form), "0-1" (SMT-2 range form)
    int threads = 0;
    char *p = buf;
    while (*p && *p != '\n') {
        char *endp;
        long a = strtol(p, &endp, 10);
        p = endp;
        threads++;
        if (*p == '-') {
            p++;
            long b = strtol(p, &endp, 10);
            p = endp;
            threads += (int)(b - a);
        }
        if (*p == ',') p++;
    }
    return (threads > 0) ? logical_count / threads : logical_count;
}

void init_environment(struct app_context *ctx)
{
    /* Load the msr kernel module only if /dev/cpu/0/msr is not already accessible */
    int msr_fd = open("/dev/cpu/0/msr", O_RDONLY);
    if (msr_fd < 0) {
        FILE *fp = popen("sudo modprobe msr", "r");
        if (fp) pclose(fp);
    } else {
        close(msr_fd);
    }

    setlocale(LC_NUMERIC, "");

    ctx->core_count = sysconf(_SC_NPROCESSORS_ONLN);
    if (ctx->core_count == -1)
        fprintf(stderr, "Could not determine CPU core count from sysconf\n");

    ctx->running_with_privileges = (geteuid() == 0);
    ctx->power_initialized = false;
}

struct sensor *init_sensor(int count)
{
    struct sensor *s = malloc(sizeof(struct sensor) + count * sizeof(float));
    if (!s) {
        fprintf(stderr, "Memory allocation for sensor failed\n");
        return NULL;
    }
    s->count   = count;
    s->core_avg = 0.0f;
    s->min     = FLT_MAX;
    s->max     = 0.0f;
    s->sum     = 0.0f;
    memset(s->history,  0, sizeof(s->history));
    memset(s->per_core, 0, count * sizeof(float));
    return s;
}

struct cpu_power *init_sensor_power(enum cpu_designer designer, int n_domains)
{
    struct cpu_power *power = malloc(sizeof(struct cpu_power));
    if (!power) {
        fprintf(stderr, "Memory allocation for power failed\n");
        return NULL;
    }

    power->domains = init_sensor(n_domains);
    if (!power->domains) {
        free(power);
        return NULL;
    }

    get_msr_core_units(power, designer);
    return power;
}

struct battery *init_sensor_battery(void)
{
    struct battery *battery = malloc(sizeof(struct battery));
    if (!battery) {
        fprintf(stderr, "Memory allocation for battery failed\n");
        return NULL;
    }
    battery->stats = init_sensor(1);
    if (!battery->stats) {
        free(battery);
        return NULL;
    }
    return battery;
}

struct sensor_suite *init_sensor_suite(enum cpu_designer designer, int core_count)
{
    struct sensor_suite *sensors = malloc(sizeof(struct sensor_suite));
    if (!sensors) return NULL;

    sensors->cpu     = malloc(sizeof(struct cpu_sensors));
    sensors->gpu     = malloc(sizeof(struct gpu_sensors));
    sensors->battery = init_sensor_battery();

    if (!sensors->cpu || !sensors->gpu || !sensors->battery) goto fail;

    int physical_core_count = detect_physical_core_count(core_count);

    int n_domains = (designer == INTEL) ? 3 : 2;

    // CPU sensors
    sensors->cpu->freq        = init_sensor(core_count);
    sensors->cpu->load        = init_sensor(core_count);
    sensors->cpu->temperature = init_sensor(core_count);
    sensors->cpu->voltage     = init_sensor(core_count);
    sensors->cpu->power       = init_sensor_power(designer, n_domains);
    sensors->cpu->designer          = designer;
    sensors->cpu->core_count        = (uint8_t)core_count;
    sensors->cpu->physical_core_count = (uint8_t)physical_core_count;
    sensors->cpu->ops = (designer == INTEL) ? &intel_ops : &amd_ops;

    if (!sensors->cpu->freq || !sensors->cpu->load || !sensors->cpu->temperature ||
        !sensors->cpu->voltage || !sensors->cpu->power) goto fail;

    // GPU sensors
    sensors->gpu->freq        = NULL;
    sensors->gpu->load        = NULL;
    sensors->gpu->temperature = init_sensor(1);
    sensors->gpu->power       = init_sensor(1);
    sensors->gpu->voltage     = init_sensor(2); /* [0]=GPU mV, [1]=northbridge mV */

    if (!sensors->gpu->temperature || !sensors->gpu->power || !sensors->gpu->voltage) goto fail;

    return sensors;

fail:
    if (sensors->cpu) {
        free(sensors->cpu->freq);
        free(sensors->cpu->load);
        free(sensors->cpu->temperature);
        free(sensors->cpu->voltage);
        if (sensors->cpu->power) {
            free(sensors->cpu->power->domains);
            free(sensors->cpu->power);
        }
        free(sensors->cpu);
    }
    if (sensors->gpu) {
        free(sensors->gpu->temperature);
        free(sensors->gpu->power);
        free(sensors->gpu->voltage);
        free(sensors->gpu);
    }
    if (sensors->battery) {
        free(sensors->battery->stats);
        free(sensors->battery);
    }
    free(sensors);
    return NULL;
}

///////////////////////////////////////
// Reading functions
//////////////////////////////////////

int read_sensors(struct sensor_suite *sensors, struct app_context *ctx)
{
    read_cpu_sensors(sensors->cpu, ctx->running_with_privileges);
    read_gpu_sensors(sensors->gpu);
    read_battery_sensors(sensors->battery);
    return 0;
}

int read_cpu_sensors(struct cpu_sensors *cpu, bool running_with_privileges)
{
    get_sysfs_freq_ghz(cpu->freq->per_core, &cpu->freq->core_avg, cpu->core_count);
    get_cpucore_load(cpu->load->per_core, &cpu->load->core_avg, cpu->core_count);

    if (running_with_privileges && cpu->ops) {
        if (cpu->ops->read_temperature) cpu->ops->read_temperature(cpu);
        if (cpu->ops->read_voltage)     cpu->ops->read_voltage(cpu);
        if (cpu->ops->read_power)       cpu->ops->read_power(cpu);
    }
    return 0;
}

int read_gpu_sensors(struct gpu_sensors *gpu)
{
    get_amdgpu_voltage_mV(&gpu->voltage->per_core[0]);
    get_amdgpu_northbridge_mV(&gpu->voltage->per_core[1]);
    get_amdgpu_soc_power_uW(gpu->power->per_core);
    gpu->power->per_core[0] *= 1e-6f;          /* µW → W */
    get_amdgpu_temperature_mC(gpu->temperature->per_core);
    gpu->temperature->per_core[0] *= 1e-3f;    /* m°C → °C */
    return 0;
}

int read_battery_sensors(struct battery *battery)
{
    get_sysfs_power_battery_w(&battery->stats->per_core[0]);
    battery->stats->core_avg = battery->stats->per_core[0];
    get_battery_status(battery->status);
    return 0;
}

///////////////////////////////////////
// Statistics
//////////////////////////////////////

int update_sensor(struct sensor *s, int history_cntr)
{
    for (int i = 0; i < s->count; i++) {
        if (s->per_core[i] < s->min) s->min = s->per_core[i];
        if (s->per_core[i] > s->max) s->max = s->per_core[i];
    }
    s->sum += s->core_avg;
    s->history[history_cntr] = s->core_avg;
    return 0;
}

int update_sensor_suite_statistics(struct sensor_suite *sensors, struct app_context *ctx)
{
    update_sensor(sensors->cpu->freq, ctx->history_cntr);
    update_sensor(sensors->cpu->load, ctx->history_cntr);

    reset_if_status_changed(&sensors->battery->stats->sum,
                            sensors->battery->status,
                            ctx->charging_status_before);
    update_sensor(sensors->battery->stats, ctx->history_cntr);

    if (ctx->running_with_privileges && sensors->cpu->ops) {
        if (sensors->cpu->ops->read_temperature)
            update_sensor(sensors->cpu->temperature, ctx->history_cntr);
        if (sensors->cpu->ops->read_voltage)
            update_sensor(sensors->cpu->voltage, ctx->history_cntr);
        if (sensors->cpu->ops->read_power) {
            if (!ctx->power_initialized) {
                ctx->power_initialized = true;
                return 0;
            }
            update_sensor(sensors->cpu->power->domains, ctx->history_cntr);
        }
    }

    return 0;
}

// requires ectool: https://github.com/DHowett/framework-ec
int print_fanspeed(void)
{
    char buf[BUFSIZE];
    FILE *fp;

    int duty = 0;
    if ((fp = popen("ectool pwmgetduty 0", "r")) == NULL) {
        printw("Error accessing the ectool. Error opening pipe\n");
        return -1;
    }
    while (fgets(buf, BUFSIZE, fp) != NULL)
        sscanf(buf, "%*s%*s%*s%d", &duty);
    printw("Fan speed %d %% ", (100 * duty) / 65536);
    if (pclose(fp)) return -1;

    int rpm = 0;
    if ((fp = popen("ectool pwmgetfanrpm", "r")) == NULL) {
        printw("Error accessing the ectool. Error opening pipe\n");
        return -1;
    }
    while (fgets(buf, BUFSIZE, fp) != NULL)
        sscanf(buf, "%*s%*d%*s%d", &rpm);
    printw("(%d RPM)\n", rpm);
    if (pclose(fp)) return -1;

    return 0;
}
