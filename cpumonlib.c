
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>
#include <errno.h>
#include <fcntl.h>
#include <sys/stat.h>               // open()
#include <unistd.h>
#include <stdint.h>
#include <math.h>
#include <ncurses.h>
#include "cpumonlib.h"

struct sensor *create_sensor(struct sensor* new_sensor) {
    
    int core_count = (int)sysconf(_SC_NPROCESSORS_ONLN);
    new_sensor = malloc(sizeof(struct sensor) + sizeof(float) * core_count);
    new_sensor->cpu_avg = 0;
    new_sensor->runtime_avg = 0;
    new_sensor->cumulative = 0;
    new_sensor->min = 1000;
    new_sensor->max = 0;
    new_sensor->per_core = 0;
    
    //return new_sensor;
}


char *read_string(const char *filepath)     // function from data type pointer
{     
    FILE *fp = fopen(filepath, "r");
    static char file_buf[BUFSIZE];          // allocate memory on the heap to store file content 
    int i = 0;
    int single_character;

    if(fp == NULL) {
        perror("Error opening file");
        return NULL;
    }

    while ((single_character = fgetc(fp)) != EOF && i < BUFSIZE -1 ){
        if(single_character == '\n') {
            continue;           // skip newline characters
        } else {
            file_buf[i] = single_character;
        }
    i++;
    }

    file_buf[i] = '\0';                 // terminate string
    fclose(fp);

    return file_buf;                    // return address to file
}


char *identifiy_cpu(void){

    FILE *fp = fopen("/proc/cpuinfo", "r");
    if (fp == NULL) {
        perror("Error opening file");
        return (NULL);
    } 

    char file_buf[BUFSIZ];
    char *model;
    model = malloc (sizeof *model);      // allocate memory space on heap
    char *line;
    
    while(1) {
        line = fgets(file_buf, BUFSIZ, fp);
        if (line == NULL) break;
    
        if(!strncmp(line, "model name", 10)) {
            sscanf(line,"%*s%*s%*s%*s%*s%*s%*s%s", model);         // every whitespace starts a new string, asterisk = ignore
            break;
        //} else {
        //    printf("Error reading CPU model name from /proc/cpuinfo\n");
        }
    }
    
    fclose(fp);

    return model;
}

int * power_limits_w(void) {
    FILE *fp;
    char results[BUFSIZE];
    long power_uw[POWER_LIMIT_COUNT];
    static int power_limits[POWER_LIMIT_COUNT];
    char path[256];

    for ( int i = 0; i < POWER_LIMIT_COUNT; i++) {
        sprintf(path,"/sys/class/powercap/intel-rapl:0/constraint_%d_power_limit_uw",i);
        fp = fopen(path, "r");
        if (fp == NULL) {
            perror("Error opening file\n");
        }
        fgets(results,BUFSIZE, fp);
        sscanf(results, "%ld", &power_uw[i]);
        fclose(fp);
    }

    for (int i = 0; i < POWER_LIMIT_COUNT; i++) {
        power_limits[i] = (int)(power_uw[i]/1000000);
    }
    return power_limits;
}

void power_config(void)
{
    int *power_limits = power_limits_w();
    printw("\nPower Limits: \t\tPL1 = %d W, PL2 = %d\n", power_limits[0], power_limits[1]);

    char *file = read_string("/sys/devices/system/cpu/intel_pstate/no_turbo");

    if (strncmp(file, "0", 1) == 0) {
        printw("Turbo: \t\t\t\tenabled\n");     
    } else {
        printw("Turbo: \t\t\t\tdisabled\n");
    }
    
    file = read_string("/sys/devices/system/cpu/cpu0/cpufreq/energy_performance_preference");
    printw("Energy-Performance-Preference: \t%s \n", file);

    file = read_string("/sys/devices/system/cpu/cpufreq/policy0/scaling_driver");
    printw("Scaling Driver: \t\t%s \n",file);
    
    file = read_string("/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor");
    printw("CPU Frequency Scaling Governor: %s \n", file);   
       
}


long * power_uw(void) 
{
	FILE *fp;
    static long long energy_uj_before[POWER_DOMAIN_COUNT];
    long long energy_uj_after[POWER_DOMAIN_COUNT];
    static long power_uw[POWER_DOMAIN_COUNT+1];

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
					fscanf(fp,"%lld",&energy_uj_after[i]);
					fclose(fp);
                }
    }

    char file_buf[BUFSIZE];

    long voltage_uv;
    
    fp = fopen("/sys/class/power_supply/BAT1/voltage_now", "r");

    if (fp == NULL) // file doesnt exist
    {  
        voltage_uv = 0;
    } 
    else 
    {
        fgets(file_buf, BUFSIZE, fp);
        sscanf(file_buf, "%ld", &voltage_uv);  
    }
    fclose(fp);
       
    long current_ua;   
    fp = fopen("/sys/class/power_supply/BAT1/current_now", "r");
    
    if (fp == NULL) // file doesnt exist
    { 
        current_ua = 0;
    } 
    else {
        fgets(file_buf, BUFSIZE, fp);
        sscanf(file_buf, "%ld", &current_ua);
    }
    fclose(fp);

    long power_system_uw = voltage_uv * current_ua;
    power_uw[POWER_DOMAIN_COUNT] = power_system_uw;
        
    for (int i = 0; i < POWER_DOMAIN_COUNT; i++){
        power_uw[i] = (long)  (double)(energy_uj_after[i] - energy_uj_before[i]) / (double) POLL_INTERVAL_S ;
    }  
    for (int i = 0; i < POWER_DOMAIN_COUNT; i++){
        energy_uj_before[i] = energy_uj_after[i];
    }	

    return power_uw;
}


void temp_core_c(float *temperature, int core_count)
{
    FILE *fp;
    char file_buffer[BUFSIZE];
    char *basename = "/sys/devices/platform/coretemp.0/hwmon/";
    char path_dir[300];
    char path_file[320];
    long temp[core_count/2];
    //float *temperature = malloc((core_count) * sizeof(*temperature));    
    int total = 0;

    DIR *dp = opendir(basename);
    if (dp == NULL) {
        fprintf(stderr, "Error opening %s ", basename);
        perror("");
    }
    struct dirent *entry;
    while( (entry = readdir(dp)) != NULL){
        if (strcmp(entry->d_name,".") != 0 && strcmp(entry->d_name,"..") != 0) {    // skip . and .. directories
            sprintf(path_dir, "%s%s", basename, entry->d_name);
        }  
    }
    closedir(dp);

    for (int i = 2; i < (2 + core_count/2); i++){
        sprintf(path_file,"%s/temp%d_input", path_dir, i);       // build path
        fp = fopen(path_file,"r");
		if (fp == NULL) {
            fprintf(stderr, "Error opening %s ", path_file);
            perror("");
        } else {
            fscanf(fp, "%ld", &temp[i-2]);
            fclose(fp);
        }
    }

    for (int i = 0; i < core_count; i++) {
       temperature[i] = (int)(temp[i/2] / 1000); // i/2 -> write value twice
       total += temperature[i];
    }
    
    //return temperature;
}


void freq_ghz(float *freq_ghz, int core_count) 
{
   // float *freq_ghz = malloc((core_count) * sizeof(*freq_ghz));
    double total = 0;
    char file_buf[BUFSIZE];
    char path[64];
    FILE *fp;

    for (int i = 0; i < core_count; i++){
        sprintf(path, "/sys/devices/system/cpu/cpufreq/policy%d/scaling_cur_freq", i);
        fp = fopen(path, "r");
        if (fp == NULL){
            perror("Error opening file\n");
        }
        fgets(file_buf, BUFSIZE, fp);
        fclose(fp);
        freq_ghz[i] = (float)strtol(file_buf, NULL, 10) / 1000000;
    }

    for (int i = 0; i < core_count; i++) {
        total += freq_ghz[i];
    }

    //return freq_ghz;
}


void cpucore_load(float *load, int core_count, long long *work_jiffies_before, long long *total_jiffies_before) {
    
    FILE *fp = fopen("/proc/stat", "r");
    if (fp == NULL) {
        perror("Error opening file /proc/stat");
    }

    char file_buf[BUFSIZ];
    char *line;
    long long user, nice, system, idle, iowait, irq, softirq;
    long long work_jiffies_after[core_count];
    long long total_jiffies_after[core_count];
    //float *load = malloc((core_count) * sizeof(*load));
    char comparator[7];

        line = fgets(file_buf, BUFSIZ, fp);
        if (line == NULL) {
            printf("Error %s\n", file_buf);
        }
        // work jiffies for whole cpu      
        if (!strncmp(line, "cpu", 3)) {
            sscanf(line, "%*s %lld %lld %lld %lld %lld %lld %lld", &user, &nice, &system, &idle, &iowait, &irq, &softirq);
            work_jiffies_after[core_count] = user + nice + system;
            total_jiffies_after[core_count] = user + nice + system + idle + iowait + irq + softirq;
        }
        // work jiffies for individual cores
        for (int i = 0; i < core_count; i++) {
            line = fgets(file_buf, BUFSIZ, fp);
            if (line == NULL) {
                break;
            }
            sprintf(comparator,"cpu%d ", i);
            if (!strncmp(line, comparator, 5)) {
                sscanf(line, "%*s %lld %lld %lld %lld %lld %lld %lld", &user, &nice, &system, &idle, &iowait, &irq, &softirq);
                work_jiffies_after[i] = user + nice + system;
                total_jiffies_after[i] = user + nice + system + idle + iowait + irq + softirq;
            } 
        }
    fclose(fp);

    // calculate the load
    for (int i = 0; i < (core_count); i++){
        if (total_jiffies_after[i] - total_jiffies_before[i] != 0) {        // only divide if we sure divisor is non zero
        load[i] = (100 * (work_jiffies_after[i] - work_jiffies_before[i])) / (total_jiffies_after[i] - total_jiffies_before[i]);
        } else {
            load[i] = (100 * (work_jiffies_after[i] - work_jiffies_before[i])) / 1;     // pick the next closest difference to zero
        }
    }

    // save the jiffy count for the next interval
    for (int i = 0; i < (core_count); i++){
        work_jiffies_before[i] = work_jiffies_after[i];
        total_jiffies_before[i] = total_jiffies_after[i];
    }
    //return load;
}


// based on this example: https://stackoverflow.com/questions/43116/how-can-i-run-an-external-program-from-c-and-parse-its-output
int acc_cmdln(char *cmd){
    char buf[BUFSIZE];  // response buffer
    FILE *fp;

    if ((fp = popen(cmd, "r")) == NULL) {
        printf("Error opening pipe\n");
        return -1;
    }

    while (fgets(buf, BUFSIZE, fp) != NULL) {
        printf(" %s", buf);  // print response to console
    }

    if (pclose(fp) == -1) {
        printf("Command not found or exited with error status\n");
        return -1;
    }

    return 0;
}


// ------------------------  Model Specific Register  -----------------------------------
//function from https://web.eece.maine.edu/~vweaver/projects/rapl/index.html
int open_msr(int core) {

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
			perror("rdmsr : open");
			fprintf(stderr,"Trying to open %s\n",msr_filename);
			exit(127);
		}
	}

	return fd;
}

long long read_msr(int fd, int which) {

	uint64_t data;

	if ( pread(fd, &data, sizeof data, which) != sizeof data ) {
		perror("rdmsr : pread");
		exit(127);
	}

	return (long long)data;
}

// ----------------- End Model Specific Registers ----------------------

float * voltage_v(int core_count) {

    int fd;
    long long result[core_count];
    float *voltage = malloc((core_count) * sizeof(*voltage));
    float total;

    for (int i = 0; i < core_count; i++) {
        fd=open_msr(i);
        result[i] = read_msr(fd,MSR_PERF_STATUS); 
        close(fd);
    }
    // convert results into voltages
    for (int i= 0; i < core_count; i++) {
        result[i] = result[i]&0xffff00000000;   // remove all bits except 47:32 via bitmask, thx: https://askubuntu.com/questions/876286/how-to-monitor-the-vcore-voltage
        result[i] = result[i]>>32;              // correct for positioning of bits so that value is correctly interpreted (Bitshift)
        voltage[i] = (1.0/8192.0) * result[i];    // correct for scaling according to intel documentation    
        total += voltage[i];
    }

    return voltage;
}


void power_limit_msr(int core_count){
    int fd;
    long long result;

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

double * power_units(void){

    int fd;
    unsigned long long result, lock;
    double power_unit, energy_unit, time_unit, time_y, time_z;
    double pkg_pl1, pkg_pl2, pkg_tw1, pkg_tw2;

    fd=open_msr(0);
    result = read_msr(fd, MSR_RAPL_POWER_UNIT);
    close(fd);

    power_unit = 1 / pow(2,result&0xF);          // default 0,125 W increments
    energy_unit = 1 / pow(2,(result&0x1F00)>>8);       // default 15,3 µJ
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


int gpu(void){
    
    char file_buf[BUFSIZE];
    static int freq_mhz;

    FILE *fp = fopen("/sys/class/drm/card0/gt_cur_freq_mhz", "r");
    if (fp == NULL){
        perror("Error reading GPU frequency from /sys/class/drm/card0/gt_cur_freq_mhz\n");
    }
    fgets(file_buf, BUFSIZE, fp);
    sscanf(file_buf, "%d", &freq_mhz);
    fclose(fp);

    return freq_mhz;

}


void  moving_average(int i, float * freq, int *load, int *temp, float *voltage, float *power){

    i += 1;
    double freq_total = 0;
    long load_total = 0;
    long temp_total = 0;
    double voltage_total = 0;
    double power_total = 0;


    for (int j = 0; j < i; j++){
        freq_total += (double)freq[j];
        load_total += (long)load[j];
        temp_total += (long)temp[j];
        voltage_total += (double)voltage[j];
        power_total += (double)power[j];
    }

    if (i != 0){        // only divide is divisor is non zero
        printf("CPU\t%.1f\t%ld\t%ld\t%.2f\tlast minute avg\n", freq_total/i, load_total/i, temp_total/i, voltage_total/i );
        printf("Avg Pwr %.2f W\n", power_total/i);
    }
}

float runtime_avg(long poll_cycle_counter, float *samples_cumulative, float * sample_next){
    
    float avg = 0;
    *samples_cumulative += *sample_next;
    if (poll_cycle_counter != 0) 
    {
        avg = *samples_cumulative / (float) poll_cycle_counter;
    }

    return avg;
}

float calc_average(float *samples, int sample_count){
    float sum = 0;
    for (int i = 0; i < sample_count; i++){
        sum += samples[i];
    }
    float avg = sum / (float)sample_count;
    
    return avg;
}

float min(float previous_min_value, float sample_next){
    
    if (sample_next < previous_min_value) 
    {
        return sample_next;
    } 
    else 
    {
        return previous_min_value;
    }
}


// requires ectool, a programm to communicate with the embedded controller build from this repository: https://github.com/DHowett/framework-ec
int print_fanspeed(void){  // based on this example: https://stackoverflow.com/questions/43116/how-can-i-run-an-external-program-from-c-and-parse-its-output
    char buf[BUFSIZE];  // response buffer
    FILE *fp;

    int *duty =  malloc(sizeof *duty);
    if ((fp = popen("ectool pwmgetduty 0", "r")) == NULL) {
        printw("Error accessing the ectool. Error opening pipe\n");
        return -1;
    }
    while (fgets(buf, BUFSIZE, fp) != NULL) {
        sscanf(buf, "%*s%*s%*s%d", duty);
        printw("Fan speed %d %% ", (100 * *duty)/ 65536 );  // print response to console
    }
    if (pclose(fp)) {   // error
        return -1;
    }
    
    int *rpm =  malloc(sizeof *rpm);
    if ((fp = popen("ectool pwmgetfanrpm", "r")) == NULL) {
        printw("Error accessing the ectool. Error opening pipe\n");
        return -1;
    }
    while (fgets(buf, BUFSIZE, fp) != NULL) {
        sscanf(buf, "%*s%*d%*s%d", rpm);
        printw("(%d RPM)\n", *rpm);  // print response to console
    }
    if (pclose(fp)) {
        return -1;
    }
    return 0;
}

