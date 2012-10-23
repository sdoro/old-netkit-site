#!/bin/sh
# $Id: kdc.sh,v 1.1 2005/08/20 17:22:20 doros Exp $

# init "entropy generator"
(find / -mount | grep -i a | wc -l) &
(find / -mount | grep -i a | wc -l) &
(find / -mount | grep -i a | wc -l) &

(sleep 2; echo "not24get"; sleep 2; echo "not24get" ) | kdb5_util create -s

# destroy "entropy destructor"
pidof find | xargs kill

#
kadmin.local -q "ktadd -k /etc/krb5kdc/kadm5.keytab kadmin/admin"
kadmin.local -q "ktadd -k /etc/krb5kdc/kadm5.keytab kadmin/changepw"
#
kadmin.local -q "addprinc -pw secret krbadm@ISTITUTO.IT"
#
/etc/init.d/krb5-kdc start
#
# bot
