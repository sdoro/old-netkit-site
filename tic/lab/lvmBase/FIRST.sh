#~/bin/sh
# $Id: FIRST.sh,v 1.1 2008-10-04 20:47:17 doros Exp $

echo "Making backing store ..."
rm -f /tmp/sda
dd if=/dev/zero of=/tmp/sda bs=1M seek=50 count=1 2>/dev/null
echo "Done."

# bot
