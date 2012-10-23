#!/bin/sh

echo "script_fault.sh" >> /tmp/msg.txt
echo "$*" >> /tmp/msg.txt

if [ "$1" = "VI_1" ] ; then
  echo "IPSec stop ..." >> /tmp/msg.txt
  /etc/init.d/ipsec stop
fi

# bot
