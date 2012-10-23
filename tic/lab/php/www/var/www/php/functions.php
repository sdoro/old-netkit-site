<html>
<!-- $Id: functions.php,v 1.1 2004/10/22 04:43:46 doros Exp $ -->
<head>
<title> Esempio di uso di funzioni (anche condizionali) </title>
</head>
<body>


<?php

/*  Dalla versione 4 di PHP la definizione delle funzioni non deve
     piu' precedere la chiamata. Questa regola viene superata solo
     nel caso di definizione condizionale.*/

$makefoo = true;

/* A questo punto non possiamo chiamare foo() da qui'
   poiche' non esiste ancora, ma possiamo chiamare bar() */

bar();

if ($makefoo) {
  function foo ()
  {
    echo "<p>Io non esisto fino a quando l'esecuzione non mi raggiunge.</p>\n";
  }
}

/* Ora possiamo con sicurezza chiamare foo()
   poiche' $makefoo e' stato valutato a true */

if ($makefoo) foo();

function bar() 
{
  echo "<p>Io esco immediatamante dopo lo start.</p>\n";
}

?>


</body>
</html>
