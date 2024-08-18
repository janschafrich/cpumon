#include <ncurses.h>
#include "../include/cpumonlib.h"
#include "../include/guilib.h"

void init_gui(void){
    initscr();
    cbreak();
    noecho();

    nodelay(stdscr, TRUE);
    scrollok(stdscr, TRUE);
    use_default_colors();
    start_color();
    init_pair(WHITE, COLOR_WHITE, -1);
    init_pair(BLUE, COLOR_BLUE, -1);
    init_pair(RED, COLOR_RED, -1);
    init_pair(GREEN, COLOR_GREEN, -1);
}

int kbhit(void)
{
    int ch = 0;
    ch = getch();

    if (ch != ERR) {
        return ch;
    } else {
        return 0;
    }
}

void draw_power(float* values, int n_domains,float avg, cpu_designer_e cpu_designer){

    float total_power = values[PKG];
    int width = 48;     // choose highly composite number

    float rest_of_pkg = 0;

    if (cpu_designer == INTEL)
    {
        rest_of_pkg = values[PKG] - values[CORES] - values[GPU];
    }

    if (cpu_designer == AMD)
    {
        rest_of_pkg = values[PKG] - values[CORES];
    }

    printw("\tPkg Power: %.2f W, avg: %.2f W\n", values[PKG], avg);
    values[0] = rest_of_pkg;      // subtract cpu and uncore power from package power to get "rest of chip power"
    for (int i = 0; i < n_domains; i++){
        switch (i) {
            case PKG: attron(COLOR_PAIR(BLUE)); break;
            case CORES: attron(COLOR_PAIR(RED)); break;
            case GPU: attron(COLOR_PAIR(GREEN)); break;
        }
        for (int j = 0; j < (int)( (values[i] * width ) / total_power ); j++ ){
            printw("#");
        }
    }
    attron(COLOR_PAIR(BLUE));
    printw("\nRest of Pkg: %.2f W", rest_of_pkg);
    attron(COLOR_PAIR(RED));
    printw("  Cores: %.2f W", values[CORES]);
    attron(COLOR_PAIR(GREEN));
    printw("  GPU: %.2f W", values[GPU]);
    attron(COLOR_PAIR(WHITE));
    printw("\n");
}