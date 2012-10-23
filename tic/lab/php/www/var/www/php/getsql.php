<?php
 // $Id: getsql.php,v 1.2 2005/05/08 21:43:58 doros Exp $


define("DB_HOST",      "localhost");
define("DB_USER",      "luca");
define("DB_PASSWORD",  "secret");
define("DB_NAME",      "dbprova");


$error = "";

if ($_POST['process'] == 1 ) {
  $conn = mysql_connect(DB_HOST, DB_USER, DB_PASSWORD)
    or die("impossibile collegarsi al server MySQL.");

  // Selezione del database
  mysql_select_db(DB_NAME, $conn)
    or die ("Impossibile selezionare il database $dbname.");

  // Preparazione comando SQL
  $sql = $cmd;

  // Esegue il comando SQL o stampa un messaggio di errore
  $res = mysql_query($sql, $conn);

  if ($res) {
    header("location: display.php?cmd=$cmd");
    exit;
  } else {
    $error = "Invalid cmd";
    $cmd = $_POST['cmd'];
  }
}

?>




<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01//EN'
  'http://www.w3.org/TR/html4/strict.dtd'>
<html lang='it'>

 <head>
  <title>Applicazioni Web: sql form</title>
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
                    <td width="100%" colSpan=2>Inserisci il comando sql.
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
                    <td width="10%">sql:</td>
                    <td align=left width="90%"><input maxLength=110 size=55 type="text" name="cmd" </td>
                  </tr>
                  <tr vAlign=center align=middle>
                    <td align=right width="100%"><input type="hidden" name="process" value="1">
                                                <input type="submit" name="sub" value="esegui"></td>
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
