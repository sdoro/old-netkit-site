#!/bin/sh
# $Id: make-kqemu.sh,v 1.1 2006/01/12 15:29:30 doros Exp $

if [ "none$ENV $KNO" != "none" ]; then
  mknod $KNO/source/dev/kqemu c 250 0
  chmod 666 $KNO/source/dev/kqemu
else
  echo "Variable KNO missing."
fi

exit 0
