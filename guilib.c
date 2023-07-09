#include <ncurses.h>
#include "guilib.h"

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
    int ch = getch();

    if (ch != ERR) {
        return ch;
    } else {
        return 0;
    }
}

void * draw_power(long * value){

    int value_count = 3;
    int width = 48;                         // choose highly composite number
    long total = value[0];

    printw("\t\tPkg Power = %.2f W\n", ((float)value[0])*1e-6);
    value[0] = value[0] - value[1] - value[2];      // subtract cpu and uncore power from package power to get "rest of chip power"
    for (int i = 0; i < value_count; i++){
        switch (i) {
            case 0: attron(COLOR_PAIR(BLUE)); break;
            case 1: attron(COLOR_PAIR(RED)); break;
            case 2: attron(COLOR_PAIR(GREEN)); break;
        }
        for (int j = 0; j < ( (value[i] * width) / total ); j++ ){
            printw("#");
        }
    }
    attron(COLOR_PAIR(BLUE));
    printw("\nRest of Pkg: %.2f W",((float)value[0])*1e-6);
    attron(COLOR_PAIR(RED));
    printw("  Cores: %.2f W",((float)value[1])*1e-6);
    attron(COLOR_PAIR(GREEN));
    printw("  GPU: %.2f W",((float)value[2])*1e-6);
    attron(COLOR_PAIR(WHITE));
    //printw(DEFAULT_COLOR "\n");
}