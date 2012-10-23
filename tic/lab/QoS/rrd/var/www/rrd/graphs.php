<?php

## graphs.php
## $Id: graphs.php,v 1.1 2004/11/11 22:31:05 doros Exp $
## A set of php functions to create rrd graphs

function interface ($start) {
  $dataset = "/var/lib/rrdcollect/leaf/eth0.rrd";
  $imgfile = "eth0$start.png";

  $opts = array( "--start", "$start",
    "--vertical-label", "Bytes/sec",
    "--width", "400",
    "--height", "100",
    "DEF:in=$dataset:bytes_in:AVERAGE",
    "DEF:out=$dataset:bytes_out:AVERAGE",
    "LINE2:in#00ff00:In",
    "LINE2:out#ff0000:Out");

  make_graph ($imgfile, $opts);


  $dataset = "/var/lib/rrdcollect/leaf/eth1.rrd";
  $imgfile = "eth1$start.png";

  $opts = array( "--start", "$start",
    "--vertical-label", "Bytes/sec",
    "--width", "400",
    "--height", "100",
    "DEF:in=$dataset:bytes_in:AVERAGE",
    "DEF:out=$dataset:bytes_out:AVERAGE",
    "LINE2:in#00ff00:In",
    "LINE2:out#ff0000:Out");

  make_graph ($imgfile, $opts);


  $dataset = "/var/lib/rrdcollect/leaf/eth2.rrd";
  $imgfile = "eth2$start.png";

  $opts = array( "--start", "$start",
    "--vertical-label", "Bytes/sec",
    "--width", "400",
    "--height", "100",
    "DEF:in=$dataset:bytes_in:AVERAGE",
    "DEF:out=$dataset:bytes_out:AVERAGE",
    "LINE2:in#00ff00:In",
    "LINE2:out#ff0000:Out");

  make_graph ($imgfile, $opts);
}

function make_graph ($file, $options) {
  $ret = rrd_graph("/var/www/rrd/$file", $options, count($options));
  ## if $ret is an array, then rrd_graph was succesful
  ##
  if ( is_array($ret) ) {
    #echo "<img src=\"/images/rrdimg/$file\" border=0>";
    echo "<img src=\"$file\" border=0>";
  }
  else {
    $err = rrd_error();
    echo "<p><b>$err</b></p>";
  }
}

function allClass ($start) {
  $dataset1 = "/var/lib/rrdcollect/leaf/eth0-10.rrd";
  $dataset2 = "/var/lib/rrdcollect/leaf/eth0-20.rrd";
  $dataset3 = "/var/lib/rrdcollect/leaf/eth0-30.rrd";
  $dataset4 = "/var/lib/rrdcollect/leaf/eth0-40.rrd";
  $imgfile = "eth0-ac$start.png";

  $opts = array( "--start", "$start",
    "--vertical-label", "Bytes/sec",
    "--width", "400",
    "--height", "100",
    "DEF:a=$dataset1:bytes:AVERAGE",
    "DEF:b=$dataset2:bytes:AVERAGE",
    "DEF:c=$dataset3:bytes:AVERAGE",
    "DEF:d=$dataset4:bytes:AVERAGE",
    "AREA:a#00ff00:1\:10 (2 Kbps)",
    "STACK:b#ff0000:1\:20 (14 Kbps)",
    "STACK:c#0000FF:1\:30 (9 Kbps)",
    "STACK:d#f000F0:1\:40 (5 Kbps)");

  make_graph ($imgfile, $opts);

}

?>
