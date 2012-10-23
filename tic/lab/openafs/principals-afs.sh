#!/bin/sh
# $Id: principals-afs.sh,v 1.2 2005/09/06 15:37:19 doros Exp $

kadmin.local -q "addprinc -pw secret afsadm@ISTITUTO.IT"

kadmin.local -q "addprinc -randkey afs/istituto.it@ISTITUTO.IT"
kadmin.local -q "ktadd -e des-cbc-crc:afs3 -k /etc/krb5.keytab.afs afs/istituto.it@ISTITUTO.IT"

#
# bot
