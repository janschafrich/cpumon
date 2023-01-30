#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <locale.h>
#include <unistd.h>
#include <dirent.h>
#include <errno.h>
#include <fcntl.h>                  // open()
#include <sys/stat.h>               // open()
#include <math.h>


/* Terminal formatting*/
#define BOLD        "\e[1m"
#define BOLD_OFF    "\e[m"
#define CLEAR       "\e[1;1H\e[2J"
#define DEFAULT_COLOR  "\x1B[0m"
#define BLACK       "\x1B[30m"
#define RED         "\x1B[31m"
#define GREEN       "\x1B[32m"
#define YELLOW      "\x1B[33m"
#define BLUE        "\x1B[34m"
#define MAGENTA     "\x1B[35m"
#define CYAN        "\x1B[36m"
#define WHITE       "\x1B[37m"


#define CPU_CORES   8
#define POWER_LIMIT_COUNT 2
#define BUFSIZE     64
#define POLL_INTERVAL_S 1
#define POWER_DOMAINS   3       // pkg, cores, gpu

#define MSR_PERF_STATUS         0x198
#define MSR_RAPL_POWER_UNIT		0x606
#define MSR_PKG_POWER_LIMIT     0x610
#define IA32_PACKAGE_THERM_STATUS       0x1B1

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

#define CPU_TIGERLAKE       140


char *read_string(const char *);
char *identifiy_cpu(void);
long * power_uw(void);
int * power_limits_w();
int * cpucore_load();
float * freq_ghz();
int *temp_core_c();
int acc_cmdln(char *cmd);
static int open_msr(int);
float * voltage_v();
double * power_units();
void power_limit_msr();
int gpu();
char *draw(float);
char * draw_relative(float *);
void * draw_power(long * );
void power_config(void);

int main (int argc, char **argv){
    setlocale(LC_NUMERIC, "");
    
    // flags
    int display_power_config = 0;
    
    char *file[20];
    char *bar[30];
    char *path;
    int *temp, *load, gpu_freq;

    float *freq, *voltage;
    long *power;

    const uid_t root = geteuid();

    char *cpu_model[1];
    *cpu_model = identifiy_cpu();  

    int c;

    while ((c =getopt(argc, argv, "c:hmps")) != -1){
        switch (c) {
            case 'p':
                display_power_config = 1; break;
            default:
			    fprintf(stderr,"Unknown option %c\n",c); exit(EXIT_FAILURE);
        }
    }
    
    while (1) {
        
        printf(CLEAR);                 // clear console

        if (root != 0){
            printf("To monitor all metrics, pls run as root.\n\n");
        }
        
        printf(BOLD "\n\t\t%s\n\n" BOLD_OFF, *cpu_model);

        //power_units();

        freq = freq_ghz();
        load = cpucore_load();
        temp = temp_core_c();
        gpu_freq = gpu();
        
        if (root == 0) {
            voltage = voltage_v();
            power = power_uw();
        }
    
        //*bar = draw(load[CPU_CORES]);

        // ------------------  output to terminal ------------------------------
        if (root == 0) {
        printf("       f/GHz \tC0%%   Temp/°C\tU/V\n");
        printf("-------------------------------------\n");
        for (int i = 0; i < CPU_CORES; i++){   
        printf("Core %d \t%.1f\t%-d\t%d\t%.2f\n", i, freq[i], load[i], temp[i], voltage[i]);
        }
        printf("\nCPU\t%.1f\t%d\n", freq[CPU_CORES], load[CPU_CORES]);
        printf("\nGPU\t%d MHz\t\t%.2f W\n\n", gpu_freq, ((float)power[2])*1e-6);
        //printf("\nPackage %.1f %% %s\n", load[CPU_CORES], *bar); 
        
        draw_power(power);
        //printf("\nPower System = %.2f W\n", ((double)power[3])*1e-12);
        power_limit_msr();

        if (display_power_config == 1) {
            power_config();
        } 
        }
        // --------------   non root -------------------
        else {
        printf("\tf/GHz \tC0%% \tTemp/°C\n");
        for (int i = 0; i < CPU_CORES; i++){   
        printf("Core %d \t%.1f\t%d\t%d\n", i, freq[i], load[i]/10, temp[i]);
        }
        //draw_relative(load);
        printf("\nGPU\t%d\n", gpu_freq);
        printf("\nPkg: \t\t%d %%\n", load[CPU_CORES]/10); 
    
            *file = read_string("/sys/devices/system/cpu/cpu0/cpufreq/energy_performance_preference");
        printf("Energy-Performance-Preference: %s", *file);
            *file = read_string("/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor");
        printf("CPU Frequency Scaling Governor: %s\n", *file);   
        }
 
       sleep (POLL_INTERVAL_S);

    }
    return (EXIT_SUCCESS);

}


char *read_string(const char *filepath) {     // function from data type pointer

    FILE *fp = fopen(filepath, "r");
    static char file_buf[BUFSIZE];          // allocate memory on the heap to store file content 

    if(fp == NULL) {
        perror("Error opening file");
        return(NULL);
    }

    if (fgets(file_buf, BUFSIZE, fp) == NULL) {
        perror("Error reading from file");
        return(NULL);
    }
    fclose(fp);
    return file_buf;                    // return address to file
}

void power_config(void){
    int *power_limits = power_limits_w();
    printf("\nPower Limits: PL1 = %d W, PL2 = %d\n", power_limits[0], power_limits[1]);
    char *file[BUFSIZE];
    *file = read_string("/sys/devices/system/cpu/intel_pstate/no_turbo");
    if (strncmp(*file, "0", 1) == 0) {
        printf("Turbo: enabled\n");     
    } else {
        printf("Turbo: disabled\n");
    }      
    *file = read_string("/sys/devices/system/cpu/cpu0/cpufreq/energy_performance_preference");
    printf("Energy-Performance-Preference: %s", *file);
    *file = read_string("/sys/devices/system/cpu/cpufreq/policy0/scaling_driver");
    printf("Scaling Driver: %s",*file);
    *file = read_string("/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor");
    printf("CPU Frequency Scaling Governor: %s\n", *file);           
}

int * temp_core_c(void){

    FILE *fp;
    int core_count = 4;
    int hwmon = 6;
    char file_buffer[BUFSIZE];
    char *basename = "/sys/bus/platform/drivers/coretemp/coretemp.0/hwmon/";
    char path_dir[256];
    char path_file[256];
    long temp[CPU_CORES/2];
    static int temperature[CPU_CORES];
    // determine the hwmon for CPU core temperatures
    

    DIR *dp = opendir(basename);
    if (dp == NULL) {
        perror("Erro opening directory");
    }
    struct dirent *entry;
    while( (entry = readdir(dp)) != NULL){
        if (strcmp(entry->d_name,".") != 0) {
            sprintf(path_dir, "%s%s", basename, entry->d_name);
        }  
    }
    closedir(dp);

    for (int i = 2; i < (2 + core_count); i++){
        sprintf(path_file,"%s/temp%d_input", path_dir, i);       // build path
        fp = fopen(path_file,"r");
		if (fp == NULL) {
        perror("Erro opening file");
        } else {
            fscanf(fp, "%ld", &temp[i-2]);
            fclose(fp);
        }
    }

    for (int i = 0; i < CPU_CORES; i++) {
       temperature[i] = (int)(temp[i/2] / 1000); // i/2 -> write value twice
    }
    
    return temperature;
}

long * power_uw(void) {
	FILE *fp;
    static long long energy_uj_before[POWER_DOMAINS];
    long long energy_uj_after[POWER_DOMAINS];
    static long power_uw[POWER_DOMAINS+1];

    char *power_domains[] = {"/sys/class/powercap/intel-rapl/intel-rapl:0/energy_uj",
                            "/sys/class/powercap/intel-rapl/intel-rapl:0/intel-rapl:0:0/energy_uj",
                            "/sys/class/powercap/intel-rapl/intel-rapl:0/intel-rapl:0:1/energy_uj"};

    for (int i = 0; i < POWER_DOMAINS; i++) {
        fp = fopen(power_domains[i],"r");
				if (fp==NULL) {
					fprintf(stderr,"\tError opening !\n");
				}
				else {
					fscanf(fp,"%lld",&energy_uj_after[i]);
					fclose(fp);
                }
    }

    char file_buf[BUFSIZE];
    long voltage_uv;
    long current_ua;
    fp = fopen("/sys/class/power_supply/BAT1/voltage_now", "r");
    if (fp == NULL){
        perror("Error opening file\n");
    }
    fgets(file_buf, BUFSIZE, fp);
    sscanf(file_buf, "%ld", &voltage_uv);
    fclose(fp);
    
    fp = fopen("/sys/class/power_supply/BAT1/current_now", "r");
    if (fp == NULL){
        perror("Error opening file\n");
    }
    fgets(file_buf, BUFSIZE, fp);
    sscanf(file_buf, "%ld", &current_ua);
    fclose(fp);

    long power_system_uw = voltage_uv * current_ua;
    
    for (int i = 0; i < POWER_DOMAINS; i++){
        power_uw[i] = (long)  (double)(energy_uj_after[i] - energy_uj_before[i]) / (double) POLL_INTERVAL_S ;
    }

    power_uw[POWER_DOMAINS] = power_system_uw;
    
    for (int i = 0; i < POWER_DOMAINS; i++){
        energy_uj_before[i] = energy_uj_after[i];
    }	

    return power_uw;
}

char *identifiy_cpu(void){
    FILE *fp = fopen("/proc/cpuinfo", "r");
    if (fp == NULL) {
        perror("Error opening file");
        return (NULL);
    } 

    char file_buf[BUFSIZ];
    char *model = malloc (sizeof *model);
    char *line;
    
    
    while(1) {
        line = fgets(file_buf, BUFSIZ, fp);
        if (line == NULL) break;
    
        if(!strncmp(line, "model name", 10)) {
            sscanf(line,"%*s%*s%*s%*s%*s%*s%*s%s", model);         // every whitespace starts a new string, asterisk = ignore
            printf("Model: %s", model );
            break;
        } else {
            printf("Error reading CPU model name from /proc/cpuinfo\n");
        }
    }
    fclose(fp);
    return model;
}

float * freq_ghz() {
    static float freq_ghz[CPU_CORES+1];
    double total;
    char file_buf[BUFSIZE];
    char path[64];
    FILE *fp;

    for (int i = 0; i < CPU_CORES; i++){
        sprintf(path, "/sys/devices/system/cpu/cpufreq/policy%d/scaling_cur_freq", i);
        fp = fopen(path, "r");
        if (fp == NULL){
            perror("Error opening file\n");
            return NULL;
        }
        fgets(file_buf, BUFSIZE, fp);
        fclose(fp);
        freq_ghz[i] = (float)strtol(file_buf, NULL, 10) / 1000000;
    }

    for (int i = 0; i < CPU_CORES; i++) {
        total += freq_ghz[i];
    }

    freq_ghz[CPU_CORES] = (float) (total / CPU_CORES);


    return freq_ghz;
}

int * cpucore_load() {
    
    FILE *fp = fopen("/proc/stat", "r");
    if (fp == NULL) {
        perror("Error Opening File");
        return NULL;
    }

    char file_buf[BUFSIZ];
    char *line;
    long long user, nice, system, idle, iowait, irq, softirq;
    static long long work_jiffies_before[CPU_CORES+1];        // make available for use in the next interval
    static long long total_jiffies_before[CPU_CORES+1];
    long long work_jiffies_after[CPU_CORES+1];
    long long total_jiffies_after[CPU_CORES+1];
    static int load[CPU_CORES+1];

    char comparator[5];

    while(1) {
        line = fgets(file_buf, BUFSIZ, fp);
        if (line == NULL) {
            break;
        }
        // whole cpu      
        if (!strncmp(line, "cpu", 3)) {
            sscanf(line, "%*s %lld %lld %lld %lld %lld %lld %lld", &user, &nice, &system, &idle, &iowait, &irq, &softirq);
            work_jiffies_after[CPU_CORES] = user + nice + system;
            total_jiffies_after[CPU_CORES] = user + nice + system + idle + iowait + irq + softirq;
        }
        for (int i = 0; i < CPU_CORES; i++) {
            sprintf(comparator,"cpu%d", i);
            if (!strncmp(line, comparator, 4)) {
                sscanf(line, "%*s %lld %lld %lld %lld %lld %lld %lld", &user, &nice, &system, &idle, &iowait, &irq, &softirq);
                work_jiffies_after[i] = user + nice + system;
                total_jiffies_after[i] = user + nice + system + idle + iowait + irq + softirq;
            break;
            } 
        }
    }
    fclose(fp);

    // calculate the load
    for (int i = 0; i < (CPU_CORES+1); i++){
        load[i] = (100 * (work_jiffies_after[i] - work_jiffies_before[i])) / (total_jiffies_after[i] - total_jiffies_before[i]);
    }

    // save the jiffy count for the next interval
    for (int i = 0; i < (CPU_CORES+1); i++){
        work_jiffies_before[i] = work_jiffies_after[i];
        total_jiffies_before[i] = total_jiffies_after[i];
    }
    return load;
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

    if (pclose(fp)) {
        printf("Command not found or exited with error status\n");
        return -1;
    }

    return 0;
}

// ------------------------  Model Specific Register  -----------------------------------
//function from https://web.eece.maine.edu/~vweaver/projects/rapl/index.html
static int open_msr(int core) {

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

static long long read_msr(int fd, int which) {

	uint64_t data;

	if ( pread(fd, &data, sizeof data, which) != sizeof data ) {
		perror("rdmsr : pread");
		exit(127);
	}

	return (long long)data;
}

// ----------------- End Model Specific Registers ----------------------

float * voltage_v() {

    int fd;
    long long result[CPU_CORES];
    static float voltage[CPU_CORES];

    for (int i = 0; i < CPU_CORES; i++) {
        fd=open_msr(i);
        result[i] = read_msr(fd,MSR_PERF_STATUS); 
        close(fd);
    }
    // convert results into voltages
    for (int i= 0; i < CPU_CORES; i++) {
        result[i] = result[i]&0xffff00000000;   // remove all bits except 47:32 via bitmask, thx: https://askubuntu.com/questions/876286/how-to-monitor-the-vcore-voltage
        result[i] = result[i]>>32;              // correct for positioning of bits so that value is correctly interpreted (Bitshift)
        voltage[i] = (1.0/8192.0) * result[i];    // correct for scaling according to intel documentation    
    }

    return voltage;
}

void power_limit_msr(){
    int fd;
    long long result;

    int prochot = 0;;               // Table 2-2 IA-32 Architectural MSRs
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


    for (int i = 0; i < CPU_CORES; i++){
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

    if (prochot == 1) printf(RED "TEMPERATURE\n" DEFAULT_COLOR);
    if (thermal == 1) printf(RED "POWER\n" DEFAULT_COLOR);
    if (residency_state == 1) printf(RED "RESIDENCY\n" DEFAULT_COLOR); 
    if (running_average_thermal == 1) printf(RED "THERMAL\n" DEFAULT_COLOR); 
    if (vr_therm == 1) printf(RED "VOLTAGE REGULATOR\n" DEFAULT_COLOR);  
    if (vr_therm_design_current == 1) printf(RED "CURRENT\n" DEFAULT_COLOR);   
    if (other == 1) printf(RED "OTHER\n" DEFAULT_COLOR); 
    if (pkg_pl1 == 1) printf(RED "PL1\n" DEFAULT_COLOR); 
    if (pkg_pl2 == 1) printf(RED "PL2\n" DEFAULT_COLOR); 
    if (max_turbo_limit == 1) printf(RED "MC_TURBO\n" DEFAULT_COLOR); 
    if (turbo_transition_attenuation == 1) printf(RED "TRANSITION ATTENUATION\n" DEFAULT_COLOR); 
}

double * power_units(){
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


int * power_limits_w() {
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

int gpu(){
    
    char file_buf[BUFSIZE];
    static int freq_mhz;

    FILE *fp = fopen("/sys/class/drm/card0/gt_cur_freq_mhz", "r");
    if (fp == NULL){
        perror("Error opening file\n");
    }
    fgets(file_buf, BUFSIZE, fp);
    sscanf(file_buf, "%d", &freq_mhz);
    fclose(fp);

    return freq_mhz;

}

char * draw(float percentage){

    static char bar[21];
    strcpy(bar,"\0");
    int perc = (int)(percentage+1.0);
    int count;
    for (int i = 0; i < perc; i+=5) {
        strcat(bar, "|");
        count = i;
    }
    for (count; count < 95; count +=5) {
        strcat(bar," ");
    }
    strcat(bar,"|");

    return bar;
    
}

char * draw_relative(float * value_abs){

    int count = 5;
    float total = 0;
    int width = 40;
    char bar[width];
    strcpy(bar,"\0");
    char *colors[] = {MAGENTA, BLUE, RED, CYAN, YELLOW, GREEN};


    for (int i = 0; i < count; i++){
        total += value_abs[i];
    }

    for (int i = 0; i < count; i++){
        for (int j = 0; j < (int)(value_abs[i]/total * width + 0.5); j++ ){
        printf("%s#", colors[i]);
    }
    }

   printf(DEFAULT_COLOR "\n");
}

void * draw_power(long * value){

    int value_count = 3;
    int width = 48;                         // choose highly composite number
    long total = value[0];
      
    char *colors[] = {BLUE, RED, GREEN, YELLOW, CYAN , MAGENTA};

    // if there is no value for system power, plot graph relative to package power
    /*if (value[POWER_DOMAINS] == 0.0) {
        
    
    } else {
        total = value[3];
        value[3] = value[3] - value[0];          // subtract package power from system power to get "power draw of rest of hardware"
    }
    */
    
    printf("\t\tPkg Power = %.2f W\n", ((float)value[0])*1e-6);
    value[0] = value[0] - value[1] - value[2];      // subtract cpu and uncore power from package power to get "rest of chip power"
    for (int i = 0; i < value_count; i++){
        for (int j = 0; j < ( (value[i] * width) / total ); j++ ){
        printf("%s#", colors[i]);
        }
    }
    printf(BLUE "\nRest of Pkg: %.2f W",((float)value[0])*1e-6);
    printf(RED "  Cores: %.2f W",((float)value[1])*1e-6);
    printf(GREEN "  GPU: %.2f W",((float)value[2])*1e-6);
    printf(DEFAULT_COLOR "\n");
}