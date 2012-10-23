<?php

// $Id: Address.php,v 1.1 2006/11/19 08:59:52 doros Exp $

class Address {

  var $address;

  function Address ($datem) {
    echo '
<address>
<!-- Creative Commons License -->
<a href="http://creativecommons.org/licenses/by/1.0/">
   <img alt="Creative Commons License"
        src="somerights.gif" /></a>
<!-- /Creative Commons License -->
<a href="http://eldred.cc/">
   <img alt="FREE THE MOUSE"
        src="mouse.gif" /></a>
<a href="http://validator.w3.org/check?uri=referer"><img
  src="valid-xhtml10.png" height="31" width="88"
  alt="Valid XHTML 1.0!" /></a>
<script type="text/javascript">
function obf_email()
{
  email_middle = "doro@istruzio";
  email_start = "mailto:sandro.";
  email_end = "ne.it";
  return email_start + email_middle + email_end;
}
</script>
<span class="copyright">
Sandro Doro (<a href="mailto:this.is.not@my.real.address"
                onclick="this.href=obf_email();"
                onmouseover="window.status=obf_email();return true;"
                onmouseout="window.status=\'\';return true;">email me</a>)<br />
Ultima modifica: '.$datem.'
</span>
</address>';
  }
}

?>
