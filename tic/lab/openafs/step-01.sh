#!/bin/sh
# $Id: step-01.sh,v 1.2 2005/09/06 15:37:35 doros Exp $

bosserver -noauth
sleep 5
#bos setcellname -server alfa.istituto.it \
#  -cell istituto.it -name istituto.it -noauth
bos listhosts alfa.istituto.it -localauth
bos create -server alfa.istituto.it -instance ptserver -type simple \
   -cmd /usr/lib/openafs/ptserver -cell istituto.it -localauth
bos adduser alfa.istituto.it afsadm -cell istituto.it -localauth
sleep 5
bos listkeys alfa.istituto.it -cell istituto.it -localauth
sleep 5
pts createuser -name afsadm -cell istituto.it  -id 2001 -noauth
sleep 5
pts adduser afsadm system:administrators -cell istituto.it -noauth
sleep 5
pts membership afsadm -cell istituto.it -noauth
sleep 5
bos restart alfa.istituto.it -all -cell istituto.it -localauth
sleep 5
bos create -server alfa.istituto.it -instance vlserver -type simple \
   -cmd /usr/lib/openafs/vlserver -cell istituto.it -localauth
bos create -server alfa.istituto.it -instance buserver -type simple \
   -cmd /usr/lib/openafs/buserver -cell istituto.it -localauth
bos create -server alfa.istituto.it -instance fs -type fs \
   -cmd /usr/lib/openafs/fileserver \
   -cmd /usr/lib/openafs/volserver \
   -cmd /usr/lib/openafs/salvager -cell istituto.it -localauth
bos status alfa.istituto.it fs -long -localauth
sleep 5
vos create alfa.istituto.it /vicepa root.afs -localauth
sleep 5
bos shutdown alfa.istituto.it -wait -localauth
sleep 5
pkill bosserver
sleep 2
/etc/init.d/openafs-fileserver start
sleep 30
/etc/init.d/openafs-client start

#
# bot
