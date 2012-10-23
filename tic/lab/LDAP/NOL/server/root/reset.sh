# reload LDAP
/etc/init.d/slapd stop
rm -f /var/lib/ldap/*
ln -f -s /etc/ldap/boot-slapd.conf /etc/ldap/slapd.conf
/etc/init.d/slapd start 
sleep 2
#
ldapadd -x -H ldap://127.0.0.1 -D"cn=admin,dc=istituto,dc=it" -w not24get -f /root/ldif/boot-base.ldif
#
/etc/init.d/slapd stop
ln -s -f /etc/ldap/slapd.conf-master /etc/ldap/slapd.conf
#
su openldap slapindex
/etc/init.d/slapd start
sleep 2
# populate from ldif
ldapadd -x -H ldap://127.0.0.1 -D"cn=admin,ou=DSA,dc=istituto,dc=it" -w Wserver -f /root/ldif/base.ldif
ldapadd -x -H ldap://127.0.0.1 -D"cn=admin,ou=DSA,dc=istituto,dc=it" -w Wserver -f /root/ldif/group.ldif
ldapadd -x -H ldap://127.0.0.1 -D"cn=admin,ou=DSA,dc=istituto,dc=it" -w Wserver -f /root/ldif/hosts.ldif
ldapadd -x -H ldap://127.0.0.1 -D"cn=admin,ou=DSA,dc=istituto,dc=it" -w Wserver -f /root/ldif/passwd.ldif
#ldapadd -x -H ldap://127.0.0.1 -D"cn=admin,ou=DSA,dc=istituto,dc=it" -w Wserver -f /root/ldif/autofs.ldif
#
# bot
