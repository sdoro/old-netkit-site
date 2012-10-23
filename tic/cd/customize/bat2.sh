#!/bin/bash
# $Id: bat2.sh,v 1.13 2009-03-29 11:44:01 doros Exp $

set -e

if [ "none$ENV $KNO" != "none" ]; then
  mkisofs -R -U -V "Netkit 2.8-K2.8-F5.2" \
          -publisher "IT Zuccante" -hide-rr-moved \
          -cache-inodes -no-bak -pad $KNO/source | \
          nice -n 5 create_compressed_fs -m -B 65536 - $KNO/master/KNOPPIX/KNOPPIX
fi

# bot
