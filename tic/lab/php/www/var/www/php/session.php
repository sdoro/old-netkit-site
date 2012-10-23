<?php

// $Id: session.php,v 1.2 2006/03/20 16:44:54 doros Exp $

/* Semplice codice PHP che costruisce una sessione e
   usa/memorizza una variabile di sessione.

   Le variabili di sessione sono nell'array $_SESSION

   Il nome della sessione viene resettato al valore di
   default ad ogni richiesta */

$previous_name = session_name();
echo "<p>Il precedente nome della sessione era: $previous_name.</p>";

session_start();
if (!isset($_SESSION["count"])) {
  $_SESSION["count"] = 0;
} else {
  $_SESSION["count"]++;
}


?>
