#!/bin/sh
# $Id: k-2.4.27-bs.sh,v 1.3 2006/06/27 16:53:08 doros Exp $

set -e

BASE=`pwd`/..
PATCHES=$BASE/bering-uclibc-patches/2.4.26/patches
WKS_SPACE=/tmp/k
WKS_SPACE_MOD=/tmp/m

rm -rf $WKS_SPACE
rm -rf $WKS_SPACE_MOD
mkdir $WKS_SPACE
cd $WKS_SPACE

# apt-get install kernel-source-2.4.27
# apt-get install kernel-patch-debian-2.4.27
# apt-get install kernel-headers-2.4.27-2-386
# apt-get install kernel-headers-2.4.27-2
tar jxf /usr/src/kernel-source-2.4.27.tar.bz2
ln -s kernel-source-2.4.27 linux
tar zxf $BASE/drbd/drbd0.7.tar.gz
tar zxf $BASE/afs/openafs.tar.gz


cd linux
set +e
bunzip2 $BASE/uml-patches/uml-patch-2.4.24-1base.patch.bz2 -c | patch -p1
bunzip2 $BASE/uml-patches/uml-2.4.27-bs1.patch.bz2 -c | patch -p1
set -e
bunzip2 $BASE/uml-patches/serial.patch.bz2 -c | patch -p0
bunzip2 $BASE/uml-patches/uml-port-helper-location.patch.bz2 -c | patch -p1


bunzip2 $BASE/kernels/command_line_size.patch.bz2 -c | patch -p1
bunzip2 $BASE/kernels/EXPORT_SYMBOL.patch.bz2 -c | patch -p0
cp $BASE/config/.config-2.4.27-bs .config
make oldconfig ARCH=um
make dep ARCH=um
make linux ARCH=um
strip linux
cp linux $BASE/linux/linux-2.4.27-bs1


# modules
make modules ARCH=um
mkdir /tmp/m
# drbd (Remember: in real amd64 we must call "make GCC=gcc-3.4"
cd $WKS_SPACE/modules/drbd/drbd
make ARCH=um KDIR=/tmp/k/linux
# openafs
cd $WKS_SPACE/linux
gunzip $BASE/afs/patch-kernel-2.4.26.gz -c | patch -p0
cd $WKS_SPACE/modules/openafs
gunzip $BASE/afs/patch-uml24-missing.gz -c | patch -p0
gunzip $BASE/afs/patch-untainted.gz -c | patch -p0
gunzip $BASE/afs/patch-afs.1.gz -c | patch -p0
gunzip $BASE/afs/patch-afs.2.gz -c | patch -p0
gunzip $BASE/afs/patch-afs.3.gz -c | patch -p0
gunzip $BASE/afs/patch-afs.4.gz -c | patch -p0
KSRC=/tmp/k/linux fakeroot \
  make -f debian/rules ARCH=um binary-modules

# install modules
cd $WKS_SPACE/linux
make INSTALL_MOD_PATH=/tmp/m modules_install ARCH=um

#
# bot
