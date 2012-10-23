<?php

// $Id: pager-test.php,v 1.2 2006/03/20 16:44:16 doros Exp $

require('Pager.php');

// get the pager input values
$page = $_GET['page'];
$limit = 3;

require('SQL.php');

// Initiate an instance class
$db = new SQL;

// Query the database
$db->sql_query( "SELECT * FROM rubrica" );

// Get the amount of rows returned
$total = $db->num_rows();

// work out the pager values
$pager  = new Pager($total, $limit, $page);
$offset = $pager->offset;
$limit  = $pager->limit;
$page   = $pager->page;

// use pager values to fetch data
$db->sql_query("SELECT * FROM rubrica LIMIT $offset, $limit");

// use $result here to output page content
while ($mysql_array = $db->fetch_array()) {
  echo "<div>$mysql_array[Nome]</div>";
}
echo "<hr>";

// output paging system (could also do it before we output the page content)
if ($page == 1) // this is the first page - there is no previous page
  echo "Precedente";
else            // not the first page, link to the previous page
  echo "<a href=\"$PHP_SELF?page=" . ($page - 1) . "\">Precedente</a>";

for ($i = 1; $i <= $pager->numPages; $i++) {
  echo " | ";
  if ($i == $pager->page)
    echo "Pag. $i";
  else
    echo "<a href=\"$PHP_SELF?page=$i\">Pag. $i</a>";
}

if ($page == $pager->numPages) // this is the last page - there is no next page
  echo " | Successivo";
else            // not the last page, link to the next page
  echo " | <a href=\"$PHP_SELF?page=" . ($page + 1) . "\">Successivo</a>";

?>
