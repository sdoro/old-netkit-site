<html>
<!-- $Id: array.php,v 1.1 2005/03/14 11:10:05 doros Exp $ -->
<head>
<title> Esempio array </title>
</head>
<body>

<?php

$ar = array("zot", 123, "foo");
echo ": ", $ar[0];
echo "<br>";
echo ": ", $ar[1];

/* maps */

echo "<br>-------------<br>";
$ar = array ("nome" => "Nane", "telefono" => "041 123456");
echo ": ", $ar["nome"];
echo "<br>";
echo ": ", $ar["telefono"];
echo "<br>";
echo ": ", $ar[0];

/* assegnare ad un array */

echo "<br>-------------<br>";
$ar["telefono"] = "328 123456";
echo ": ", $ar["telefono"];
$foo = $ar;   // crea una copia

/* cicli su array */

echo "<br>-------------<br>";
$ar = array ("x" => "a", "y" => "b", "z" => "c");
foreach ($ar as $val) {
  echo ": $val <br>";
}

foreach ($ar as $key => $val) {
  echo ": ($key, $val)<br>";
}


?>

</body>
</html>
