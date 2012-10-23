#!/bin/sh
# $Id: step-02.sh,v 1.2 2005/09/06 15:37:50 doros Exp $

#kinit afsadm && klist
(sleep 2; echo "secret" ) | kinit afsadm
#aklog && tokens
aklog
fs checkvolumes
vos create alfa.istituto.it /vicepa root.cell
fs mkmount /afs/istituto.it root.cell
fs setacl /afs system:anyuser read
fs setacl /afs/istituto.it system:anyuser read

vos addsite alfa.istituto.it a root.afs
vos addsite alfa.istituto.it a root.cell
fs mkmount /afs/.istituto.it root.cell -rw
vos release root.afs
vos release root.cell

#
# bot
