<?php

// $Id: action-test.php,v 1.2 2005/01/21 09:14:20 doros Exp $
// Esempio di validazione form

  $errors = array();

  // se non usassi empty() il risultato sarebbe meno chiaro:
  // if (!isset($_REQUEST["name"]) || !$_REQUEST["name"])
  //   $errors [] = "Manca il nome";

  if (empty($_REQUEST["name"]))
    $errors [] = "Manca il nome";
  if (empty($_REQUEST["email"]))
    $errors [] = "Manca l'indirizzo e-mail";
  if (!ereg("@", $_REQUEST["email"]))
    $errors [] = "Manca la parte dominio nell'indirizzo e-mail";
  else {
    if (!ereg("it$", $_REQUEST["email"]))
      $errors [] = "Il dominio dell'indirizzo e-mail non e' italiano";
    if (!ereg("^sa", $_REQUEST["email"]))
      $errors [] = "L'indirizzo e-mail non inizia con la sequenza sa";
    if (!ereg("abc", $_REQUEST["email"]))
      $errors [] = "Nell'indirizzo e-mail non compare la sequenza abc";
  }

  if (!$errors) {
    $title = "Inserimento dati OK";
    echo "<p>Ciao ${_POST["name"]}";
    echo "<p>La tua email &egrave;:  ${_POST["email"]}.";
  } else {
    $title = "Errori";
    $content = "Per favore premi il tasto \"indietro\" e correggi i
                seguenti errori:<ul>";
    foreach ($errors as $err) {
      $content .= "<li>$err</li>";
    }
    $content .= "</ul>";
  }

  echo "
  <html>
    <head>
      <title>$title</title>
    </head>
    <body>
    <h1>$title</h1>
    $content
    </body>
  </html>";

?>
