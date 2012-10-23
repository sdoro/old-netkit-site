#!/bin/bash
# $Id: bat5-usb.sh,v 1.1 2007-02-10 16:38:22 doros Exp $

set -e

if [ "none$ENV $KNO" != "none" ]; then
  bzip2 usb1GiB.img
  md5sum usb1GiB.img.bz2 > usb1GiB.img.bz2.md5
fi

# bot
