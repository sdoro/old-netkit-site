#!/bin/sh

echo "script_master.sh" >> /tmp/msg.txt
echo "$*" >> /tmp/msg.txt

if [ "$1" = "VI_1" ] ; then
  echo "IPSec stop, workaround and IPSec start ..." >> /tmp/msg.txt
  /etc/init.d/ipsec stop
  #ip addr del 88.36.248.230/27 brd 88.36.248.255 dev ipsec0
  #ip addr add 88.36.248.228/27 brd 88.36.248.255 dev ipsec0
  /etc/init.d/ipsec start
fi

# bot
