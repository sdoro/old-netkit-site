#!/usr/bin/perl
# $Id: interface.pl,v 1.1 2004/11/11 22:57:47 doros Exp $

use Net::SNMP;
use RRDs;

$oid_ifNumber    = ".1.3.6.1.2.1.2.1";
$oid_ifDescr     = ".1.3.6.1.2.1.2.2.1.2";
$oid_ifInOctets  = ".1.3.6.1.2.1.2.2.1.10";
$oid_ifOutOctets = ".1.3.6.1.2.1.2.2.1.16";

$database = "/var/lib/rrdcollect/leaf/eth0.rrd";

my ($session, $error) = Net::SNMP->session(
   -hostname  => '192.168.1.254',
   -community => 'public',
   -port      => 161 
   );
   if (!defined($session)) {
      printf("ERROR: %s.\n", $error);
      exit 1;
   }


my $result = $session->get_request(
   -varbindlist => [$oid_ifNumber . ".0"]);
$numInts = $result->{$oid_ifNumber . ".0"};


for $i (1..$numInts) {
  my $result = $session->get_request(
   -varbindlist => [$oid_ifDescr . "." . $i]);
  $name = $result->{$oid_ifDescr . "." . $i};
  #printf("descr: %s.\n", $name);
  if ( $name eq "eth0") {
    $database = "/var/lib/rrdcollect/leaf/eth0.rrd";
    my $result = $session->get_request(
      -varbindlist => [$oid_ifInOctets . "." . $i]);
    $in = $result->{$oid_ifInOctets . "." . $i};
    my $result = $session->get_request(
      -varbindlist => [$oid_ifOutOctets . "." . $i]);
    $out = $result->{$oid_ifOutOctets . "." . $i};

    RRDs::update ($database, "N:".$in.":".$out);
    my $Err = RRDs::error;
    die "Error while updating: $Err\n" if $Err;

  }
  if ( $name eq "eth1") {
    $database = "/var/lib/rrdcollect/leaf/eth1.rrd";
    my $result = $session->get_request(
      -varbindlist => [$oid_ifInOctets . "." . $i]);
    $in = $result->{$oid_ifInOctets . "." . $i};
    my $result = $session->get_request(
      -varbindlist => [$oid_ifOutOctets . "." . $i]);
    $out = $result->{$oid_ifOutOctets . "." . $i};

    RRDs::update ($database, "N:".$in.":".$out);
    my $Err = RRDs::error;
    die "Error while updating: $Err\n" if $Err;

  }
  if ( $name eq "eth2") {
    $database = "/var/lib/rrdcollect/leaf/eth2.rrd";
    my $result = $session->get_request(
      -varbindlist => [$oid_ifInOctets . "." . $i]);
    $in = $result->{$oid_ifInOctets . "." . $i};
    my $result = $session->get_request(
      -varbindlist => [$oid_ifOutOctets . "." . $i]);
    $out = $result->{$oid_ifOutOctets . "." . $i};

    RRDs::update ($database, "N:".$in.":".$out);
    my $Err = RRDs::error;
    die "Error while updating: $Err\n" if $Err;

  }
}

$session->close;
exit 0;
