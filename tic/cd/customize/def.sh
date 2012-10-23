#!/bin/bash
# $Id: $

FS_INPUT=netkit-fs-i386-F5.2
FS_OUTPUT=netkit-fs-i386-F5.2-1GiB

mkdir -p /tmp/netkit-i
mkdir -p /tmp/netkit-o
mount -o loop,offset=32768 $FS_OUTPUT /tmp/netkit-o
mount -r -o loop,offset=32768 $FS_INPUT /tmp/netkit-i
pushd /tmp/netkit-i; \
  tar -cpf - . --exclude=lost+found --exclude=.journal | \
  (cd /tmp/netkit-o; tar -xpf -)
popd
umount /tmp/netkit-o
umount /tmp/netkit-i
rm -f /tmp/netkit-o
rm -f /tmp/netkit-i

