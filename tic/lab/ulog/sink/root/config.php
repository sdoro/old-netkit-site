<?php

#if set to "true", user of the interface will be provided a way to change language on the fly
$lang_override=true;
#default lang
if (isset($_GET['lang'])) {
    if (preg_match('/^[a-z]{2}$/',$_GET['lang']))
      $_SESSION['lang']=$_GET['lang'];
}

if (isset($_SESSION['lang']))
  $lang=$_SESSION['lang'];




if (!isset($lang))
  $lang="en";

$_SESSION['lang'] = $lang;

#if one adds languages in messages.php, also add it to this array
$available_langs=array('fr','en');
#Whether your firewall is a NuFW (users aware) firewall.
$nufw_enabled="yes";
# Nuface link:
# Uncomment this to have a link to the acl in nuface
# $nuface_link=1;
# $nuface_url="https://fydelkass.inl.fr/nuface/acls.php";
# Set to 1 if Netfilter ruleset only log drop
# This will display packets logged by Netfiler as drop.
$netfilter_log_drop=1;


# Uncomment this if you use NuFW 2.1.X+ (IPV6 sql model)
#$nufw_version = "2.2";
#Only useful if not only dropped or rejected packets are logged
$colorize_entries="yes";
#date format ( for function date of php)
$date_format="d/m/y H:i:s";
# number of results by page for hosts
$number=20;
#  number of results for port :
$port_number=10;
# number of entries with a page array
$number_page = 30;
# refresh time in sec ;
$refresh=90;
# print load average ?
$print_load=1;
# print worse hosts when level warn_load is reached
$warn_load=2;
# number of worse hosts to print
$badhostnumber=5;
# Display link for conntrack.php
$destport="yes";

# Yu can specify here an alternate logo
#$logo_img="../nuconf/edenwall.gif";

# File to include in head section of html
# (useful for css)
#$head_file="include/edenwall.inc";
$head_file="";
# Include the following file before any text
#$header_file="../nuconf/include/edennavbar.php";
$header_file="";
# Include the following file before any text
# $footer_file="footer.inc";
$footer_file="";

# set this to "" if you have mysql 3.23 and no temporary table
#$temporary="";
$temporary="temporary";


# If you use connection tracking, you must have table conntrack_ulog in
# your mysql database. If you don't have it you can use conntrack.mysqldump
# script to create it.
# If you want use this option set conntrack_enabled to "yes" or if you don't
# want it set this option to "no".
$conntrack_enabled="no";

#The base URL of the site
$url_base="http://my.edenwall.com/nulog/";
$url_base="http://192.168.77.2/nulog/";

# Set the name of the computer
$machine="EdenWall";
$machine="repo2";

$site_title="Log FW pour ".$machine;
$site_title="Log FW for ".$machine;

# database Host
$db_host="localhost";
# database name
$db_ulog="ulogdb";
# database user
$db_user="root";
# database password
$db_pwd="";

# the two following variable are used if conntrack_enabled is set to yes
# the table where nuauth entry are logged
$table_conntrack=$db_ulog. ".conntrack_ulog";
# the table containing current datas
$table_archive=$db_ulog.".ulog";

# Use this to remove prefix and suffix from username
# $preuser="DOMAIN"
# $postuser="@nufw"
$system_is_case_insensitive=0;

$table_ulog=$db_ulog.".ulog";

# Use this if you have multiple tables (archive or different
# firewalls
# Comment the following line if you do not use this feature
$table_basename="ulog";

?>
