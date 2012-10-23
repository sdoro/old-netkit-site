/* $Id: openpty.c,v 1.1 2006/08/04 17:04:11 doros Exp $ */

#include <stdlib.h>
#include <unistd.h>
#include <pty.h>
#include <utmp.h>
#include <sys/time.h>
#include <sys/wait.h>
#include <sys/types.h>

int main() {
    int fdm, fds;
    int pid, i;
    fd_set set;
    char buf[64];

    if (openpty(&fdm, &fds, NULL, NULL, NULL))
        exit(1);
    if ((pid = fork()) < 0)
        exit(2);
    if (!pid) {
        /*child*/
        close(fdm);
        login_tty(fds);
        execl("/bin/sh", "sh", NULL);
        exit(3);
    }
    /*father: copy stdin/stdout to/from master */
    close(fds);
    system("stty raw -echo");
    FD_ZERO(&set);
    while (waitpid(pid, &i, WNOHANG)!=pid) {
        FD_SET(0,&set);
        FD_SET(fdm,&set);
        select(fdm+1, &set, NULL, NULL, NULL);
        if (FD_ISSET(0, &set)) {
            i = read(0, buf, 64);
            if (i>0) write(fdm, buf, i);
        }
        if (FD_ISSET(fdm, &set)) {
            i = read(fdm, buf, 64);
            if (i>0) write(1, buf, i);
        }
    }
    system("stty sane");
    exit(0);
}
