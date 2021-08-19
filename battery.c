#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main() {
    char* command = "pmset -g batt | cut -d '%' -f1 | cut -f2 | tail -1";
    while (1) {
        FILE* p = popen(command, "r");
        char buf[4];
        if (p == NULL) {
            return 1;
        }

        if (system("pmset -g batt | grep -q AC") == 0) {
            while (fgets(buf, 4, p) != NULL) {
                if (atoi(buf) >= 100) {
                    system(
                        "osascript -e 'display notification with title "
                        "\"Battery "
                        "Full\" "
                        "subtitle \"Please unplug the battery charger now.\" "
                        "sound name "
                        "\"Submarine\"'");
                }
            }
        }

        pclose(p);
        sleep(10);
    }

    return 0;
}