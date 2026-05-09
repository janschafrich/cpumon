
// monitored CPU values read from model specific registers (MSR)

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <math.h>
#include <ncurses.h>
#include "../include/utils.h"
#include "../include/cpumonlib.h"
#include "../include/machine_specific_registers.h"

#include <sys/types.h>
#include <sys/syscall.h>
#include <linux/perf_event.h>

// based on https://github.com/deater/uarch-configure/blob/master/rapl-read/rapl-read.c

int open_msr(int core)
{
    char path[BUFSIZ];
    sprintf(path, "/dev/cpu/%d/msr", core);
    int fd = open(path, O_RDONLY);
    if (fd < 0)
        fprintf(stderr, "open_msr: failed to open %s: %s\n", path, strerror(errno));
    return fd;
}

long long read_msr(int fd, unsigned int offset)
{
    if (fd < 0) return 0;
    uint64_t register_val;
    if (pread(fd, &register_val, sizeof register_val, offset) != sizeof register_val) {
        perror("read_msr: pread");
        return 0;
    }
    return (long long)register_val;
}


void intel_voltage_v(float *voltage, float *average, int physical_core_count)
{
    static int *fds = NULL;
    if (!fds) {
        fds = malloc(sizeof(int) * physical_core_count);
        for (int i = 0; i < physical_core_count; i++)
            fds[i] = open_msr(i);
    }

    float total = 0;
    for (int core = 0; core < physical_core_count; core++) {
        uint64_t raw = (uint64_t)read_msr(fds[core], MSR_PERF_STATUS);
        raw = (raw & 0xffff00000000ULL) >> 32;  // bits 47:32
        voltage[core] = (1.0f / 8192.0f) * (float)raw;  // Intel VID scaling
        total += voltage[core];
    }
    *average = total / physical_core_count;
}

void amd_voltage_v(float *voltage, float *average, int physical_core_count)
{
    static int *fds = NULL;
    if (!fds) {
        fds = malloc(sizeof(int) * physical_core_count);
        for (int i = 0; i < physical_core_count; i++)
            fds[i] = open_msr(i);
    }

    float total = 0;
    for (int core = 0; core < physical_core_count; core++) {
        // Find which P-state hardware is currently running on this core
        uint64_t hw_pstate  = (uint64_t)read_msr(fds[core], AMD_MSR_HARDWARE_PSTATE_STATUS);
        unsigned int cur_pstate = (unsigned int)(hw_pstate & 0x7);  // bits[2:0]

        // Read that P-state's definition to get CpuVid (bits[21:14])
        uint64_t pstate_def = (uint64_t)read_msr(fds[core], AMD_MSR_PSTATE_C0 + cur_pstate);
        uint32_t vid = (uint32_t)((pstate_def >> 14) & 0xFF);

        // Linear VID-to-voltage: V = 1.55 - VID * 6.25 mV  (AMD PPR, valid for VID 0..0xF3)
        voltage[core] = (vid <= 0xF3) ? (1.55f - 0.00625f * (float)vid) : 0.0f;
        total += voltage[core];
    }
    *average = total / physical_core_count;
}

void msr_temperature_c(float *temperature, float *average, int core_count)
{
    static int *fds = NULL;
    if (!fds) {
        fds = malloc(sizeof(int) * core_count);
        for (int i = 0; i < core_count; i++)
            fds[i] = open_msr(i);
    }

    float total = 0;
    for (int core = 0; core < core_count; core++) {
        uint64_t target = (uint64_t)read_msr(fds[core], MSR_TEMPERATURE_TARGET);
        uint64_t therm  = (uint64_t)read_msr(fds[core], IA32_THERM_STATUS);

        if (!(therm & (1ULL << 31))) {
            printf("IA32_THERM_STATUS reading not valid for core %d\n", core);
            continue;
        }
        float tjmax   = (float)((target >> 16) & 0xFF);   // bits 23:16
        float readout = (float)((therm  >> 16) & 0x7F);   // bits 22:16
        temperature[core] = tjmax - readout;
        total += temperature[core];
    }
    *average = total / core_count;
}

// determine which power units the core internally uses
int get_msr_core_units(struct cpu_power *my_power, enum cpu_designer designer)
{
    switch (designer)
    {
        case AMD: {
            int fd = open_msr(0);
            if (fd < 0) return -1;
            long long core_energy_units = read_msr(fd, AMD_MSR_PWR_UNIT);
            close(fd);
            unsigned int time_unit_raw   = (core_energy_units & AMD_TIME_UNIT_MASK)   >> 16;
            unsigned int energy_unit_raw = (core_energy_units & AMD_ENERGY_UNIT_MASK) >>  8;
            unsigned int power_unit_raw  = (core_energy_units & AMD_POWER_UNIT_MASK);
            my_power->time_unit   = (float)pow(0.5, (double)time_unit_raw);
            my_power->energy_unit = (float)pow(0.5, (double)energy_unit_raw);
            my_power->power_unit  = (float)pow(0.5, (double)power_unit_raw);
            break;
        }
        default:
            break;
    }
    return 0;
}

// readout energy differences per power domain and calculate power (Intel RAPL via sysfs)
void get_intel_msr_power_w(float *power_w)
{
    static int fds[POWER_DOMAIN_COUNT];
    static bool initialized = false;

    if (!initialized) {
        initialized = true;
        const char *domain_paths[POWER_DOMAIN_COUNT] = {
            "/sys/class/powercap/intel-rapl/intel-rapl:0/energy_uj",
            "/sys/class/powercap/intel-rapl/intel-rapl:0/intel-rapl:0:0/energy_uj",
            "/sys/class/powercap/intel-rapl/intel-rapl:0/intel-rapl:0:1/energy_uj"
        };
        for (int i = 0; i < POWER_DOMAIN_COUNT; i++)
            fds[i] = open(domain_paths[i], O_RDONLY);
    }

    static long long energy_uj_before[POWER_DOMAIN_COUNT];
    long long energy_uj_after[POWER_DOMAIN_COUNT];
    char buf[24];

    for (int i = 0; i < POWER_DOMAIN_COUNT; i++) {
        if (fds[i] < 0) { energy_uj_after[i] = energy_uj_before[i]; continue; }
        lseek(fds[i], 0, SEEK_SET);
        ssize_t n = read(fds[i], buf, sizeof(buf) - 1);
        if (n > 0) {
            buf[n] = '\0';
            energy_uj_after[i] = strtoll(buf, NULL, 10);
        } else {
            energy_uj_after[i] = energy_uj_before[i];
        }
    }

    for (int i = 0; i < POWER_DOMAIN_COUNT; i++)
        power_w[i] = (float)((energy_uj_after[i] - energy_uj_before[i]) * 1e-6) / (float)POLL_INTERVAL_S;

    for (int i = 0; i < POWER_DOMAIN_COUNT; i++)
        energy_uj_before[i] = energy_uj_after[i];
}

int get_amd_pkg_power_w(float *pkg_power, float energy_unit)
{
    static float package_before = 0;
    static int   fd = -1;
    if (fd < 0) fd = open_msr(0);

    float package_after = (float)read_msr(fd, AMD_MSR_PACKAGE_ENERGY) * energy_unit;
    *pkg_power = package_after - package_before;
    package_before = package_after;
    return 0;
}

int get_amd_msr_core_power_w(struct sensor *domains, float energy_unit, int physical_core_count)
{
    static int   *fds               = NULL;
    static float *core_energy_before = NULL;
    static float *core_energy_after  = NULL;

    if (!fds) {
        fds               = malloc(sizeof(int)   * physical_core_count);
        core_energy_before = calloc(physical_core_count, sizeof(float));
        core_energy_after  = calloc(physical_core_count, sizeof(float));
        if (!fds || !core_energy_before || !core_energy_after) return -1;
        for (int i = 0; i < physical_core_count; i++)
            fds[i] = open_msr(i);
    }

    for (int i = 0; i < physical_core_count; i++) {
        long long raw = read_msr(fds[i], AMD_MSR_CORE_ENERGY);
        core_energy_after[i] = (float)(raw & 0xFFFFFFFFLL) * energy_unit;
    }

    domains->per_core[CORES] = 0;
    for (int i = 0; i < physical_core_count; i++) {
        domains->per_core[CORES] += core_energy_after[i] - core_energy_before[i];
        core_energy_before[i] = core_energy_after[i];
    }

    return 0;
}

int perf_ipc_per_core(float *ipc_out, float *avg, int core_count)
{
    static int      *fd_insn    = NULL;
    static int      *fd_cyc     = NULL;
    static uint64_t *prev_insn  = NULL;
    static uint64_t *prev_cyc   = NULL;

    if (!fd_insn) {
        fd_insn   = malloc(sizeof(int)      * core_count);
        fd_cyc    = malloc(sizeof(int)      * core_count);
        prev_insn = calloc(core_count, sizeof(uint64_t));
        prev_cyc  = calloc(core_count, sizeof(uint64_t));
        if (!fd_insn || !fd_cyc || !prev_insn || !prev_cyc) return -1;

        struct perf_event_attr pe;
        memset(&pe, 0, sizeof(pe));
        pe.type       = PERF_TYPE_HARDWARE;
        pe.size       = sizeof(pe);
        pe.disabled   = 0;
        pe.exclude_hv = 1;

        for (int c = 0; c < core_count; c++) {
            pe.config  = PERF_COUNT_HW_INSTRUCTIONS;
            fd_insn[c] = (int)syscall(SYS_perf_event_open, &pe, -1, c, -1, 0);
            if (fd_insn[c] < 0)
                fprintf(stderr, "perf_ipc: failed to open instructions counter for cpu %d: %s\n",
                        c, strerror(errno));

            pe.config = PERF_COUNT_HW_CPU_CYCLES;
            fd_cyc[c] = (int)syscall(SYS_perf_event_open, &pe, -1, c, -1, 0);
            if (fd_cyc[c] < 0)
                fprintf(stderr, "perf_ipc: failed to open cycles counter for cpu %d: %s\n",
                        c, strerror(errno));
        }
    }

    float total = 0.0f;
    for (int c = 0; c < core_count; c++) {
        uint64_t insn = 0, cyc = 0;
        if (fd_insn[c] >= 0) read(fd_insn[c], &insn, sizeof insn);
        if (fd_cyc[c]  >= 0) read(fd_cyc[c],  &cyc,  sizeof cyc);

        uint64_t d_insn = insn - prev_insn[c];
        uint64_t d_cyc  = cyc  - prev_cyc[c];
        ipc_out[c]      = (d_cyc > 0) ? (float)d_insn / (float)d_cyc : 0.0f;
        total          += ipc_out[c];
        prev_insn[c]    = insn;
        prev_cyc[c]     = cyc;
    }
    *avg = total / core_count;
    return 0;
}

// report what currently limits power
void get_msr_power_limits_w(int core_count)
{
    (void)core_count;
    /* IA32_PACKAGE_THERM_STATUS is a package-level register; any core returns the same value */
    int fd = open_msr(0);
    uint64_t result = (uint64_t)read_msr(fd, IA32_PACKAGE_THERM_STATUS);
    close(fd);

    if (result & PROCHOT)                              printw("TEMPERATURE\n");
    if (result & THERMAL_STATUS)                       printw("POWER\n");
    if (result & RESIDENCY_STATE_REGULATION_STATUS)    printw("RESIDENCY\n");
    if (result & RUNNING_AVERAGE_THERMAL_LIMIT_STATUS) printw("THERMAL\n");
    if (result & VR_THERM_ALERT_STATUS)                printw("VOLTAGE REGULATOR\n");
    if (result & VR_THERM_DESIGN_CURRENT_STATUS)       printw("CURRENT\n");
    if (result & OTHER_STATUS)                         printw("OTHER\n");
    if (result & PKG_PL1_STATUS)                       printw("PL1\n");
    if (result & PKG_PL2_STATUS)                       printw("PL2\n");
    if (result & MAX_TURBO_LIMIT_STATUS)               printw("MC_TURBO\n");
    if (result & TURBO_TRANSITION_ATTENUATION_STATUS)  printw("TRANSITION ATTENUATION\n");
}
