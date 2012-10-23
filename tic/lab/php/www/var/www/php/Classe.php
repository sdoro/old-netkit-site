<?php

// $Id: Classe.php,v 1.1 2006/03/20 16:42:22 doros Exp $

class Classe {

  var $x;

  function Classe() {
    $this->x = 'Saluto: ';
  }

  function hello() {
    $this->x .= 'hello world!';
    echo "<p>$this->x</p>";
  }

}

?>
