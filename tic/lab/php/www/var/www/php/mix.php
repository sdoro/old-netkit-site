<html>
<!-- $Id: mix.php,v 1.1 2004/10/22 04:46:15 doros Exp $ -->
<head>
<title> Esempio di intercalazione html-php </title>
</head>
<body>


<?php

/* In questo esempio invece di usare il comando PHP echo per mandare
   in output qualcosa, saltiamo fuori dal modo PHP e spediamo direttamente
   HTML. La cosa importante e' che il flusso logico dello script
   rimane intatto: solo uno dei blocchi HTML sara' mandato al viewer
   in dipendenza del risultato di strpos(). */

if (strpos($_SERVER["HTTP_USER_AGENT"], "MSIE") !== false) {
?>
<h3>strpos ha restituito il valore non-false</h3>
<center><b>Stai usando Internet Explorer :-(</b></center>
<?php
} else {
?>
<h3>strpos ha restitutito il valore false</h3>
<center><b>Non stai usando Internet Explorer ;-)</b></center>
<?php
}
?>


</body>
</html>
