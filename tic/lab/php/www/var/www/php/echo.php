<?php

// $Id: echo.php,v 1.1 2004/11/22 16:05:09 doros Exp $
// esempi di utilizzo del singolo e del doppio apice

echo '<pre>Questa frase &egrave; suddivisa
su pi&ugrave; righe. Verranno stampate
anche le newlines</pre>';


echo "<pre>Questa frase &egrave; suddivisa\nsu pi&ugrave; righe. Verranno stampate\nanche le newlines</pre>";


echo "<pre>I caratteri di Escaping sono fatti in \"Questo modo\".</pre>";


// All'interno di un comando echo si possono usare variabili:
$foo = "foobar";
$bar = "barbaz";
echo "<pre>foo vale $foo</pre>"; // foo vale foobar


// Se invece usiamo il singolo apice verra' stampato il nome della
// variabile e non il contenuto
echo '<pre>foo vale $foo</pre>'; // foo vale $foo



// Supponiamo che un'operazione di POST abbia introdotto un campo di nome
// name valorizzato a 'Caio':
$_POST["name"] = 'Caio';

// Per stampare Nome='Caio'
$name = $_POST["name"];
echo "<pre>Nome='$name'</pre>";

// oppure:
echo "<pre>Nome='" . $_POST["name"] . "'</pre>";

// oppure:
echo "<pre>Nome='{$_POST["name"]}'</pre>";

?>
