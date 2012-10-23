#!/bin/sh
# $Id: clone.sh,v 1.1 2004/02/24 09:12:02 doros Exp $

mkdir -p /var/www/rrd

cd /var/lib/ntop/rrd/interfaces/eth0
for i in `find . -type d | cut -c3-`;
do
  mkdir -p /var/www/rrd/$i
done
