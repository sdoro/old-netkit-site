# buildtool make file for buildenv
# Id: buildtool.mk,v 1.17 2005/11/23 19:21:55 espakman Exp $
# 
# Note that this is some kind of a hack as you normally should do things 
# not the way they are handled here 

include $(MASTERMAKEFILE)

$(BT_LINUX_DIR)/.source:
	bzcat $(KERNEL_SOURCE) | tar -xvf -
	ln -s linux-2.4.32 linux	
	zcat $(KERNEL_PATCH1) | patch -d linux -p1
	zcat $(KERNEL_PATCH2) | patch -d linux -p1
	zcat $(KERNEL_PATCH3) | patch -d linux -p1
	zcat $(KERNEL_PATCH4) | patch -d linux -p1 
	zcat $(KERNEL_PATCH5) | patch -d linux -p1				
	zcat $(KERNEL_PATCH6) | patch -d linux -p1						
	zcat $(KERNEL_PATCH7) | patch -d linux -p1
	zcat $(KERNEL_PATCH8) | patch -d linux -p1
	zcat $(KERNEL_PATCH9) | patch -d linux -p1
	zcat $(KERNEL_PATCH10) | patch -d linux -p1
	zcat $(KERNEL_PATCH11) | patch -d linux -p1
	zcat $(KERNEL_PATCH12) | patch -d linux -p1
	cp $(LINUX_CONFIG) linux/.config 
	touch $(BT_LINUX_DIR)/.source


$(BT_LINUX_DIR)/.configured: $(BT_LINUX_DIR)/.source
	perl -i -p -e 's,EXTRAVERSION\s*=.*,EXTRAVERSION =,g' $(BT_LINUX_DIR)/Makefile
	$(MAKE) -C linux oldconfig
	$(MAKE) -C linux include/linux/version.h
	touch $(BT_LINUX_DIR)/.configured	

source: $(BT_LINUX_DIR)/.source $(BT_LINUX_DIR)/.configured

build: 	$(BT_LINUX_DIR)/.configured
	echo "nothing done here right now, all done by buildenv and kernel package"

clean:
	-rm $(BT_LINUX_DIR)/.configured
	$(MAKE) -C linux clean

srcclean: 	
	rm -rf linux
	rm -rf linux-2.4.32
	rm -rf $(OPENSWAN_DIR)
