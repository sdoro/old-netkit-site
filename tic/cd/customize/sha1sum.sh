#!/bin/bash
# $Id: md5sum.sh,v 1.1 2004/12/27 16:07:54 doros Exp $

set -e

(cd $KNO/master/;
find -type f \
 -not -name sha1sums -not -name boot.cat -not -name isolinux.bin \
 -exec sha1sum {} \; > $KNO/master/KNOPPIX/sha1sums)

# bot
