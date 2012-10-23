

export QEMU_SW="-usb -usbdevice tablet -kernel-kqemu"; \
export QEMU_NET="-net nic -net tap,ifname=tap1"; \
qemu -m 140 -cdrom eb-5.4.3-ns8390.iso $QEMU_SW $QEMU_NET
#qemu -m 256 -cdrom eb-5.4.3-ns8390.iso -boot d $QEMU_SW $QEMU_NET
