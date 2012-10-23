// $Id: client.c,v 1.1 2004/04/19 20:56:34 doros Exp $

#include <string.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <stdio.h>

#define DEST_IP    "192.168.100.1"
#define DEST_PORT  2000

#define MAX_LINE   256

int main () {
  int rc, n;
  char recvline [MAX_LINE + 1];
  int sockfd;
  struct sockaddr_in dest_addr;

  if ((sockfd = socket (PF_INET, SOCK_STREAM, 0)) < 0) {
     printf ("errore in socket()\n");
	 exit (1);
  }

  dest_addr.sin_family = AF_INET;
  dest_addr.sin_port = htons (DEST_PORT);
  dest_addr.sin_addr.s_addr = inet_addr (DEST_IP);

  bzero (&(dest_addr.sin_zero), 8);
  rc = connect (sockfd, (struct sockaddr *)&dest_addr, sizeof(struct sockaddr));
  if (rc != 0) {
	printf ("errore: %d\n", rc);
	exit (1);
  }

  while ( (n = recv (sockfd, recvline, MAX_LINE, 0)) > 0) {
	recvline[n] = 0;
	if (fputs(recvline, stdout) == EOF) {
	  printf ("errore in fputs()\n");
	  exit (1);
	}
  }
  if (rc < 0) {
	printf ("errore: read error\n");
	exit (1);
  }

  return 0;
}
