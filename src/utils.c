#include <stdio.h>
#include <string.h>
#include <ncurses.h>
#include "../include/cpumonlib.h"



char *read_sysfs_string(const char *filepath, char *buf, size_t buflen) {
    FILE *fp = fopen(filepath, "r");
    if (!fp) return NULL;
    if (fgets(buf, buflen, fp) == NULL) {
        fclose(fp);
        return NULL;
    }
    // Remove trailing newline if present
    size_t len = strlen(buf);
    if (len > 0 && buf[len-1] == '\n') buf[len-1] = '\0';
    fclose(fp);
    return buf;
}



// based on this example: https://stackoverflow.com/questions/43116/how-can-i-run-an-external-program-from-c-and-parse-its-output
int acc_cmdln(char *cmd){
    char buf[BUFSIZE];  // response buffer
    FILE *fp;

    if ((fp = popen(cmd, "r")) == NULL) {
        printf("cmd = %s\n", cmd);
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


void compute_moving_average(int n, float *freq, float *load, float *temp, float *voltage, float *power)
{
    double freq_total = 0;
    long load_total = 0;
    long temp_total = 0;
    double voltage_total = 0;
    double power_total = 0;

    for (int j = 0; j < n; j++) {
        freq_total    += (double)freq[j];
        load_total    += (long)load[j];
        temp_total    += (long)temp[j];
        voltage_total += (double)voltage[j];
        power_total   += (double)power[j];
    }

    if (n > 0) {
        printw("CPU\t%.1f\t%ld\t%ld\t%.2f\tlast minute avg\n",
               freq_total/n, load_total/n, temp_total/n, voltage_total/n);
        printw("Avg Pwr %.2f W\n", power_total/n);
    }
}

float get_runtime_avg(long period_cntr, float *samples_cumulative, float *sample_next){
    
    float avg = 0;
    *samples_cumulative += *sample_next;
    if (period_cntr != 0) 
    {
        avg = *samples_cumulative / (float) period_cntr;
    }

    return avg;
}


float get_min_value(float previous_min_value, float *sample_next, int sample_count)
{
    for (int i = 0; i < sample_count; i++)
        {
        if (sample_next[i] < previous_min_value) 
        {
            previous_min_value = sample_next[i];
        } 
    }
    return previous_min_value;
}

float get_max_value(float previous_max_value, float *sample_next, int sample_count)
{
    for (int i = 0; i < sample_count; i++)
        {
        if (sample_next[i] > previous_max_value) 
        {
            previous_max_value = sample_next[i];
        } 
    }
    return previous_max_value;
}

