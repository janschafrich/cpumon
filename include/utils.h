#ifndef UTILS
#define UTILS


char *read_sysfs_string(const char *filepath, char *buf, size_t buflen);

int acc_cmdln(char *cmd);
void compute_moving_average(int n, float *freq, float *load, float *temp, float *voltage, float *power);
float get_runtime_avg(long period_cntr, float *samples_cumulative, float *sample_next);
float get_min_value(float previous_min_value, float *sample_next, int sample_count);
float get_max_value(float previous_min_value, float *sample_next, int sample_count);




#endif // UTILS_H