#!/bin/sh
# $Id: make-tun.sh,v 1.5 2005/01/14 20:52:16 doros Exp $

if [ "none$ENV $KNO" != "none" ]; then
  mkdir $KNO/source/dev/net
  chmod 777 $KNO/source/dev/net
  mknod $KNO/source/dev/net/tun c 10 200
  chmod 666 $KNO/source/dev/net/tun
else
  echo "Variable KNO missing."
fi

exit 0
