#!/bin/sh
# $Id: principals.sh,v 1.1 2005/09/01 20:04:00 doros Exp $

kadmin.local -q "addprinc -pw bianchi mrossi@ISTITUTO.IT" -w secret

kadmin.local -q "addprinc -pw secret knoppix@ISTITUTO.IT" -w secret

kadmin.local -q "addprinc -pw secret ldapadm@ISTITUTO.IT" -w secret
kadmin.local -q "addprinc -pw secret ldap/ns.istituto.it@ISTITUTO.IT" -w secret
kadmin.local -q "ktadd -k /etc/krb5.keytab ldap/ns.istituto.it@ISTITUTO.IT" -w secret

kadmin.local -q "addprinc -pw secret host/alfa.istituto.it@ISTITUTO.IT" -w secret
kadmin.local -q "ktadd -k /etc/krb5-alfa.keytab host/alfa.istituto.it@ISTITUTO.IT" -w secret

#
# bot
