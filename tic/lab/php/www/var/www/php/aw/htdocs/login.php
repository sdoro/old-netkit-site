<?php

/* $Id: login.php,v 1.1 2005/04/28 17:21:16 doros Exp $ */

include "../include/prelude.inc.php";
session_start();
global $error;
$error="";
if ("POST" == $_SERVER["REQUEST_METHOD"]) {
  $user_id = authenticate_user($name, $password);
  if ($user_id > 0) {
    log_login_attempt(true, $name);
    header("Location: index.php");
  } else {
    log_login_attempt(false, $name);
    $error = "Utente o password errati";
  }
}

include "../templates/login.tpl"

?>
