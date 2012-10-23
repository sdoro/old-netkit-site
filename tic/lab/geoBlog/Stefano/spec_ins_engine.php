
<?
 
$EP=$_POST["EP"];


if ($EP==1) {   //inserimento di un nuovo messaggio/segnalino


$coordinate=trim($_POST["coordinate"]);
$msg=trim($_POST["messaggio"]);
$zoom=trim($_POST["zoom"]);
$nick=trim($_POST["nick"]);
$email=trim($_POST["email"]);
$titolo=trim($_POST["titolo"]);
$cod_tema=trim($_POST["cod_tema"]);
$cod_contenuto=trim($_POST["cod_contenuto"]);
$cod_luogo=trim($_POST["cod_luogo"]);


$host='localhost';
$user='root';
$password='150590';

$connessione= mysql_connect($host,$user,$password) or die("connessione fallita");
//echo "connessione eseguita...";
mysql_select_db("geoblog_admin") or die ("connessione fallita");
//echo "db selezionata";


//$data=date("d/m/Y  H.i.s");
$nuovastringa_sql =mysql_query("INSERT INTO NuoviMessaggi (codLuogo, codTema, codContenuto, GLatLng, zoom, titolo, messaggio, quando, nickname, email, daValutare) values ($cod_luogo , $cod_tema , $cod_contenuto , '$coordinate' , $zoom , '$titolo' , '$msg' , now() , '$nick', '$email', 1)");


mysql_close($connessione);
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>ANCH'IO - INSERIMENTO COMPLETATO</title>

<link rel="stylesheet" href="util/stile.css" type="text/css">

<script language="javascript" type="text/javascript">
function tornaHome(){
	self.location.replace("spec_cons.php");
}
</script>
</head>

<body onLoad="setTimeout('tornaHome()',10000)">
<div id="main">

	<table border="0" cellpadding="0" cellspacing="0" width="985" bgcolor="#FFFFFF">
			<tr height="60">
            	<td width="955"><img src="img/intestazione.jpg" alt="GEOBLOG ANCH'IO" width="796" height="60"/></td>
        		<td width="30"><img src="img/moeca.gif"/></td>
            </tr>
    </table>
	<div id="div_path">
		<div class="div_link_path">
		<!--<a href="javascript:void(0);" class="link_path" id="aiuto">AIUTO</a>-->
		<a href="javascript:self.location.replace('spec_cons.php');" class="link_path">CONSULTAZIONE</a>
		<!--<a href="javascript:void(0);" class="link_path">PAGINA INIZIALE</a>-->
		<!--<a href="javascript:void(0);" class="link_path">TEMI GENERALI</a>-->
		</div>
	</div>
<table width="600" border="0" cellspacing="0" cellpadding="7">
  <tr>
    <td height="100">
	L'INSERIMENTO E' ANDATO A BUON FINE. PRIMA DI VEDERE LA PROPRIA SEGNALAZIONE NELLA PAGINA DI CONSULTAZIONE, BISOGNA ATTENDERE IL CONTROLLO DELLA CONGRUITA' DELLA STESSA DA PARTE DELL'UFFICIO DI REDAZIONE,	CHE	VERRA' EFFETTUATO ENTRO 24 ORE. GRAZIE
	</td>
  </tr>
  <tr>
    <td height="50">
	<a href="javascript:self.location.replace('spec_cons.php');">TORNA ALLA PAGINA DI CONSULTAZIONE</a>
	</td>
  </tr>
</table>

</div>
</body>

</html>



<?
}
elseif
		 ($EP==2){     //inserimento di un nuovo commento


$msg=trim($_POST["messaggio"]);
$nick=trim($_POST["nick"]);
$email=trim($_POST["email"]);
$valore=trim($_POST["valore"]);
$idPadre=trim($_POST["idPadre"]);

/*
$msg = str_replace("'","''" , $msg);
$nick = str_replace("'","''" , $nick);
$email = str_replace("'","''" , $email);
*/



$host='localhost';
$user='root';
$password='150590';

$connessione= mysql_connect($host,$user,$password) or die("connessione fallita");
//echo "connessione eseguita...";
mysql_select_db("geoblog_admin") or die ("connessione fallita");
//echo "db selezionata";

//$data=date("d/m/Y  H.i.s");
$nuovastringa_sql =mysql_query("INSERT INTO NuoviCommenti (messaggio, quando, nickname, email, codValore, id_padre, daValutare) VALUES ('$msg' , now() , '$nick', '$email' ,'$valore' , $idPadre, 1)");


mysql_close($connessione);
?>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>ANCH'IO - INSERIMENTO COMPLETATO</title>

<link rel="stylesheet" href="util/stile.css" type="text/css">

<script language="javascript" type="text/javascript">
function tornaHome(){
	self.location.replace("spec_cons.php");
}
</script>
</head>

<body onLoad="setTimeout('tornaHome()',10000)">
<div id="main">

	<table border="0" cellpadding="0" cellspacing="0" width="985" bgcolor="#FFFFFF">
			<tr height="60">
            	<td width="955"><img src="img/intestazione.jpg" alt="GEOBLOG ANCH'IO" width="796" height="60"/></td>
        		<td width="30"><img src="img/moeca.gif"/></td>
            </tr>
    </table>
	<div id="div_path">
		<div class="div_link_path">
		<!--<a href="javascript:void(0);" class="link_path" id="aiuto">AIUTO</a>-->
		<a href="javascript:self.location.replace('spec_cons.php');" class="link_path">CONSULTAZIONE</a>
		<!--<a href="javascript:void(0);" class="link_path">PAGINA INIZIALE</a>-->
		<!--<a href="javascript:void(0);" class="link_path">TEMI GENERALI</a>-->
		</div>
	</div>
<table width="600" border="0" cellspacing="0" cellpadding="7">
  <tr>
    <td height="100">
	L'INSERIMENTO E' ANDATO A BUON FINE. PRIMA DI VEDERE IL PROPRIO COMMENTO NELLA PAGINA DI CONSULTAZIONE, BISOGNA ATTENDERE IL CONTROLLO DEI SUPERVISORI,	CHE 
	VERRA' EFFETTUATO ENTRO 24 ORE. GRAZIE
	</td>
  </tr>
  <tr>
    <td height="50">
	<a href="javascript:self.location.replace('spec_cons.php');">TORNA ALLA PAGINA DI CONSULTAZIONE</a>
	</td>
  </tr>
</table>

</div>
</body>

</html>

<?
}
else{
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>ANCH'IO - ERRORE</title>

<script language="javascript" type="text/javascript">
function tornaHome(){
	self.location.replace("spec_cons.php");
}
</script>
</head>

<body onLoad="setTimeout('tornaHome()',1500)">
<table width="200" border="1" cellspacing="0" cellpadding="7" align="center">
  
  <tr>
    <td>
	<font color="#FF0000" size="+6" face="Arial, Helvetica, sans-serif"><strong>ERRORE!!!</strong></font>
	</td>
  </tr>
  <tr>
    <td height="50">
	<a href="spec_cons.php">TORNA HOME</a>
	</td>
  </tr>
</table>
</body>
</html>

<?
}
?>
