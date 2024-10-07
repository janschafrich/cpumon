#include <stdio.h>
#include "../include/cpumonlib.h"



char *read_chars(const char *filepath)     // function from data type pointer
{     
#if DEBUG_ENABLE
        printf("read_chars filepath = %s\n", filepath);
#endif
    FILE *fp = fopen(filepath, "r");
    static char file_buf[BUFSIZE];          // allocate memory on the heap to store file content 
    int i = 0;
    int single_character;

    if(fp == NULL) {
        perror("Error opening file\n");
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


int read_chars_new(char *return_string, const int n, const char *filepath)     // function from data type pointer
{     
#if DEBUG_ENABLE
        printf("read_chars filepath = %s\n", filepath);
#endif
    FILE *fp = fopen(filepath, "r");

    if(fp == NULL) {
        perror("Error opening file\n");
        return -1;
    }

    int i = 0;
    int single_character;

    while ((single_character = fgetc(fp)) != EOF && i < (n) ){
        if(single_character == '\n'){
            continue;           // skip newline characters
        } else 
        {
            return_string[i] = single_character;
        }
        i++;
    }

    return_string[i] = '\0';                 // terminate string
    fclose(fp);

    return 0;                           
}



// int open_file(FILE *fp, const char *filepath)
// {
//     fp = fopen(filepath, "r");

//     if (fp == NULL)
//     {
// #if DEBUG_ENABLE
//         printf("Error open_file filepath = %s\n", filepath);
// #endif    
//         return -1;
//     } else
//     {
//         return 0;
//     }
// }


// int read_chars_modular(char *return_string, const int n, FILE *fp)     // function from data type pointer
// {     
//     int i = 0;
//     int single_character;

//     while ((single_character = fgetc(fp)) != EOF && i < (n + 1) ){
//         if(single_character == '\n'){
//             continue;           // skip newline characters
//         } else 
//         {
//             return_string[i] = single_character;
//         }
//         i++;
//     }

//     return_string[i] = '\0';                 // terminate string
//     fclose(fp);

//     return 0;                           
// }



// int read_string(char *return_string, const char *filepath) 
// {     
// #if DEBUG_ENABLE
//         printf("read_string filepath = %s\n", filepath);
// #endif
//     FILE *fp = fopen(filepath, "r");

//     if(fp == NULL) {
//         perror("Error opening file\n");
//         return -1;
//     } 
//     if (fscanf(fp, "%s", return_string) == 1)
//     {
//         fclose(fp);
//         return 0;
//     }
//     if (fscanf(fp, "%s", return_string) == EOF)
//     {
//         //printf("Couldnt read data from \"%s\"\n", filepath);
//         fclose(fp);
//         return -1;
//     }

//     fclose(fp);
//     return -1;
        
// }


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


void  compute_moving_average(int i, float * freq, float *load, float *temp, float *voltage, float *power){

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

