#!/bin/sh
# $Id: date.sh,v 1.1 2004/02/09 21:51:42 doros Exp $

#
# CGI script that prints the date and time at which it was run
#

# Output the document header followed by a blank line

echo Content-type: text/plain
echo

# Output the date

echo This document was created on `date`.

#
# bot
