<?php

// $Id: SQL.php,v 1.1 2006/03/20 16:42:51 doros Exp $

class SQL {
  var $dbhost;
  var $dbuser;
  var $dbpass;
  var $dbase;
  var $sql_query;
  var $mysql_link;
  var $sql_result;
  var $query_count;

  function sql() {
    $this->dbhost = 'localhost';
    $this->dbuser = 'luca';
    $this->dbpass = 'secret';
    $this->dbase = 'dbprova';
    $this->mysql_link = '0';
    $this->query_count = '0';
    $this->sql_result = '';
    $this->connection();
  }



  function connection() {
    $this->mysql_link = @mysql_connect( $this->dbhost,
                                        $this->dbuser,
                                        $this->dbpass ) or
      $this->error( mysql_error( $this->mysql_link ),
                    $this->sql_query, mysql_errno( $this->mysql_link ) );

    @mysql_select_db( $this->dbase ) or 
      $this->error( mysql_error( $this->mysql_link ),
                    $this->sql_query, mysql_errno( $this->mysql_link ) );
  }



  function error( $error_msg, $sql_query, $error_no ) {
    $error_date = date("j F Y, g:i a");

    $error_page = <<<EOD
<html><head><title>Errore mySQL</title>
<style>P,BODY{ font-family:arial,sans-serif; font-size:11px; }</style></head><body>
&nbsp;<br><br><blockquote><b>Si &egrave; verificato un errore nel tentativo di completare la richiesta sql.</b><br>
Puoi ritornare indietro e riprovare facendo un click <a href="javascript:history.go(-1);">qui</a>, se l'errore persiste
devi contattare l'amministratore selezionando <a href='mailto:sysadm@netkit4tic.fdns.net?subject=SQL+Error'>qui</a>
<br><br><b>Error Returned</b><br>
<form name='mysql'><textarea rows="15" cols="60">mySQL query error: {$sql_query}

mySQL error: {$error_msg}
mySQL error code: {$error_no}
Date: {$error_date}</textarea></form><br>Ci scusiamo per l'inconveniente</blockquote></body></html>
EOD;

    echo $error_page;
  }



  function close() {
    mysql_close( $this->mysql_link );
  }



  function sql_query( $sql_query ) {
    $this->sql_query = $sql_query;
    $this->sql_result = @mysql_query( $sql_query, $this->mysql_link );
    if (!$this->sql_result) {
      $this->error( mysql_error( $this->mysql_link ),
                    $this->sql_query, mysql_errno( $this->mysql_link ) );
    }
    $count = $this->query_count;
    $count = ($count + 1);
    $this->query_count = $count;
  }

  function num_rows() {
    $mysql_rows = mysql_num_rows( $this->sql_result );
    if (!$mysql_rows) {
      $this->error( mysql_error( $this->mysql_link ),
                    $this->sql_query, mysql_errno( $this->mysql_link ) );
    }
    return $mysql_rows;
  }

  function affected_rows() {
    $mysql_affected_rows = mysql_affected_rows( $this->mysql_link );
    return $mysql_affected_rows;
  }

  function fetch_array() {
    if ( $this->num_rows() > 0 ) {
      $mysql_array = mysql_fetch_assoc( $this->sql_result );
      if (!is_array( $mysql_array )) {
        return FALSE;
      }
      return $mysql_array;
    }
  }

  function fetch_rows() {
    if ( $this->num_rows() > 0 ) {
      $mysql_array = mysql_fetch_row( $this->sql_result );
      if (!is_array( $mysql_array )) {
        return FALSE;
      }
      return $mysql_array;
    }
  }

  function query_count() {
    return $this->query_count;
  }

}

?>
