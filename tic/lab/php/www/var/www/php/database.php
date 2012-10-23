<?php

// $Id: database.php,v 1.5 2005/03/14 11:09:50 doros Exp $

/* Accesso con autenticazione ad un database MySQL.
   Costruzione di una tabella. */

// Nome dell'host (hostname) su cui si trova MySQL
$dbhost = "localhost";

// Nome del database
$dbname = "dbprova";

// Il nome utente
$dbuser = "luca";

// La password
$dbpass = "secret";

// Connessione al server
$conn = mysql_connect($dbhost, $dbuser, $dbpass)
  or die("impossibile collegarsi al server MySQL.");

// Selezione del database
mysql_select_db($dbname, $conn)
  or die ("Impossibile selezionare il database $dbname.");

// Preparazione comando SQL
$sql = "CREATE TABLE rubrica ("
       . "Progressivo int PRIMARY KEY AUTO_INCREMENT, "
       . "Nome varchar(40) NOT NULL, "
       . "DataNascita date, "
       . "Cognome varchar(40) NOT NULL, "
       . "Telefono varchar(20))";

// Esecuzione comando SQL
$res = mysql_query($sql, $conn)
  or die ("Errore: ". mysql_error());

// Chiusura della connessione
mysql_close($conn);
?>

<html>
<head>
<title> Creazione database </title>
</head>
<body>

<p> Tabella rubrica costruita! </p>

</body>
</html>
