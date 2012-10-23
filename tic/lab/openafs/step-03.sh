#!/bin/sh
# $Id: step-03.sh,v 1.2 2005/09/06 15:38:04 doros Exp $

pts creategroup -name users

vos create alfa.istituto.it /vicepa home
fs mkmount /afs/.istituto.it/home home
fs setacl /afs/.istituto.it/home system:anyuser read
vos addsite alfa.istituto.it /vicepa home
vos release home
vos release root.cell
fs checkvolumes

pts createuser mrossi
pts adduser -user mrossi -group users
#pts members users
#pts membership mrossi
#pts membership mrossi users
#pts examine users mrossi
vos create alfa.istituto.it /vicepa home.mrossi
fs mkmount /afs/.istituto.it/home/mrossi home.mrossi
vos release home
fs checkvolumes
fs setacl /afs/istituto.it/home/mrossi mrossi all system:anyuser l -clear
#fs listacl /afs/istituto.it/home/mrossi
fs setquota /afs/istituto.it/home/mrossi -max 2000
#fs examine /afs/istituto.it/home/mrossi

#
# bot
