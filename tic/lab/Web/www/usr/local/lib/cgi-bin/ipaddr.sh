#!/bin/sh
# $Id: ipaddr.sh,v 1.1 2004/02/09 21:52:00 doros Exp $

FILE=/tmp/ipaddr

echo Content-type: text/plain
echo

# See if IP addres of browser's computer appears in our file

if grep -s $REMOTE_ADDR $FILE  > /dev/null 2>&1
then

 echo Computer $REMOTE_ADDR has requested this URL previously.

else

 # Append browser's address to the file

 echo $REMOTE_ADDR >> $FILE
 echo This is the first contact from computer $REMOTE_ADDR.

fi
