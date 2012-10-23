<?php

/* $Id: prelude.inc.php,v 1.1 2005/04/28 17:21:49 doros Exp $ */

include "../conf/config.mysql.php";
include "dbutil.inc.php";
function check_user_is_logged_in() {
  if (!isset($_SESSION["user_id"])) {
    header("Location: login.php");
    exit;
  }
}

function authenticate_user() {
  global $name, $password, $user_id;
  $sql = "select * from users where user='$name' and password='$password'";
  $res = dbutil_select_one($sql);
  if ($res > 0) {
    $user_id = $res["user_id"];
    $_SESSION["user_id"] = $user_id;
    return $user_id;
  } else
    return 0;
}

function log_login_attempt($str1, $str2) {
  global $debug;
  if (isset($debug) && $debug) {
    echo "\n<p><pre>log $str1, $str2</pre><br>\n";
  }
}

?>
