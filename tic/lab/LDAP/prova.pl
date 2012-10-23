#!/usr/bin/perl

use Net::LDAP;

$ldap = Net::LDAP->new ( "ldap.istituto.it" ) or die "$@";
$mesg = $ldap->bind("cn=admin,ou=DSA,dc=istituto,dc=it", password=>"Wserver");


$mesg = $ldap->search(  filter=>"(uid=nane)", 
                        base=>"ou=People,dc=istituto,dc=it",
                        attrs=> ['uid', 'sn', 'cn', 'loginShell']);
@entries = $mesg->entries;
foreach $entry (@entries) {
        $entry->dump;
}

$dn = "uid=nane,ou=People,dc=istituto,dc=it";
$mesg = $ldap->modify($dn, replace => { "loginShell" => "/bin/false" } );
$mesg = $ldap->search(  filter=>"(uid=nane)", 
                        base=>"ou=People,dc=istituto,dc=it",
                        attrs=> ['uid', 'sn', 'cn', 'loginShell']);
@entries = $mesg->entries;
foreach $entry (@entries) {
        $entry->dump;
}


$ldap->unbind;

