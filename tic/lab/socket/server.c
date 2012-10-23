// $Id: server.c,v 1.1 2004/04/19 20:57:09 doros Exp $

#include <arpa/inet.h>
#include <sys/types.h>
#include <sys/socket.h>

#define PORT 2000

#define MAX_LEN 256

int main () {

  int listenfd, connfd;
  char buff [MAX_LEN + 1];
  struct sockaddr_in servaddr;
  time_t ticks;

  listenfd = socket (AF_INET, SOCK_STREAM, 0);
  if (listenfd < 0) {
	printf ("errore: socket()\n");
	exit (1);
  }

  bzero (&servaddr, sizeof(servaddr));
  servaddr.sin_family = AF_INET;
  servaddr.sin_addr.s_addr = htonl (INADDR_ANY);
  servaddr.sin_port = htons (PORT);

  if (bind (listenfd, (struct sockaddr *)&servaddr, sizeof(servaddr)) < 0) {
	printf ("errore in bind\n");
	exit (1);
  }

  listen (listenfd, 5);

  for (;;) {
	connfd = accept (listenfd, (struct sockaddr *) NULL, NULL);
	ticks = time (NULL);
	snprintf (buff, sizeof (buff), "%.24s\r\n", ctime (&ticks));
	send (connfd, buff, strlen (buff), 0);
	close (connfd);
  }

  return 0;
}
