#!/bin/sh
# $Id: added-packages.sh,v 1.9 2007-02-10 16:37:20 doros Exp $

# from Zuccante lab
apt-get install ddd
# from PAM
apt-get install opie-client
# from LTSP
apt-get install dhcp3-relay
# Kerberos experience
#apt-get install krb5-config libkrb53 krb5-user libkadm55 libsasl2-gssapi-mit
apt-get install libkadm55 libsasl2-modules-gssapi-mit \
                krb5-config krb5-user libsasl2-gssapi-mit
# 
apt-get install devilspie
#
apt-get install xmove
