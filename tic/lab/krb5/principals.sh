#!/bin/sh
# $Id: principals.sh,v 1.1 2005/08/20 17:22:41 doros Exp $

kadmin.local -q "addprinc -pw bianchi mrossi@ISTITUTO.IT" -w secret
kadmin.local -q "addprinc -pw secret host/srv.istituto.it@ISTITUTO.IT" -w secret
kadmin.local -q "ktadd -k /etc/krb5-srv.keytab host/srv.istituto.it@ISTITUTO.IT" -w secret


kadmin.local -q "addprinc -pw secret ftp/srv.istituto.it@ISTITUTO.IT" -w secret
kadmin.local -q "ktadd -k /etc/krb5-srv.keytab ftp/srv.istituto.it@ISTITUTO.IT" -w secret


kadmin.local -q "addprinc -pw secret knoppix@ISTITUTO.IT" -w secret
kadmin.local -q "addprinc -pw secret HTTP/srv.istituto.it@ISTITUTO.IT" -w secret
kadmin.local -q "ktadd -k /etc/krb5-srv.keytab HTTP/srv.istituto.it@ISTITUTO.IT" -w secret


kadmin.local -q "addprinc -pw secret ldapadm@ISTITUTO.IT" -w secret
kadmin.local -q "addprinc -pw secret ldap/ns.istituto.it@ISTITUTO.IT" -w secret
kadmin.local -q "ktadd -k /etc/krb5.keytab ldap/ns.istituto.it@ISTITUTO.IT" -w secret

#
# bot
