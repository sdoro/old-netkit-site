#!/bin/sh
# low priority ports
# list them separated by spaces i.e.
# LOWPORTS=(20 21 25)
# These are the lowest of the low. Traffic not classified
# by any filters does not go into low, but rather between
# low and mid, so if you put it in low, it is really low
# keep in mind that this doesn't kill the bandwidth on these
# classes, but just makes sure they don't hurt anything else
# It's recommended that you think about what kinds of bulk
# traffic have the potential to hurt your usage, and list them here
# such as FTP and email (SMTP)
LOWPORTS="20 21 25"


## Don't change this
echo $LOWPORTS

