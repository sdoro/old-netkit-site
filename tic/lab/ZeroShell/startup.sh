#!/bin/sh
#
# setup network
tunctl -u `who i am`
echo "1" > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
# startup qemu
QEMU_SW="-usb -usbdevice tablet -kernel-kqemu"; \
QEMU_NET="-net nic -net tap,ifname=tap0"; \
qemu -cdrom /tmp/z/ZeroShell-1.0.beta7.iso $QEMU_SW $QEMU_NET
