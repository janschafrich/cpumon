#include <stdio.h>


int main () {
    char value[] = "model name	: 11th Gen Intel(R) Core(TM) i7-1165G7 @ 2.80GHz";
    char *model;

    sscanf(value,"%*s%*s%*s%*s%*s%*s%s",model);

    printf("CPU model:  %s\n", model);

    return(0);
}

/*
char * identifiy_cpu(void){
    FILE *fp = fopen("/proc/cpuinfo", "r");
    if (fp == NULL) return -1;
    //char* search_for = "model name";
    int BUFSIZE = 8192;
    char file_buf[BUFSIZE];
    char *model = malloc (sizeof *model);
    char *result;
    
    
    while(1) {
        result = fgets(file_buf, BUFSIZE, fp);
        if (result == NULL) {printf("Error identfiy cpu\n"); break;}
    
        if(!strncmp(result, "model name", 10)) {
            sscanf(result,"%*s%*s%*s%*s%*s%*s%*s%s", model);         // %*s%*s%s
            printf("Model: %s", model );
        } else {
            printf("Error reading CPU model name from /proc/cpuinfo\n");
        }
    }
    fclose(fp);
    return model;
}*/
