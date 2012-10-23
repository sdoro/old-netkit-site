#!/bin/sh
# $Id: defrag.sh,v 1.12 2006/06/27 20:02:37 doros Exp $
#
# Compacts UML filesystem saving and restoring (tar)
#

if [ ! `id -u` = 0 ] ; then
  echo $0: Only root can do that.
  exit 1
fi

VER=2.2
SUB_VER=

FS_INPUT=$VLAB_HOME/fs/default
FS_OUTPUT=/tmp/Netkit4TIC-$VER$SUB_VER.fs

if [ ! -f $FS_INPUT ] ; then
  echo $0: no input file.
  exit 1
fi

SIZE=700
CILS=$((700*1024*1024/2097152))
dd if=/dev/zero of=$FS_OUTPUT bs=1M count=$SIZE
sfdisk -q -H 128 -S 32 -C $CILS $FS_OUTPUT 1>/dev/null 2>/dev/null << EOF
,$CILS,L,*
,
,
,
EOF

LOOP_DEV=`losetup -f`
losetup -o 16384 $LOOP_DEV $FS_OUTPUT
mkfs.ext2 -q -L "Netkit4TIC-$VER$SVER" -b 1024 -m 0 -F $LOOP_DEV
tune2fs -i 0 $LOOP_DEV
losetup -d $LOOP_DEV

mkdir -p /mnt/netkit-i
mkdir -p /mnt/netkit-o
mount -o loop,offset=16384 $FS_OUTPUT /mnt/netkit-o
mount -r -o loop $FS_INPUT /mnt/netkit-i
pushd /mnt/netkit-i; \
  tar -cpf - . --exclude=lost+found --exclude=.journal | \
  (cd /mnt/netkit-o; tar -xpf -)
popd
umount /mnt/netkit-o
umount /mnt/netkit-i
#rm -f /mnt/netkit-o
#rm -f /mnt/netkit-i

exit 0
