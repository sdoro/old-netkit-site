<?php
// $Id: show.php,v 1.6 2009-02-01 09:02:20 doros Exp $

$url=$_SERVER['argv'][0];
if ($_SERVER['argc'] == 0)
    die("File name missing!");
if (!get_magic_quotes_gpc())
    $url = addslashes($url);

// for ME the file name is short. ;-)
if (strlen($url) < 16)
    show_source(basename($url));
else
    die("File length ;-)");


?>
