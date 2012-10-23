#!/bin/bash
# $Id: $

FILESYSTEM_IMAGE=netkit-fs-i386-F5.2-1GiB 
NEW_SIZE=1077511680
dd if=/dev/zero of=$FILESYSTEM_IMAGE count=0 seek=$NEW_SIZE bs=1
fdisk -u -C 131 netkit-fs-i386-F5.2-1GiB

LOOP_DEV=`losetup -f`
losetup -o 32768 $LOOP_DEV netkit-fs-i386-F5.2-1GiB
mkfs.ext2 -q -L "netkit-fs-i386-F5.2-1GiB" -b 1024 -m 0 -F $LOOP_DEV
tune2fs -i 0 $LOOP_DEV
losetup -d $LOOP_DEV

