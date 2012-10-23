#!/bin/sh
# $Id: mk-tgz.sh,v 1.8 2010-05-25 04:09:06 doros Exp $
#
# Build tgz files
#

if [ ! `id -u` = 0 ] ; then
  echo $0: Only root can do that.
  exit 1
fi


SRC=/var/www/tic/lab
DST=/var/www/tic/html
EXCLUDE='--exclude=CVS --exclude=.cvsignore --exclude=.htaccess'

cd $SRC
for i in *
  do
  tar czf $DST/$i.tgz $i $EXCLUDE 0 >null 2>&1
  echo $i.tgz
done

exit 0

# bot
