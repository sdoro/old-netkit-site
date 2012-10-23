# /usr/local/SHADOW/sites/SiteX.ph
# $Id: sensor01.ph,v 1.1 2003-10-01 21:12:24 doros Exp $

#                      Last changed 27 Nov 2002
#
# The '$SITE" name is a name used to identify a sensor subdirectory. This name
# will be used to create subdirectories under the analyzer raw data and web
# pages directories as specified by the parameters $SHADOW_RAW_DATA_PATH and 
# $SHADOW_WEB_DATA_PATH in /etc/shadow.conf. The $SITE_LABEL is the label that
# will be placed on the scrolling lists in the tools.cgi web page and the
# search.cgi tool.
#
$SITE="sensor01";
$SITE_LABEL = "Outside Network Perimeter";
#
#
# Put here the name of the machine on which the SHADOW sensor software is
# located. The analyzer fetches the raw data from the sensor.
#
$SENSOR="sensor01.tic.fdns.net";
#
# Put here the name of the machine which runs Apache to serve up your SHADOW
# generated web pages.
#
$WEB_SERVER="mngm.tic.fdns.net";
#
# Change the following line to reflect the directory on your sensor in which
# the raw sensor data is stored.
#
$SENSOR_DIR="/LOG";
#
# The following line reflects the directory on your analyzer machine
# into which the raw sensor data is fetched. The variable $SHADOW_RAW_DATA_PATH
# is defined in /etc/shadow.conf.
#
$ANALYZER_DIR="$SHADOW_RAW_DATA_PATH/$SITE";
#
# The following line reflects the directory on your analyzer machine where
# SHADOW will create the web pages which hold the filtered data. The variable
# $SHADOW_WEB_PAGES_PATH is defined in /etc/shadow.conf.
# 
$OUTPUT_WEB_DIR="$SHADOW_WEB_PAGES_PATH/$SITE";
#
# The following variable reflects the relative path from the DocumentRoot 
# variable defined in the Apache configuration files to the actual html files.
# The variable $SHADOW_REL_WEB_PAGES_ROOT is defined in 
# /etc/shadow.conf.
#
$URL_OUTPUT_DIR="$SHADOW_REL_WEB_PAGES_ROOT/$SITE";
#
# The following line reflects where the filters for the site $SITE are 
# stored. The variable $SHADOW_FILTER_PATH is defined in /etc/shadow.conf.
#
$FILTER_DIR="$SHADOW_FILTER_PATH/$SITE";
#
# The SCAN_THRESHOLD is the number of different IPs that a "foreign" machine
# can contact before SHADOW lists that foreign machine as a possible scanner.
# Change it to reflect your preference.
#
$SCAN_THRESHHOLD = "100";
#
# Set the following variable to the number of days you want to keep the
# raw data files on your sensor's disks before the cleanup.pl script removes
# them. It depends on the sizes of your files, the amount of sensor disk space,
# and your taste.
#
$CLEAN_TIME = 2;
#
###############################################################################
#                 
# For the obfuscate.pl script and the statistics scripts, define an array of
# local addresses with the CIDR notation, e.g.
#
# 172.16.0.0/16 where 16 is the number of network mask bits.
#
# Note: if this section of code is placed in a "site.ph" file, it will 
# override the definitions in the /etc/shadow.conf file. In that way,
# what is "local" and "external" can be dependent on the data viewport, 
# i.e. the sensor, the filter set, and the local definition.
#
# For obfuscate.pl, only the definitions of @LOCAL_IP, @OBF_IP, and 
# @LOCAL_DOMAIN contained in /etc/shadow.conf will be used, since 
# obfuscate.pl is not "site" dependent.
#
if (defined @LOCAL_IP) {
   @LOCAL_IP = ();
   undef @LOCAL_IP;
}
our @LOCAL_IP = (
                 "172.16.0.0/16", "172.31.66.0/24"
                );
#
# For the obfuscate.pl script define an array of addresses into which to
# obfuscate each of the local addreses defined above. There must be one 
# obfuscation address for each local address.
#
if (defined @OBF_IP) {
   @OBF_IP = ();
   undef @OBF_IP;
}
our @OBF_IP = (
               "192.168.0.0", "192.168.245.0"

              );
#
# Part of the obfuscation process is to take real domain addresses and
# email addresses that may be part of the data and obfuscate them as
# well as the IP addresses. Define those domain names that you want 
# obfuscated here:
#
if (defined @LOCAL_DOMAIN) {
   @LOCAL_DOMAIN = ();
   undef @LOCAL_DOMAIN;
}
our @LOCAL_DOMAIN = ( 
                    "righteousdudes.com", 
                    "goodfellows.com"
                    );
#
#
###############################################################################
1;
