obj-m   := chardev.o

KDIR  := /lib/modules/$(shell uname -r)/build
PWD   := $(shell pwd)

default:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

chardev-objs :=  main.o low.o sock.o

clean:
	rm -rf *.ko *.o *.mod.c *.cmd *~ .tmp_versions;
	rm -rf Module.symvers Modules.symvers modules.order;
	find . -type f -name ".*" |xargs rm -rf
