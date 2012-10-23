<?php

/* $Id: index.php,v 1.1 2005/04/28 17:21:03 doros Exp $ */

include "../include/prelude.inc.php";
session_start();
check_user_is_logged_in();


?>

<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01//EN'
  'http://www.w3.org/TR/html4/strict.dtd'>
<!-- $Id: index.php,v 1.1 2005/04/28 17:21:03 doros Exp $ -->
<html lang='it'>
<body>

<?php

echo "<br><pre>pagina visibile sono agli utenti autenticati<br></pre>";

?>

</body>
</html>

