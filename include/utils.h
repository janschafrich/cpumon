#ifndef UTILS
#define UTILS


char *read_string(const char *filepath);
int read_line(char *return_string, const char *filepath);
int acc_cmdln(char *cmd);
void  moving_average(int i, float * freq, float *load, float *temp, float *voltage, float *power);
float runtime_avg(long poll_cycle_counter, float *samples_cumulative, float *sample_next);
float get_min_value(float previous_min_value, float *sample_next, int sample_count);
float get_max_value(float previous_min_value, float *sample_next, int sample_count);





#endif // UTILS_H