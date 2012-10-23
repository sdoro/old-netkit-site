<?php
// $Id: show.php,v 1.6 2009-02-01 09:02:38 doros Exp $

$f=$_SERVER['argv'][0];
if ($_SERVER['argc'] == 0)
  die("Manca il nome del file.");
if (!get_magic_quotes_gpc()) {
    $f = addslashes($f);
}

// for ME the file name is short. ;-)
if (strlen($f) < 16)
    show_source(basename($f));
else
    die("File length ;-)");

?>
