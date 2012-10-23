<?php

// $Id: cookie.php,v 1.4 2005/04/07 10:04:44 doros Exp $

/* Semplice pagina PHP che ricorda la data e l'ora dell'ultimo
   accesso del visitatore. A tale scopo impostiamo sul browser un
   cookie di nome "ultimavista", la cui scadenza determina quanto a
   lungo viene conservata tale memoria. */

// il saluto predefinito
$saluto = " Benvenuto ";

// Controllo se esiste il cookie ...
if (isset($HTTP_COOKIE_VARS["ultimavisita"])) {
  $saluto = " Bentornato! ";
}

// imposto il cookie relativo a questa visita
setcookie("ultimavisita", time());
?>

<html>
<head>
<title><?php $saluto ?></title>
</head>
<body>
<h1><?php echo $saluto ?></h1>

<?php
if (isset($HTTP_COOKIE_VARS["ultimavisita"])) {
  // stampo la data dell'ultima visita
  echo "<p>L'ultima volta sei stato qui il ".date("d/m/Y");
  echo " alle ore ".date("H:i:s.",$ultimavisita)."</p>";
  // link per cancellare il cookie
  echo "<p><a href=\"cancella.php\">Cancella il cookie</a></p>";
} else
{
  echo "<p>Non sei mai stato qui prima?</p>";
}

?>

</body>
</html>
