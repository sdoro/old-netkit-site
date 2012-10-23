#!/bin/bash
# high priority IPs
# classification happens by IP before port
# thus, say you have a web server and you
# want to put it in bulk traffic, but keep
# regular web browsing at mid level. Then
# list the more general port 80 in midPorts.conf
# and list the IP of your webserver in lowIPs.conf
# list them separated by colons i.e.
# TOPPORTS=192.168.1.12:192.168.1.44
# you can also list public IPs here (say, to always
# give high priority to users connecting to an external
# citrix server
TOPIPS="192.168.46.70"


echo $TOPIPS


