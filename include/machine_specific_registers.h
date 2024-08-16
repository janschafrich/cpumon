
#ifndef MACHINE_SPECIFIC_REGISTERS
#define MACHINE_SPECIFIC_REGISTERS

#define POWER_DOMAIN_COUNT   3       // pkg, cores, gpu
#define POLL_INTERVAL_S 1

// intel

#define MSR_PERF_STATUS         0x198
#define MSR_RAPL_POWER_UNIT		0x606
#define MSR_PKG_POWER_LIMIT     0x610
#define IA32_PACKAGE_THERM_STATUS       0x1B1
#define MSR_TEMPERATURE_TARGET          0x1A2       // since Sandy Bridge
#define IA32_THERM_STATUS               0x19C      // since Sandy Bridge

#define PKG_THERMAL_STATUS          1           // Table 2-2 IA-32 Architectural MSRs
#define PKG_CRITICAL_TEMPERATURE_STATUS 16
#define PKG_POWER_LIMITATION_STATUS     1024

#define MSR_CORE_PERF_LIMIT_REASONS     0x64F  // 6th gen and newer
#define PROCHOT                         1
#define THERMAL_STATUS                  2
#define RESIDENCY_STATE_REGULATION_STATUS   16
#define RUNNING_AVERAGE_THERMAL_LIMIT_STATUS 32
#define VR_THERM_ALERT_STATUS           64
#define VR_THERM_DESIGN_CURRENT_STATUS  128
#define OTHER_STATUS                    256
#define PKG_PL1_STATUS                  1024
#define PKG_PL2_STATUS                  2048
#define MAX_TURBO_LIMIT_STATUS          4096
#define TURBO_TRANSITION_ATTENUATION_STATUS 8192

#define BIT31                           0x8000000

#define CPU_TIGERLAKE       140


// AMD

#define AMD_CPUID                       0x80000007


#define AMD_MSR_PWR_UNIT 0xC0010299     // power time and energy units
#define AMD_MSR_CORE_ENERGY 0xC001029A
#define AMD_MSR_PACKAGE_ENERGY 0xC001029B

#define AMD_TIME_UNIT_MASK 0xF0000
#define AMD_ENERGY_UNIT_MASK 0x1F00
#define AMD_POWER_UNIT_MASK 0xF

// function prototypes

int open_msr(int core);
long long read_msr(int fd, unsigned int offset);



void msr_temperature_c(float *temperature, float *average, int core_count);
void voltage_v(float *voltage, float *average, int core_count);
void get_msr_power_limits_w(int core_count);
double * core_power_units(void);
void get_intel_msr_power_w(float * power_w);

int get_msr_core_units(power *my_power, cpu_designer_e designer);
int get_amd_pkg_power_w(power *my_power);
int get_amd_msr_core_power_w(power *my_power, int total_cores);


#endif