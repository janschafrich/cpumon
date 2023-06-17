
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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
            break;
        //} else {
        //    printf("Error reading CPU model name from /proc/cpuinfo\n");
        }
    }

    fclose(fp);
    return model;
}