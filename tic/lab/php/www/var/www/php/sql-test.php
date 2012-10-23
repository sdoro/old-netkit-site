<?php

// $Id: sql-test.php,v 1.1 2006/03/20 16:43:05 doros Exp $

// Include the class file
require('SQL.php');

// Initiate an instance class
$db = new SQL;

// Query the database
$db->sql_query( "SELECT * FROM rubrica" );

// Get the amount of rows returned
$num_rows = $db->num_rows();

// Error check that the rows returned were what you expected
if ( $num_rows >= 1) {
  // Fetch Array (Associative)
  while ($mysql_array = $db->fetch_array()) {
    // Print Data
    echo "<div>$mysql_array[Nome]</div>";
  }
} else {
  // Zero results were returned
  echo 'La query non ha dato alcun risultato.';
}

// Print the Query Count (in this case 1)
echo '<br>Query Count:'. $db->query_count();

?>
