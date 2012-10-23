<?php

// $Id: findit.php,v 1.7 2005/03/14 11:09:34 doros Exp $

// Ricerca di record su database con Nome e/o Cognome impostato da form

// Inclusione configurazione mysql in modo da migliorare la sicurezza
include "../conf/config.mysql.php";

// Connessione al server
$conn = mysql_connect(DB_HOST, DB_USER, DB_PASSWORD)
  or die("impossibile collegarsi al server MySQL.");

// Selezione del database
mysql_select_db(DB_NAME, $conn)
  or die ("Impossibile selezionare il database $dbname.");

// Preparazione comando SQL
$sql = "SELECT Telefono, Nome, Cognome "
     . "FROM rubrica "
     . "WHERE Nome='{$_POST["name"]}' OR "
     . "      Cognome='{$_POST["surname"]}'";

// Esegue il comando SQL o stampa un messaggio di errore
$res = mysql_query($sql, $conn)
  or die ("Errore: ". mysql_error());

// Estrazione del risultato
//$info = mysql_fetch_row ($res);

?>

<html>
<head>
<title> Select from rubrica </title>
</head>
<body>

<?php

echo "<p>Elenco di numeri di telefono corrispondenti a Nome='{$_POST["name"]}' o Cognome='{$_POST["surname"]}'</p>";

while ($row = mysql_fetch_array($res)) {
  echo "<p>$row[Telefono] ($row[Nome],$row[Cognome])</p>";
}

// Libera risultati
mysql_free_result($res);

// Chiusura della connessione
mysql_close($conn);

?>

</body>
</html>
