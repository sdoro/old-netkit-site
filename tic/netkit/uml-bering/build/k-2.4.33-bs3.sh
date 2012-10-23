#!/bin/sh
# $Id: k-2.4.33-bs3.sh,v 1.1 2007-02-14 08:50:21 doros Exp $

set -e

# use uClibc
#export PATH=/mnt/tmp/src/bering-uclibc/buildtool/staging/usr/bin:$PATH

BASE=`pwd`/..
PATCHES=$BASE/bering-uclibc-patches/2.4.33
WKS_SPACE=/tmp/k

rm -rf $WKS_SPACE
mkdir $WKS_SPACE
cd $WKS_SPACE

tar jxf $BASE/kernels/linux-2.4.33.tar.bz2
tar zxf $BASE/openswan/openswan-2.4.7.tar.gz
tar zxf $BASE/iscsi/iscsitarget-0.3.8.tar.gz

ln -s linux-2.4.33 linux
cd linux
gunzip $PATCHES/helpers-2.4.29.patch.gz -c | patch -p1
gunzip $PATCHES/ebtables-brnf-11-2_vs_2.4.31.diff.gz -c |  patch -p1
gunzip $PATCHES/linux-2.4.25-mppe-20040216.patch.gz -c |  patch -p1
#zcat $PATCHES/grsecurity-2.1.9-2.4.33-200608131429.patch.gz |  patch -p1
gunzip $PATCHES/wd1100.patch.gz -c |  patch -p1
gunzip $PATCHES/netconfig.diff.gz -c |  patch -p1
gunzip $PATCHES/kbc_runtime_detect_2_4.diff.gz -c |  patch -p1
gunzip $PATCHES/connmark.patch.gz -c |  patch -p1
gunzip $PATCHES/iw249_we17-13.diff.gz -c |  patch -p1
gunzip $PATCHES/iw240_we18-5.diff.gz -c |  patch -p1
gunzip $PATCHES/openswan-2.4.7.kernel-2.4-klips.patch.gz -c |  patch -p1
gunzip $PATCHES/openswan-2.4.7.kernel-2.4-natt.patch.gz -c |  patch -p1

cat $PATCHES/linux-classify.patch |  patch -p1
cat $PATCHES/linux-tarpit.patch |  patch -p1
cat $PATCHES/linux-condition.patch |  patch -p1
gunzip $PATCHES/pppol2tp-linux-2.4.27.patch.gz -c |  patch -p1
cat $PATCHES/vlan-natsemi.patch |  patch -p1
cat $PATCHES/vlan-tulip.patch |  patch -p1
cat $PATCHES/openswan-fixes.patch |  patch -p1




bunzip2 $BASE/uml-patches/uml-2.4.33-bs3.patch.bz2 -c | patch -p1
bunzip2 $BASE/uml-patches/serial.patch.bz2 -c | patch -p0
bunzip2 $BASE/uml-patches/uml-port-helper-location.patch.bz2 -c | patch -p1


bunzip2 $BASE/kernels/command_line_size.patch.bz2 -c | patch -p1
cp $BASE/config/.config-2.4.33-bs3 .config
make oldconfig ARCH=um
make dep ARCH=um
make linux ARCH=um
strip linux
cp linux $BASE/linux/linux-2.4.33-bs3



cd ..


pushd $WKS_SPACE/iscsitarget-0.3.8
cat $BASE/iscsi/iscsitarget-mem.patch | patch -p1
make -C $WKS_SPACE/iscsitarget-0.3.8 mods \
     KERNELSRC=$WKS_SPACE/linux ARCH=um
popd

