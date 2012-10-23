<html>
<!-- $Id: action.php,v 1.2 2005/04/24 20:03:29 doros Exp $ -->
<head>
<title> Esempio di form HTML con action PHP </title>
</head>
<body>

<?php
if ($_POST["sub"] == 'imposta') {
  echo "<p>Ciao $_POST[name]! la tua email &egrave;: $_POST[email]</p>";
} else
  echo "<p>Operazione annullata</p>";
?>

</body>
</html>
