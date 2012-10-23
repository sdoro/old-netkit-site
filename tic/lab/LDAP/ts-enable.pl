#!/usr/bin/perl
# $Id: $

use Net::LDAP;

$ldap = Net::LDAP->new ( "ldap.zuccante.it" ) or die "$@";
$mesg = $ldap->bind("cn=admin,ou=DSA,dc=zuccante,dc=fdns,dc=net", password=>"xx");

while(<>) {
  chomp $_;
  ($uid) = split(/,/,$_);
  $dn = "uid=$uid,ou=People,dc=zuccante,dc=fdns,dc=net";
  $mesg = $ldap->modify($dn, replace => { "loginShell" => "/bin/bash" } );
  print $dn."\n";
}


ldap->unbind;

