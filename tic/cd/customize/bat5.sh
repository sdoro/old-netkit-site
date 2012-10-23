#!/bin/bash
# $Id: bat5.sh,v 1.3 2007-02-13 11:57:12 doros Exp $

set -e

if [ "none$ENV $KNO" != "none" ]; then
  md5sum Netkit4TIC.iso >  Netkit4TIC.iso.md5
  cat /dev/hdc | md5sum > Netkit4TIC.iso.CD
fi

# bot
