#!/bin/sh
# $Id: counter.sh,v 1.1 2004/02/09 21:52:46 doros Exp $

echo Content-type: text/html
echo

N=$QUERY_STRING
echo "<HTML>"

case "x$N" in

x)	N=1
	echo "This is the initial page.<BR><BR>"
	;;

x[0-9]*)	N=`expr $N + 1`
	echo "You have refreshed this page $N times.<BR><BR>"
	;;

*)	echo "The URL you used is invalid.</HTML>"
	exit 0
	;;

esac

echo "<A HREF=\"http://$SERVER_NAME$SCRIPT_NAME?$N\">"
echo "Click here to refresh the page.</A></HTML>"

