<?php

// $Id: cancella.php,v 1.3 2005/04/07 10:04:59 doros Exp $

/* cancella il cookie di nome "ultimavisita", assegnandoli un valore
   nullo e dirotta il browser di nuovo alla pagina precedente (che nel
   nostro esempio e' cookie.php) */

setcookie("ultimavisita","");
header("Location: cookie.php");

?>
