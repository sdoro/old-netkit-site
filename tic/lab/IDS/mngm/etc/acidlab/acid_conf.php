<?php
/* $Id: acid_conf.php,v 1.3 2007-04-30 21:37:26 doros Exp $ */

$ACID_VERSION = "0.9.6b20";

/* Path to the DB abstraction library 
 *  (Note: DO NOT include a trailing backslash after the directory)
 *   e.g. $foo = "/tmp"      [OK]
 *        $foo = "/tmp/"     [OK]
 *        $foo = "c:\tmp"    [OK]
 *        $foo = "c:\tmp\"   [WRONG]
 */
$DBlib_path = "/usr/share/adodb";

/* The type of underlying alert database
 * 
 *  MySQL       : "mysql"
 *  PostgresSQL : "postgres"
 *  MS SQL Server : "mssql"
 */
$DBtype = "mysql";

/* Alert DB connection parameters
 *   - $alert_dbname   : MySQL database name of Snort alert DB
 *   - $alert_host     : host on which the DB is stored
 *   - $alert_port     : port on which to access the DB
 *   - $alert_user     : login to the database with this user
 *   - $alert_password : password of the DB user
 *
 *  This information can be gleaned from the Snort database
 *  output plugin configuration.
 */
$alert_dbname   = "snort";
$alert_host     = "localhost";
$alert_port     = "";
$alert_user     = "snort";
$alert_password = "snort";

/* Archive DB connection parameters */
$archive_dbname   = "snort_archive";
$archive_host     = "localhost";
$archive_port     = "";
$archive_user     = "snort";
$archive_password = "snort";

/* Type of DB connection to use
 *   1  : use a persistant connection (pconnect)
 *   2  : use a normal connection (connect)
 */
$db_connect_method = 1;

/* Path to the graphing library 
 *  (Note: DO NOT include a trailing backslash after the directory)
 */
$ChartLib_path = "/usr/share/phplot";

/* File format of charts ('png', 'jpeg', 'gif') */
$chart_file_format = "png";

/* Chart default colors - (red, green, blue)
 *    - $chart_bg_color_default    : background color of chart
 *    - $chart_lgrid_color_default : gridline color of chart
 *    - $chart_bar_color_default   : bar/line color of chart
 */
$chart_bg_color_default     = array(255,255,255);
$chart_lgrid_color_default  = array(205,205,205);
$chart_bar_color_default    = array(190, 5, 5);

/* Maximum number of rows per criteria element */
$MAX_ROWS = 10;

/* Number of rows to display for any query results */
$show_rows = 50;

/* Number of items to return during a snapshot
 *  Last _X_ # of alerts/unique alerts/ports/IP
 */
$last_num_alerts = 15;
$last_num_ualerts = 15;
$last_num_uports = 15;
$last_num_uaddr = 15;

/* Number of items to return during a snapshot
 *  Most Frequent unique alerts/IPs/ports
 */
$freq_num_alerts = 5;
$freq_num_uaddr = 15;
$freq_num_uports = 15;

/* Number of scroll buttons to use when displaying query results */
$max_scroll_buttons = 12;

/* Debug mode     - how much debugging information should be shown
 * Timing mode    - display timing information
 * SQL trace mode - log SQL statements
 *   0 : no extra information
 *   1 : debugging information
 *   2 : extended debugging information
 *
 * HTML no cache - whether a no-cache directive should be sent
 *                 to the browser (should be = 1 for IE)
 * 
 * SQL trace file - file to log SQL traces
 */
$debug_mode = 0;
$debug_time_mode = 1;
$html_no_cache = 1;
$sql_trace_mode = 0;
$sql_trace_file = "";

/* Auto-Screen refresh
 * - Refresh_Stat_Page - Should certain statistics pages refresh?
 * - Stat_Page_Refresh_Time - refresh interval (in seconds)
 */
$refresh_stat_page = 1;
$stat_page_refresh_time = 180;

/* Display First/Previous/Last timestamps for alerts or
 * just First/Last on the Unique Alert listing.
 *    1: yes
 *    0: no
 */
$show_previous_alert = 0;

/* Sets maximum execution time (in seconds) of any particular page. 
 * Note: this overrides the PHP configuration file variable 
 *       max_execution_time.  Thus script can run for a total of
 *       ($max_script_runtime + max_execution_time) seconds 
 */
$max_script_runtime = 180;

/* How should the IP address criteria be entered in the Search screen?
 *   1 : each octet is a separate field
 *   2 : entire address is as a single field
 */
$ip_address_input = 2;

/* Should a combo box with possible signatures be displayed on the
 * search form. (Requires Javascript)
 *   0 : disabled
 *   1 : show only non pre-processor signatures (e.g., ignore portscans)
 *   2 : show all signatures
 */
$use_sig_list = 0;

/* Resolve IP to FQDN (on certain queries?) 
 *    1 : yes
 *    0 : no 
 */
$resolve_IP = 1;

/* Should summary stats be calculated on every Query Results page
 * (Enabling this option will slow page loading time)
 */
$show_summary_stats = 0;

/* DNS cache lifetime (in minutes) */
$dns_cache_lifetime = 20160;

/* Whois information cache lifetime (in minutes) */
$whois_cache_lifetime = 40320;

/* Snort spp_portscan log file */
$portscan_file = "";

/* Event cache Auto-update
 *
 *  Should the event cache be verified and updated on every
 *  page log?  Otherwise, the cache will have to be explicitly
 *  updated from the 'cache and status' page.
 *
 *  Note: enabling this option could substantially slow down
 *  the page loading time when there are many uncached alerts.
 *  However, this is only a one-time penalty.
 *
 *   1 : yes
 *   0 : no
 */
$event_cache_auto_update = 1;

/* Maintain a history of the visited pages so that the "Back"
 * button can be used.
 *
 * Note: Enabling this option will cause the PHP-session to
 * grow substantially after many pages have been viewed causing
 * a slow down in page loading time. Periodically return to the
 * main page to clear the history.
 *
 *   1 : yes
 *   0 : no
 */
$maintain_history = 1;

/* Level of detail to display on the main page.
 *
 * Note: The presence of summary statistics will slow page loading time
 *
 *   1 : show both the links and summary statistics
 *   0 : show only the links and a count of the number of alerts
 */
$main_page_detail = 1;

/* Link to external Whois query */
$external_whois_link = "http://www.samspade.org/t/ipwhois?a=";
//$external_whois_link = "http://www.geektools.com/cgi-bin/proxy.cgi?targetnic=auto&query="

/* Link to external DNS query */
$external_dns_link = "http://www.samspade.org/t/dns?a=";

/* Link to external SamSpade "all" query */
$external_all_link = "http://www.samspade.org/t/lookat?a=";

/* Link to external Port database */
$external_port_link = "http://www.portsdb.org/bin/portsdb.cgi?portnumber=";
//$external_port_link = "http://www.snort.org/ports.html?port="

/* Email Alert action
 *
 * - action_email_from : email address to use in the FROM field of the mail message
 * - action_email_subject : subject to use for the mail message
 * - action_email_msg : additional text to include in the body of the mail message
 * - action_email_mode : specifies how the alert information should be enclosed
 *     0 : alerts should be in the body of the message
 *     1 : alerts should be enclosed in an attachment
 */
$action_email_from = "ACID Alert <acid>";
$action_email_subject = "ACID Incident Report";
$action_email_msg = "";
$action_email_mode = 0;

?>
