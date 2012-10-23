#!/bin/bash
# $Id: bat3.sh,v 1.11 2009-03-29 11:43:41 doros Exp $

set -e

if [ "none$ENV $KNO" != "none" ]; then
  rm -f $KNO/master/boot/isolinux/boot.cat
  mkisofs -pad -l -r -J -v -V "Netkit 2.8-K2.8-F5.2" -hide-rr-moved -v \
         -b boot/isolinux/isolinux.bin -c boot/isolinux/boot.cat \
         -no-emul-boot -boot-load-size 4 -boot-info-table \
         -o $KNO/Netkit-2.8-K2.8-F5.2.iso $KNO/master/
fi

# bot
