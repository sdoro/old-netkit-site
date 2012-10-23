#!/bin/sh
# $Id: make-rc5.d.sh,v 1.2 2005/01/14 20:52:02 doros Exp $

set -e

if [ "none$ENV $KNO" != "none" ]; then
  cp S99uml_switch.extend-capacity $KNO/source/etc/rc5.d/S99Netkit4TIC
else
  echo "Variable KNO missing."
  exit 1
fi

exit 0
