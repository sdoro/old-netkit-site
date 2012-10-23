#!/bin/sh

echo "script_master.sh" >> /tmp/msg.txt
echo "$*" >> /tmp/msg.txt

if [ "$1" = "VI_1" ] ; then
  # refreshing ARP cache
  arping -c 5 -U -I eth0 88.36.248.231
  arping -c 5 -U -I eth0 88.36.248.247
  #
  echo "IPSec stop, workaround and IPSec start ..." >> /tmp/msg.txt
  /etc/init.d/ipsec stop
  #ip addr del 88.36.248.230/27 brd 88.36.248.255 dev ipsec0
  #ip addr add 88.36.248.228/27 brd 88.36.248.255 dev ipsec0
  /etc/init.d/ipsec start
fi

if [ "$1" = "VI_3" ] ; then
  cp /etc/default/v-snmpd /etc/default/snmpd
  /etc/init.d/snmpd restart
fi

# bot
