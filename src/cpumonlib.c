// General functions that answer requests from main

#include <stdio.h>                   // printf
#include <stdlib.h>                 // malloc
#include <string.h>                 // strlen
#include <stdint.h>
#include <locale.h>
#include <unistd.h>                 // cpus online
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
    get_intel_msr_power_w(cpu->power->per_domain);
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
    get_amd_pkg_power_w(&cpu->power->per_domain[PKG], cpu->power->energy_unit);
    get_amd_msr_core_power_w(cpu->power, cpu->physical_core_count);
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
    FILE *fp = popen("sudo modprobe msr", "r");
    if (fp == NULL)
        printf("Error modprobe msr\n");
    else
        pclose(fp);

    setlocale(LC_NUMERIC, "");

    ctx->core_count = sysconf(_SC_NPROCESSORS_ONLN);
    if (ctx->core_count == -1)
    {
        fprintf(stderr, "Could not determine CPU core count from sysconf\n");
    }

    ctx->running_with_privileges = (geteuid() == 0) ? TRUE : FALSE;
}

struct statistics *init_statistics(int core_count)
{
    struct statistics *sensor = malloc( sizeof(struct statistics) + core_count * sizeof(sensor->per_core[0]) );
    if (sensor == NULL)
    {
        fprintf(stderr, "Memory allocation for \"sensor\" failed\n");
        return NULL;
    }
    sensor->core_avg = 0;
    sensor->session.avg = 0;
    sensor->session.cumulative = 0;
    sensor->session.min = 1000;
    sensor->session.max = 0;
    
    return sensor;
}


struct cpu_power *init_sensor_power(enum cpu_designer cpu_designer, int core_count, int physical_core_count)
{
    struct cpu_power *power = malloc(sizeof(struct cpu_power));
    if (!power) {
        fprintf(stderr, "Memory allocation for power failed\n");
        return NULL;
    }

    power->stats = init_statistics(core_count);
    if (!power->stats) {
        fprintf(stderr, "Memory allocation for power->stats failed\n");
        free(power);
        return NULL;
    }

    get_msr_core_units(power, cpu_designer);

    // FILE *log = fopen("/tmp/cpumon_debug.log", "a");
    // if (log) {
    // fprintf(log, "power->energy_unit = %f\n", power->energy_unit);
    // fprintf(log, "power->time_unit = %f\n", power->time_unit);
    // }
    // fclose(log);

    switch (cpu_designer)
    {
        case INTEL:
            power->n_domains = 3; // PKG, CORES, GPU
            break;
        case AMD:
            power->n_domains = 2; // PKG, CORES
            // Allocate per-core energy arrays for AMD
            power->core_energy_before = malloc(sizeof(float) * physical_core_count);
            power->core_energy_after  = malloc(sizeof(float) * physical_core_count);
            if (!power->core_energy_before || !power->core_energy_after) {
                fprintf(stderr, "Memory allocation for AMD core energy arrays failed\n");
                free(power->stats);
                free(power->core_energy_before);
                free(power->core_energy_after);
                free(power);
                return NULL;
            }
            break;
        default:
            power->n_domains = 1;
            break;
    }

    power->per_domain = malloc(sizeof(float) * power->n_domains);
    if (!power->per_domain) {
        fprintf(stderr, "Memory allocation for per_domain failed\n");
        free(power->stats);
        if (cpu_designer == AMD) {
            free(power->core_energy_before);
            free(power->core_energy_after);
        }
        free(power);
        return NULL;
    }

    // Optionally initialize stats and per_domain to zero
    memset(power->stats, 0, sizeof(struct statistics));
    for (int i = 0; i < power->n_domains; ++i) power->per_domain[i] = 0.0f;

    if (cpu_designer == AMD) {
        for (int i = 0; i < physical_core_count; ++i) {
            power->core_energy_before[i] = 0.0f;
            power->core_energy_after[i] = 0.0f;
        }
    }

    return power;
}

struct battery *init_sensor_battery(void)
{
    struct battery *battery = malloc(sizeof(struct battery));
    if (battery == NULL) {
        fprintf(stderr, "Memory allocation for \"battery\" failed\n");
        return NULL;
    }

    battery->stats = init_statistics(1);
    if (battery->stats == NULL) {
        free(battery);
        return NULL;
    }

    return battery;
}

struct gpu_voltage *init_gpu_voltage(int core_count) {
    struct gpu_voltage *voltage = malloc(sizeof(struct gpu_voltage));
    if (!voltage) return NULL;
    voltage->stats = init_statistics(core_count);
    if (!voltage->stats) { 
        free(voltage); 
        return NULL;
    }
    return voltage;
}

struct sensor_suite *init_sensor_suite(enum cpu_designer designer, int core_count) {
    struct sensor_suite *sensors = malloc(sizeof(struct sensor_suite));
    if (!sensors) return NULL;

    sensors->cpu = malloc(sizeof(struct cpu_sensors));
    sensors->gpu = malloc(sizeof(struct gpu_sensors));
    sensors->battery = init_sensor_battery();

    if (!sensors->cpu || !sensors->gpu || !sensors->battery) goto fail;

    int physical_core_count = detect_physical_core_count(core_count);

    // CPU sensors
    sensors->cpu->freq = init_statistics(core_count);
    sensors->cpu->load = init_statistics(core_count);
    sensors->cpu->temperature = init_statistics(core_count);
    sensors->cpu->voltage = init_statistics(core_count);
    sensors->cpu->power = init_sensor_power(designer, core_count, physical_core_count);
    sensors->cpu->designer = designer;
    sensors->cpu->core_count = (uint8_t)core_count;
    sensors->cpu->physical_core_count = (uint8_t)physical_core_count;
    sensors->cpu->ops = (designer == INTEL) ? &intel_ops : &amd_ops;

    // GPU sensors
    sensors->gpu->freq = init_statistics(1);
    sensors->gpu->load = NULL;
    sensors->gpu->temperature = init_statistics(1);
    sensors->gpu->power = init_statistics(1);
    sensors->gpu->voltage = init_gpu_voltage(1);

    // Check for allocation failures
    if (!sensors->cpu->freq || !sensors->cpu->load || !sensors->cpu->temperature ||
        !sensors->cpu->voltage || !sensors->cpu->power ||
        !sensors->gpu->freq || !sensors->gpu->temperature ||
        !sensors->gpu->power || !sensors->gpu->voltage) goto fail;

    return sensors;

fail:
    if (sensors->cpu) {
        free(sensors->cpu->freq);
        free(sensors->cpu->load);
        free(sensors->cpu->temperature);
        free(sensors->cpu->voltage);
        free(sensors->cpu->power);
        free(sensors->cpu);
    }
    if (sensors->gpu) {
        free(sensors->gpu->freq);
        free(sensors->gpu->temperature);
        free(sensors->gpu->power);
        if (sensors->gpu->voltage) { free(sensors->gpu->voltage->stats); free(sensors->gpu->voltage); }
        free(sensors->gpu);
    }
    if (sensors->battery) free(sensors->battery);
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

    if (running_with_privileges == TRUE && cpu->ops) {
        if (cpu->ops->read_temperature) cpu->ops->read_temperature(cpu);
        if (cpu->ops->read_voltage)     cpu->ops->read_voltage(cpu);
        if (cpu->ops->read_power)       cpu->ops->read_power(cpu);
    }
    return 0;
}

int read_gpu_sensors(struct gpu_sensors *gpu)
{
    get_amdgpu_voltage_mV(gpu->voltage->stats->per_core);
    get_amdgpu_northbridge_mV(&gpu->voltage->northbridge);
    get_amdgpu_soc_power_uW(gpu->power->per_core);
    get_amdgpu_temperature_mC(gpu->temperature->per_core);
    return 0;
}

int read_battery_sensors(struct battery *battery)
{
    get_sysfs_power_battery_w(&battery->stats->per_core[0]);
    battery->stats->core_avg = battery->stats->per_core[0];
    get_battery_status(battery->status);
    return 0;
}

int update_sensor_statistics(struct statistics *sensor, uint8_t core_count, long period_cntr)
{
    sensor->session.min = get_min_value(sensor->session.min, sensor->per_core, core_count);
    sensor->session.max = get_max_value(sensor->session.max, sensor->per_core, core_count);
    sensor->session.avg = get_runtime_avg(period_cntr, &sensor->session.cumulative, &sensor->core_avg);
    return 0;
}

int update_sensor_suite_statistics(struct sensor_suite *sensors, struct app_context *ctx)
{
    update_sensor_statistics(sensors->cpu->freq, sensors->cpu->core_count, ctx->period_cntr);
    ctx->freq_his[ctx->history_cntr] = sensors->cpu->freq->core_avg;

    update_sensor_statistics(sensors->cpu->load, sensors->cpu->core_count, ctx->period_cntr);
    ctx->load_his[ctx->history_cntr] = sensors->cpu->load->core_avg;

    reset_if_status_changed(&sensors->battery->stats->session.cumulative, sensors->battery->status, ctx->charging_status_before);
    update_sensor_statistics(sensors->battery->stats, 1, ctx->period_cntr);

    if (ctx->running_with_privileges == TRUE && sensors->cpu->ops) {
        if (sensors->cpu->ops->read_temperature) {
            update_sensor_statistics(sensors->cpu->temperature, sensors->cpu->core_count, ctx->period_cntr);
            ctx->temp_his[ctx->history_cntr] = sensors->cpu->temperature->core_avg;
        }
        if (sensors->cpu->ops->read_voltage) {
            update_sensor_statistics(sensors->cpu->voltage, sensors->cpu->core_count, ctx->period_cntr);
            ctx->voltage_his[ctx->history_cntr] = sensors->cpu->voltage->core_avg;
        }
    }

    static int power_initialized = 0;

    if (ctx->running_with_privileges == TRUE && sensors->cpu->ops && sensors->cpu->ops->read_power)
    {
        if (!power_initialized)
        {
            power_initialized = 1;
            return 0;
        }
        #if DEBUG_ENABLE
            printf("Setting power_his[%ld] = %f\n", ctx->history_cntr, sensors->cpu->power->per_domain[PKG]);
        #endif

        ctx->power_his[ctx->history_cntr] = sensors->cpu->power->per_domain[PKG];
        sensors->cpu->power->stats->session.avg = get_runtime_avg(ctx->period_cntr - 1, &sensors->cpu->power->stats->session.cumulative, &sensors->cpu->power->per_domain[PKG]);
    }

    return 0;
}

// requires ectool, a programm to communicate with the embedded controller build from this repository: https://github.com/DHowett/framework-ec
int print_fanspeed(void){  // based on this example: https://stackoverflow.com/questions/43116/how-can-i-run-an-external-program-from-c-and-parse-its-output
    char buf[BUFSIZE];  // response buffer
    FILE *fp;

    int duty = 0;
    if ((fp = popen("ectool pwmgetduty 0", "r")) == NULL) {
        printw("Error accessing the ectool. Error opening pipe\n");
        return -1;
    }
    while (fgets(buf, BUFSIZE, fp) != NULL) {
        sscanf(buf, "%*s%*s%*s%d", &duty);
        printw("Fan speed %d %% ", (100 * duty)/ 65536 );  // print response to console
    }
    if (pclose(fp)) {   // error
        return -1;
    }
    
    int rpm = 0;
    if ((fp = popen("ectool pwmgetfanrpm", "r")) == NULL) {
        printw("Error accessing the ectool. Error opening pipe\n");
        return -1;
    }
    while (fgets(buf, BUFSIZE, fp) != NULL) {
        sscanf(buf, "%*s%*d%*s%d", &rpm);
        printw("(%d RPM)\n", rpm);  // print response to console
    }
    if (pclose(fp)) {
        return -1;
    }

    return 0;
}
