#ifndef GUILIB
#define GUILIB

/* Terminal formatting
#define BOLD        "\e[1m"
#define BOLD_OFF    "\e[m"
#define CLEAR       "\e[1;1H\e[2J"
#define DEFAULT_COLOR  "\x1B[0m"
#define BLACK       "\x1B[30m"
#define RED         "\x1B[31m"
#define GREEN       "\x1B[32m"
#define YELLOW      "\x1B[33m"
#define BLUE        "\x1B[34m"
#define MAGENTA     "\x1B[35m"
#define CYAN        "\x1B[36m"
#define WHITE       "\x1B[37m"
*/
/* ncurses terminal formatting*/

#define WHITE   1
#define BLUE    2
#define RED     3
#define GREEN   4

void init_gui(void);
int kbhit(void);
void draw_power(float * value, float pkg_avg);



#endif
