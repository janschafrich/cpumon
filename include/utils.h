#ifndef UTILS
#define UTILS

#include <stddef.h>
#include "cpumonlib.h"

char *read_sysfs_string(const char *filepath, char *buf, size_t buflen);

void compute_moving_average(int n, int history_cntr,
                            struct sensor *freq, struct sensor *load,
                            struct sensor *temp, struct sensor *voltage,
                            struct sensor *power);

#endif // UTILS
