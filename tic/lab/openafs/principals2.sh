#!/bin/sh
# $Id: principals2.sh,v 1.1 2005/09/01 20:04:18 doros Exp $

kadmin.local -q "addprinc -pw secret host/client.istituto.it@ISTITUTO.IT" -w secret
kadmin.local -q "ktadd -k /etc/krb5-client.keytab host/client.istituto.it@ISTITUTO.IT" -w secret

#
# bot
