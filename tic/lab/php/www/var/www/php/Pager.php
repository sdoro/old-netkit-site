<?php

// $Id: Pager.php,v 1.1 2006/03/20 16:43:22 doros Exp $

class Pager {
  var $offset;
  var $limit;
  var $numPages;
  var $page;

  function Pager($numHits, $limit, $page) {
    $numHits  = (int) $numHits;
    $this->limit    = max((int) $limit, 1);
    $this->page     = (int) $page;
    $this->numPages = ceil($numHits / $this->limit);

    $this->page = max($this->page, 1);
    $this->page = min($this->page, $this->numPages);

    $this->offset = ($this->page - 1) * $this->limit;
  }
}

?>
