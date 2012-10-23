#!/bin/sh
# $Id: $

ladd="ldapadd -D cn=admin,dc=dip,dc=dominio,dc=it -y /etc/ldap/ldap.secret -x"
ladd="xargs echo "
login=uid
hserver=nfs
dir=/net/staff (o stud o sysadmin)

# AutoFS
cat <<EOF | $ladd
dn: cn=$login,ou=auto.indirect,dc=istituto,dc=it
objectClass: automount
cn: $login
automountInformation: $hserver:$dir
EOF
