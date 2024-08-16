
// monitored CPU values read from model specific registers (MSR) , specific to the respective CPU microarchitecture


#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
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
	char msr_filename[BUFSIZ];
	int fd;

	sprintf(msr_filename, "/dev/cpu/%d/msr", core);
	fd = open(msr_filename, O_RDONLY);
	if ( fd < 0 ) {
		if ( errno == ENXIO ) {
			fprintf(stderr, "rdmsr: No CPU %d\n", core);
			exit(2);
		} else if ( errno == EIO ) {
			fprintf(stderr, "rdmsr: CPU %d doesn't support MSRs\n",
					core);
			exit(3);
		} else {
			perror("rdmsr: open");
			fprintf(stderr,"Trying to open %s\n",msr_filename);
			exit(127);
		}
	}
#if DEBUG_ENABLE 
    printf("Opened MSR and got fd = %x\n", fd);
#endif
	return fd;
}

long long read_msr(int fd, unsigned int offset)
{
	uint64_t register_val;

	if ( pread(fd, &register_val, sizeof register_val, offset) != sizeof register_val )
    {
#if DEBUG_ENABLE
        printf("fd = %x\n has register_val = %ld", fd, register_val);
#endif
        perror("rdmsr: pread");
		exit(127);
	}

	return (long long)register_val;
}


void voltage_v(float *voltage, float *average, int core_count)
{
    int fd;
    uint64_t result[core_count];
    float total = 0;

    for (int core = 0; core < core_count; core++) {
        fd=open_msr(core);
        result[core] = read_msr(fd,MSR_PERF_STATUS); 
        close(fd);
    }
    // convert results into voltages
    for (int i= 0; i < core_count; i++) {
        result[i] = result[i]&0xffff00000000;   // remove all bits except 47:32 via bitmask, thx: https://askubuntu.com/questions/876286/how-to-monitor-the-vcore-voltage
        result[i] = result[i]>>32;              // correct for positioning of bits so that value is correctly interpreted (Bitshift)
        voltage[i] = (1.0/8192.0) * result[i];    // correct for scaling according to intel documentation    
        total += voltage[i];
    }

    *average = total / core_count;
}

void msr_temperature_c(float *temperature, float *average, int core_count)
{
    int fd;
    uint64_t register_content[core_count];
    float temperature_target[core_count];
    float total = 0;

    for (int core = 0; core < core_count; core++) {
        fd=open_msr(core);
        register_content[core] = read_msr(fd, MSR_TEMPERATURE_TARGET); 
        close(fd);
    }

    for (int i= 0; i < core_count; i++) {
        register_content[i] = register_content[i]&0xff0000;     // remove all bits except 23:16 via bitmask, IA32 SW Developer Manual p. 2-186
        register_content[i] = register_content[i]>>16;          // correct for positioning of bits so that value is correctly interpreted (Bitshift)
        temperature_target[i] = register_content[i];                   
    }

    
    float temperature_digital_readout[core_count];

    for (int core = 0; core < core_count; core++) {
        fd=open_msr(core);
        register_content[core] = read_msr(fd, IA32_THERM_STATUS); 
        close(fd);
    } 
    
    for (int i= 0; i < core_count; i++) {
        if (register_content[i] & (1 << 31)) {
            register_content[i] = register_content[i] & 0x7f0000;     // remove all bits except 22:16 via bitmask, IA32 SW Developer Manual p. 2-185
            register_content[i] = register_content[i]>>16;          // correct for positioning of bits so that value is correctly interpreted (Bitshift)
            temperature_digital_readout[i] = register_content[i];                     
            temperature[i] = temperature_target[i] - temperature_digital_readout[i];
            total += temperature[i];
        }
        else {
            printf("Digital temperature reading from IA_THERM_STATUS not valid\n");
        }
    } 

    *average = total / core_count;     
}

// determine which power units the core internally uses
double * core_power_units(void)
{
    int fd;
    unsigned long long result, lock;
    double power_unit, time_unit, time_y, time_z;  // energy_unit 
    double pkg_pl1, pkg_tw1;               // pkg_pl2, pkg_tw2

    fd=open_msr(0);
    result = read_msr(fd, MSR_RAPL_POWER_UNIT);
    close(fd);

    power_unit = 1 / pow(2,result&0xF);          // default 0,125 W increments
    //energy_unit = 1 / pow(2,(result&0x1F00)>>8);       // default 15,3 µJ
    time_unit = 1 / pow(2,(result&0xF0000)>> 16);      // default 976 µs

    printf("Power unit %f\n", power_unit); 
    printf("Time unit %f\n", time_unit);

    fd=open_msr(0);
    result = read_msr(fd, MSR_PKG_POWER_LIMIT);
    close(fd);

    pkg_pl1 = (double)(result&0x7FFF) * power_unit;
    time_y = (double)((result&0x3E0000)>>17);
    time_z = (double)((result&0xC00000)>>22);
    pkg_tw1 = pow(2,time_y * (1.0 + time_z / 4.0)) * time_unit;
    lock = (result>>63)&0x1;

    printf("PL1 = %f W\n", pkg_pl1);
    printf("Time Window = %f s\n", pkg_tw1);
    printf("Lock status = %lld\n", lock);
    return 0;
}

// readout energy differences per power domain and calculate power
void get_intel_msr_power_w(float * power_w) 
{
	FILE *fp;
    static long long energy_uj_before[POWER_DOMAIN_COUNT];
    long long energy_uj_after[POWER_DOMAIN_COUNT];

    char *power_domains[] = {"/sys/class/powercap/intel-rapl/intel-rapl:0/energy_uj",                   // package domain
                            "/sys/class/powercap/intel-rapl/intel-rapl:0/intel-rapl:0:0/energy_uj",     // cores domain
                            "/sys/class/powercap/intel-rapl/intel-rapl:0/intel-rapl:0:1/energy_uj"};    // GPU domain

    for (int i = 0; i < POWER_DOMAIN_COUNT; i++) {
        fp = fopen(power_domains[i],"r");
				if (fp==NULL) {
					fprintf(stderr,"\tError opening %s", power_domains[i]);
                    perror("");
				}
				else {
					if (fscanf(fp,"%lld",&energy_uj_after[i]) == EOF)
                    {
                        printf("couldnt read from energy counter form %s \n", power_domains[i]);
                    }
					fclose(fp);
                }
    }       
        
    for (int i = 0; i < POWER_DOMAIN_COUNT; i++){
        power_w[i] = (float)( (energy_uj_after[i] - energy_uj_before[i]) * 1e-6) / (float) POLL_INTERVAL_S ;
    }  
    for (int i = 0; i < POWER_DOMAIN_COUNT; i++){
        energy_uj_before[i] = energy_uj_after[i];
    }	
}

int get_amd_pkg_power_w(power *my_power) 
{
#if DEBUG_ENABLE
    printf("Entered rapl_msr_amd_core\n");
#endif
    static float package_before = 0;
    float package_after = 0;

    int fp = open_msr(0);

#if DEBUG_ENABLE
    printf("Reading from AMD_MSR_PACKAGE_ENERGY\n");
#endif
    long long package_raw = read_msr(fp, AMD_MSR_PACKAGE_ENERGY);
    close(fp);
#if DEBUG_ENABLE
    printf("Received raw energy Reading = %lld\n", package_raw);
#endif
	
    package_after = (float)package_raw * my_power->energy_unit;
    my_power->pkg_now = package_after - package_before;
    package_before = package_after;

	return 0;
}

int get_msr_core_units(power *my_power, cpu_designer_e designer)
{
    switch (designer)
    {
        case AMD:
            int fp = open_msr(0);   // using units of Core 0 for all others cores
            int core_energy_units = read_msr(fp, AMD_MSR_PWR_UNIT);
            close(fp);
            unsigned int time_unit_raw = (core_energy_units & AMD_TIME_UNIT_MASK) >> 16;
	        unsigned int energy_unit_raw = (core_energy_units & AMD_ENERGY_UNIT_MASK) >> 8;
	        unsigned int power_unit_raw = (core_energy_units & AMD_POWER_UNIT_MASK);
            my_power->time_unit = pow(0.5,(float)(time_unit_raw));
	        my_power->energy_unit = pow(0.5,(float)(energy_unit_raw));
	        my_power->power_unit = pow(0.5,(float)(power_unit_raw));
            break;
        default:
            break;
            	
    }
    return 0;
}


int get_amd_msr_core_power_w(power *my_power, int total_cores)
{
	int *fd = (int*)malloc(sizeof(int)*total_cores/2);
	
	for (int i = 0; i < total_cores/2; i++) {
		fd[i] = open_msr(i);
	}
	
	int core_energy_raw;

	// Read per core energy values
	for (int i = 0; i < total_cores/2; i++) {
		core_energy_raw = read_msr(fd[i], AMD_MSR_CORE_ENERGY);
		my_power->core_energy_after[i] = core_energy_raw * my_power->energy_unit;
	}

    for (int i = 0; i < total_cores/2; i++)
    {
        close(fd[i]);
    }

    int j = 0;
    my_power->cores = 0;
	for(int i = 0; i < total_cores; i += 2) {
		my_power->per_core[i] = my_power->core_energy_after[i-j] - my_power->core_energy_before[i-j];
        my_power->per_core[i+1] = 0;        // report power per core as power per first thread, second thread P = 0 W
		my_power->cores += my_power->per_core[i];
        my_power->core_energy_before[i-j] = my_power->core_energy_after[i-j];
        j++;
    }
	
	free(fd);
	
	return 0;
}





// report what currently limits power
void get_msr_power_limits_w(int core_count){
    int fd;
    uint64_t result = 0;

    int prochot = 0;               // Table 2-2 IA-32 Architectural MSRs
    int thermal = 0;
    int residency_state = 0;
    int running_average_thermal = 0;
    int vr_therm = 0;               // thermal alert of processor voltage regulator
    int vr_therm_design_current = 0;
    int other = 0;
    int pkg_pl1 = 0;
    int pkg_pl2 = 0;
    int max_turbo_limit = 0;        // multicore turbo limit
    int turbo_transition_attenuation = 0;   


    for (int i = 0; i < core_count; i++){
        fd = open_msr(i);
        result = read_msr(fd,IA32_PACKAGE_THERM_STATUS);
        close(fd);
    }

        prochot = result&PROCHOT;
        thermal = result&THERMAL_STATUS;
        residency_state = result&RESIDENCY_STATE_REGULATION_STATUS;
        running_average_thermal = result&RUNNING_AVERAGE_THERMAL_LIMIT_STATUS;
        vr_therm = result&VR_THERM_ALERT_STATUS;
        vr_therm_design_current = result&VR_THERM_DESIGN_CURRENT_STATUS;
        other = result&OTHER_STATUS;
        pkg_pl1 = result&PKG_PL1_STATUS;
        pkg_pl2 = result&PKG_PL2_STATUS;
        max_turbo_limit = result&MAX_TURBO_LIMIT_STATUS;
        turbo_transition_attenuation = result&TURBO_TRANSITION_ATTENUATION_STATUS;

    if (prochot == 1) printw("TEMPERATURE\n");
    if (thermal == 1) printw("POWER\n");
    if (residency_state == 1) printw("RESIDENCY\n"); 
    if (running_average_thermal == 1) printw("THERMAL\n"); 
    if (vr_therm == 1) printw("VOLTAGE REGULATOR\n");  
    if (vr_therm_design_current == 1) printw("CURRENT\n");   
    if (other == 1) printw("OTHER\n"); 
    if (pkg_pl1 == 1) printw("PL1\n"); 
    if (pkg_pl2 == 1) printw("PL2\n"); 
    if (max_turbo_limit == 1) printw("MC_TURBO\n"); 
    if (turbo_transition_attenuation == 1) printw("TRANSITION ATTENUATION\n"); 
}


