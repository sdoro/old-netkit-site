<?php

/* $Id: dbutil.inc.php,v 1.1 2005/04/28 17:20:51 doros Exp $ */

/*
    Matteo Vaccari
    http://matteo.vaccari.name/

    Id: dbutil.inc.php,v 1.1.1.1 2002/11/04 08:39:10 vaccari Exp $

    Author:  Matteo Vaccari
    Project:
    Purpose: Funzioni generiche di comunicazione con il db
    Note:
*/


// apre una connessione al database, se necessario
function dbutil_connect() {
  global $dbutil_conn;

  if (!isset($dbutil_conn)) {
    $dbutil_conn = mysql_connect("localhost", DB_USER, DB_PASSWORD)
	or user_error("dbutil_connect: " . mysql_error(), E_USER_ERROR);

    mysql_select_db(DB_NAME) or user_error(mysql_error(), E_USER_ERROR);
  }
}


function dbutil_query($sql) {
  global $debug_sql;

  dbutil_connect();
  if (isset($debug_sql) && $debug_sql) {
    echo "\n<p><pre>query $sql</pre><br>\n";
  }
  $result = mysql_query($sql) or user_error(mysql_error(), E_USER_ERROR);
  return $result;
}



/*
  Esegue una select.
  Restituisce un array (eventualmente vuoto) di tutte le righe che ha
  trovato, rappresentate come array associativi.  

  Se il secondo argomento e' MYSQL_NUM, allora restituisce array
  indicizzati da interi.  Se si passa MYSQL_BOTH, allora restituisce
  un array indicizzato in entrambe le maniere.
 */
function dbutil_select($sql, $result_type = MYSQL_ASSOC) {
  $result = dbutil_query($sql);
  if (!$result) return false;

  $values = array();
  while ($row = mysql_fetch_array($result, $result_type)) {
    array_push($values, $row);
  }
  mysql_free_result($result);

  return $values;
}


/*
  Come dbutil_select, ma restituisce solo la prima riga oppure FALSE.
 */
function dbutil_select_one($sql, $result_type = MYSQL_ASSOC) {
  $result = dbutil_select($sql);
  if (!$result) return false;
  return $result[0];
}


/*
  Come dbutil_select, ma restituisce un array di righe indicizzato per la
  chiave, invece di un array di righe indicizzato numericamente.
 */
function dbutil_select_bykey($key, $sql, $result_type = MYSQL_ASSOC) {
  $result = dbutil_query($sql);
  if (!$result) return false;

  $values = array();
  while ($row = mysql_fetch_array($result, $result_type)) {
    $values[$row[$key]] = $row;
  }
  mysql_free_result($result);

  return $values;
}
