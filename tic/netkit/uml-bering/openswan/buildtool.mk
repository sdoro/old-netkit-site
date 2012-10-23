#############################################################
#
# openswan
#
#############################################################
 
include $(MASTERMAKEFILE)

OPENSWAN_DIR:=openswan-2.4.4
OPENSWAN_TARGET_DIR:=$(BT_BUILD_DIR)/openswan

export USE_AGGRESSIVE=true
export USE_XAUTH=true
export USE_BASH=false
export USE_EXTRACRYPTO=false


$(OPENSWAN_DIR)/.source:
	zcat $(OPENSWAN_SOURCE) | tar -xvf -
	zcat $(OPENSWAN_PATCH1) | patch -d $(OPENSWAN_DIR) -p1
	zcat $(OPENSWAN_PATCH2) | patch -d $(OPENSWAN_DIR) -p1

	perl -i -p -e 's,-lgmp,$(BT_STAGING_DIR)/usr/lib/libgmp.a,g' $(OPENSWAN_DIR)/programs/pluto/Makefile
	perl -i -p -e 's,-lgmp,$(BT_STAGING_DIR)/usr/lib/libgmp.a,g' $(OPENSWAN_DIR)/programs/rsasigkey/Makefile
	
	touch $(OPENSWAN_DIR)/.source

source: $(OPENSWAN_DIR)/.source
	
$(OPENSWAN_DIR)/.build: $(OPENSWAN_DIR)/.source
	mkdir -p $(OPENSWAN_TARGET_DIR)
	mkdir -p $(OPENSWAN_TARGET_DIR)/etc/init.d
	mkdir -p $(BT_STAGING_DIR)/usr/lib
	mkdir -p $(BT_STAGING_DIR)/etc/init.d
	mkdir -p $(BT_STAGING_DIR)/usr/sbin	
	make CC=$(TARGET_CC) -C $(OPENSWAN_DIR) programs \
	    USERCOMPILE="-g $(BT_COPT_FLAGS)"
	    INC_USRLOCAL="/usr" \
	    FINALBINDIR="/usr/lib/ipsec" \
	    FINALLIBEXECDIR="/usr/lib/ipsec" \
	    KERNELSRC=$(BT_LINUX_DIR)
	make CC=$(TARGET_CC) -C $(OPENSWAN_DIR) install \
	    INC_USRLOCAL="/usr" \
	    FINALBINDIR="/usr/lib/ipsec" \
	    FINALLIBEXECDIR="/usr/lib/ipsec" \
	    DESTDIR=$(OPENSWAN_TARGET_DIR)

	-$(BT_STRIP) $(BT_STRIP_BINOPTS) $(OPENSWAN_TARGET_DIR)/usr/lib/ipsec/*
	cp -f ipsec $(OPENSWAN_TARGET_DIR)/etc/init.d/
	cp -f ipsec.secrets $(OPENSWAN_TARGET_DIR)/etc/	
	cp -a $(OPENSWAN_TARGET_DIR)/usr/lib/* $(BT_STAGING_DIR)/usr/lib/
	cp -a $(OPENSWAN_TARGET_DIR)/etc/* $(BT_STAGING_DIR)/etc/
	cp -a $(OPENSWAN_TARGET_DIR)/usr/sbin/* $(BT_STAGING_DIR)/usr/sbin/

	touch $(OPENSWAN_DIR)/.build
	
build: $(OPENSWAN_DIR)/.build	

clean:
	-rm $(OPENSWAN_DIR)/.build
	make -C $(OPENSWAN_DIR) clean
	rm -rf $(OPENSWAN_TARGET_DIR)

srcclean:
	rm -rf $(OPENSWAN_DIR)
	rm -rf $(OPENSWAN_TARGET_DIR)

