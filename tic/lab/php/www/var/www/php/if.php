<html>
<!-- $Id: if.php,v 1.4 2004/10/22 04:45:04 doros Exp $ -->
<head>
<title> Esempio if </title>
</head>
<body>


<?php

/* Nello script seguente controlliamo il valore della variabile
   globale $n e mostriamo un messaggio di errore, bloccando
   l'esecuzione del programma, se questo e' maggiore di 1.
   Attenzione che la pagina html generata manca degli ultimi
   due tag!! */

$n=5;
if ($n > 1) die ("<p>$n &egrave; maggiore di uno!!!</p>");
?>


</body>
</html>
