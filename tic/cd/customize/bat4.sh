#!/bin/bash
# $Id: bat4.sh,v 1.5 2007-02-10 16:38:10 doros Exp $
# from k3b

set -e

if [ "none$ENV $KNO" != "none" ]; then
  cdrecord -v gracetime=2 dev=/dev/hdc speed=4 -dao -eject \
           -data $KNO/Netkit4TIC.iso 
fi

# bot
