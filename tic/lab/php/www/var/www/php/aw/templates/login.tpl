<?php

/* $Id: login.tpl,v 1.2 2006/05/16 14:21:09 doros Exp $ */

include "../conf/config.mysql.php";

$error = "";
$passwdclass = "basictext";
$user = "";

if ($_POST['process'] == 1 ) {
  global $user_id;
  if ($user_id > 0) {
    header("location: index.php");
  } else {
    $error = "Invalid login";
    $user = $_POST['user'];
    $passwdclass = 'errortext';
  }
}


?>

<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01//EN'
  'http://www.w3.org/TR/html4/strict.dtd'>
<!-- $Id: login.tpl,v 1.2 2006/05/16 14:21:09 doros Exp $ -->
<html lang='it'>

 <style>
   .basictext {
     font-family: Arila, Helvetica, sans-serif;
     font-size: 14px; color: #000066; font-weight: bold;
   }
   .errortext {
     font-family: Arila, Helvetica, sans-serif;
     font-size: 14px; color: #CC0000; font-weight: bold;
   }
 </style>

 <head>
  <meta http-equiv='Content-Type' content='text/html;charset=iso-8859-1' >
  <title>Applicazioni Web: virtual login form</title>
  <link rel='stylesheet' href='../htdocs/style.css' type='text/css'>
 </head>

<body>
<br>


<form action="<?$PHP_SELF?>" method="post">
<table width=454 align=center border=0>
  <tr> 
    <td vAlign=top align=middle width="60%"> 
      <div align="center">
        <table cellSpacing=0 cellPadding=1 width=444 border=0>
          <tbody> 
            <tr> 
              <td bgColor=#4277bb> 
                <table cellSpacing=0 cellPadding=3 width=442 bgColor=#f9fbff border=0>
                  <tr align=center height=50> 
                    <td width="100%" colSpan=2>Inserisci il codice utente e la password.
                    </td>
                  </tr>
                  <? if ($error != "") {
                     print '
                  <tr align=right height=50>
                    <td width="50%">Errore:</td>
                    <td align=left width="50%">'.$error.'</td>
                  </tr>';
                     }
                  ?>
                  <tr align=right height=50>
                    <td width="50%">Utente:</td>
                    <td align=left width="50%"><input maxLength=110 size=15 type="text" name="name" value="<?= $name ?>"></td>
                  </tr>
                  <tr align=right height=50>
                    <td width="50%">Password:</td>
                    <td align=left width="50%"><input maxLength=110 size=15 type="password" name="password" value="<?= $password ?>"></td>
                  </tr>
                  <tr vAlign=center align=middle>
                    <td align=right width="50%">&nbsp;</td>
                    <td align=left width="50%">&nbsp;</td>
                  </tr>
                  <tr vAlign=center align=middle>
                    <td align=right width="50%"><input type="hidden" name="process" value="1">
                                                <input type="submit" name="sub" value="accedi"></td>
                    <td align=left width="50%"><input type="submit" name="sub" value="chiudi"></td>
                  </tr>
                </table>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </td>
  </tr>
</table>
</form>
  
</body>
</html>
