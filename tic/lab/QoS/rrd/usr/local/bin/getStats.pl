#!/usr/bin/perl
# $Id: getStats.pl,v 1.2 2004/11/11 23:03:03 doros Exp $

use RRDs;

$numArgs = @ARGV;
if ($numArgs < 1) {
  print ("usage: getStats device\n");
  exit();
}

$device = $ARGV[0];

open (PS_F, "ssh 192.168.1.254 tc -s class show dev $device|");
while ($line=<PS_F>) {
  ($class, $htb, $classid, $parent, $v1, $v2, $v3, $v4, $v5, $v6, $v7, $v8, $v9) = split (" ",$line);
  #print "\nclassid= $classid";
  #print "\nparent= $parent";
  if (not $parent eq "root") {
    ($classpadre, $prio, $prioval, $rate) = split ($resto);
    #print "\n classpadre= $v1";
    #print ", rate= $v7";
    #print ", ceil= $v9";
  }
  #else {
  #  print "\n rate= $v2";
  #  print ", ceil= $v4";
  #}
  $line=<PS_F>;
  ($v1,$bytes,$v2,$pkts,$v3,$dropped,$v4,$overlimits) = split (" ",$line);
  #print "\nbytes: $bytes, pkts: $pkts";
  $line=<PS_F>;
  ($v1,$lended,$v2,$borrowed,$v3,$giants) = split (" ",$line);
  if ($v1 eq "rate") {
    #print "rate------------------------------------------------------\n";
    $line=<PS_F>;
    ($v1,$lended,$v2,$borrowed,$v3,$giants) = split (" ",$line);
  }
  $line=<PS_F>;
  ($v1,$tokens,$v2,$ctokens) = split (" ",$line);
  $line=<PS_F>;
  #print "\n";
  if (not $parent eq "root") {
     if ($classid eq "1:10") {
        #print "----------------- 1:10 ------------------------\n";
        $database = "/var/lib/rrdcollect/leaf/eth0-10.rrd";
        RRDs::update ($database, "N:".$bytes);
        my $Err = RRDs::error;
        die "Error while updating: $Err\n" if $Err;
     }
     if ($classid eq "1:20") {
        #print "----------------- 1:20 ------------------------\n";
        $database = "/var/lib/rrdcollect/leaf/eth0-20.rrd";
        RRDs::update ($database, "N:".$bytes);
        my $Err = RRDs::error;
        die "Error while updating: $Err\n" if $Err;
     }
     if ($classid eq "1:30") {
        #print "----------------- 1:30 ------------------------\n";
        $database = "/var/lib/rrdcollect/leaf/eth0-30.rrd";
        RRDs::update ($database, "N:".$bytes);
        my $Err = RRDs::error;
        die "Error while updating: $Err\n" if $Err;
     }
     if ($classid eq "1:40") {
        #print "----------------- 1:40 ------------------------\n";
        $database = "/var/lib/rrdcollect/leaf/eth0-40.rrd";
        RRDs::update ($database, "N:".$bytes);
        my $Err = RRDs::error;
        die "Error while updating: $Err\n" if $Err;
     }
  }
}
close (PS_F);
