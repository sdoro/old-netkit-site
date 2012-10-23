<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01//EN'
  'http://www.w3.org/TR/html4/strict.dtd'>
<html lang='it'>
<!-- $Id: display.php,v 1.1 2005/05/08 21:43:26 doros Exp $ -->
<head>
 <title>Applicazioni Web: sql form</title>
</head>
<body>


<?php

  define("DB_HOST",      "localhost");
  define("DB_USER",      "luca");
  define("DB_PASSWORD",  "secret");
  define("DB_NAME",      "dbprova");



  $conn = mysql_connect(DB_HOST, DB_USER, DB_PASSWORD)
    or die("impossibile collegarsi al server MySQL.");

  // Selezione del database
  mysql_select_db(DB_NAME, $conn)
    or die ("Impossibile selezionare il database $dbname.");

  // Preparazione comando SQL
  $sql = $_GET["cmd"];

  // Esegue il comando SQL o stampa un messaggio di errore
  $res = mysql_query($sql, $conn);
    //or die ("Errore: ". mysql_error());

  while ($row = mysql_fetch_array($res)) {
    echo "<pre>($row[1],$row[2])</pre>";
  }

?>

</body>
</html>
