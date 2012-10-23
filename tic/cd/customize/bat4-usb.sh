#!/bin/bash
# $Id: bat4-usb.sh,v 1.1 2007-02-10 16:37:58 doros Exp $

if [ "none$ENV $KNO" != "none" ]; then

  dd if=/dev/zero of=$KNO/usb1GiB.img bs=1M count=982
  mkdiskimage -4 $KNO/usb1GiB.img 0 64 32
  syslinux -s -o 16384 $KNO/usb1GiB.img
  mount -o loop,offset=16384 $KNO/usb1GiB.img /mnt/usb
  cd /mnt/usb
  cp -avf $KNO/master/boot/isolinux/* .
  mv -f isolinux.cfg syslinux.cfg
  rm -f isolinux.bin
  cp -avf $KNO/master/* .   
  rm -rf ./boot
  cd
  umount  /mnt/usb

fi

# bot
