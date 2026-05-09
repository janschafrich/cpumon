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
    size_t len = strlen(buf);
    if (len > 0 && buf[len-1] == '\n') buf[len-1] = '\0';
    fclose(fp);
    return buf;
}


void compute_moving_average(int n, int history_cntr,
                            struct sensor *freq, struct sensor *load,
                            struct sensor *temp, struct sensor *voltage,
                            struct sensor *power)
{
    double freq_total = 0, load_total = 0, temp_total = 0;
    double voltage_total = 0, power_total = 0;

    for (int j = 0; j < n; j++) {
        freq_total    += freq->history[j];
        load_total    += load->history[j];
        temp_total    += temp->history[j];
        voltage_total += voltage->history[j];
        power_total   += power->history[j];
    }

    (void)history_cntr;

    if (n > 0) {
        printw("CPU\t%.1f\t%.0f\t%.0f\t%.2f\tlast minute avg\n",
               freq_total / n * 1000, load_total / n,
               temp_total / n, voltage_total / n);
        printw("Avg Pwr %.2f W\n", power_total / n);
    }
}
