
<?

if ($_POST["SI"]==1)
{

	

	$messaggio=trim($_POST["messaggio"]);
	$nick=trim($_POST["nick"]);
	$email=trim($_POST["email"]);
	$titolo=trim($_POST["titolo"]);
	$cod_tema=trim($_POST["cod_tema"]);
	$cod_contenuto=trim($_POST["cod_contenuto"]);
	$cod_luogo=trim($_POST["cod_luogo"]);
	
	
	$host='localhost';
	$user='root';
	$password='150590';

	
	$connessione1= mysql_connect($host,$user,$password) or die("connessione fallita");

	mysql_select_db("urban") or die ("connessione fallita");



	$stringa_sqla =mysql_query("select Luoghi.GLatLng, Luoghi.zoom, Luoghi.desc FROM Luoghi WHERE (id=$cod_luogo)");
	$linea3=mysql_fetch_array($stringa_sqla);


	$coordinate= $linea3 ["GLatLng"];
	$zoom= $linea3 ["zoom"];
	$descL= $linea3 ["desc"];

	$cgs=$coordinate;						//Inserisco in $cgs i valori della colonna GlatLng
		

	list ($lat, $lon) = split ('[,]', $cgs);	//Divido in 2 $cgs sulla virgola, e ne creo due 		   variabile
			
	      

	$stringa_sqla=mysql_query("SELECT Temi.desc FROM Temi WHERE (id=$cod_tema)");   
	$linea4= mysql_fetch_array($stringa_sqla);

	$descT= $linea4["desc"];


	
	$stringa_sqla=mysql_query("SELECT Contenuti.desc FROM Contenuti WHERE (id=$cod_contenuto)");
	$linea5= mysql_fetch_array($stringa_sqla);
	$descC=  $linea5["desc"];


?>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>ANCH'IO - AGGIUNTA NUOVO SEGNALUOGO 2</title>

<link rel="stylesheet" href="util/stile.css" type="text/css">

<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAdQXG59Zx0dhMnWREPWAdbhSvBYt3XJnTzPBn6qKZNWJEn_RWwhT6lM7MjKuZJePIIMI3xI1b9I1b8A" type="text/javascript"></script>
<script language="javascript" type="text/javascript" src="util/funzioni_ins2.js"></script>

<script type="text/javascript">

//<![CDATA[
function load() {
      if (GBrowserIsCompatible()) {
		map = new GMap2(document.getElementById("mappa"));

		zm=<?=$zoom ?>;
		center = new GLatLng(<?=$lat?>, <?=$lon?>);

		map.addControl(new GLargeMapControl());
		map.addControl(new GMapTypeControl());
		if(zm>17) zm=17;
		map.setCenter(center, zm);
		map.setMapType(G_HYBRID_MAP);
		keyHandler= new GKeyboardHandler(map);
		map.enableScrollWheelZoom();
		map.enableGoogleBar();

		coord_corrente=map.getCenter();
		zoom_corrente=zm;
		aggiorna();

		GEvent.addListener(map, "zoomend", function() {
			zoom_corrente = map.getZoom();
			aggiorna();
		});

		settaIconaBase();

		nTema=<?=$cod_tema ?>;
		nContenuto=<?=$cod_contenuto ?>;
		titolo="<?=$titolo ?>";

		marker= createDraggableMarker(map.getCenter(), nTema, nContenuto, titolo);
		map.addOverlay(marker);
		marker.openInfoWindowHtml(mess_nuvoletta);
	 }
}


</script>

</head>

<body onload="load()" onunload="GUnload()">

<div id="main">

	<table border="0" cellpadding="0" cellspacing="0" width="985" bgcolor="#FFFFFF">
			<tr height="60">
            	<td width="955"><img src="img/intestazione.jpg" alt="GEOBLOG ANCH'IO" width="796" height="60"/></td>
        		<td width="30"><img src="img/moeca.gif"/></td>
            </tr>
    </table>
	<div id="div_path"></div>

	<div id="div_menu_sx">
	<table width="197" border="0" cellpadding="0" cellspacing="0">
  		<tr>
    		<td valign="top">
			<div class="scelte_menu_sx">
			<table border="0" cellpadding="0" cellspacing="0" width="190">
				<tr height="22" bgcolor="#ccd2ea">
					<td width="190"><div class="titolo_menu_sx_ins">DATI INSERITI</div></td>
				</tr>
				<tr height="22">
					<td width="190"><div class="dati_menu_sx_ins"><?=$nick ?></div></td>
				</tr>
				<tr height="22">
					<td width="190"><div class="dati_menu_sx_ins"><?=$email ?></div></td>
				</tr>
				<tr height="22">
					<td width="190"><div class="dati_menu_sx_ins"><?=$titolo ?></div></td>
				</tr>
				<tr height="22">
					<td width="190"><div class="dati_menu_sx_ins"><?=$messaggio ?></div></td>
				</tr>
				<tr height="26">
					<td width="190" valign="bottom"><div class="dati_menu_sx_ins"><?=$descT ?><img src='img/<?="p".$cod_tema.".png"?>' class="ins_simbolo_TC"/></div></td>
				</tr>
				<tr height="22">
					<td width="190" valign="bottom"><div class="dati_menu_sx_ins"><?=$descL ?></div></td>
				</tr>
				<tr height="26">
					<td width="190" valign="middle"><div class="dati_menu_sx_ins"><?=$descC ?></div></td>
				</tr>
			</table>
			</div>
			</td>
  		</tr>
  		<tr>
<form id="formNew" name="formNew" action="spec_ins_engine.php" method="post">
   	 		<td valign="bottom" height="80"><button type="submit" class="btn_menu_sx" onclick="javascript:void(0);">CONFERMA</button></td>
 		</tr>
  		<tr>
    		<td valign="bottom" height="43"><button type="button" id="btn_ins_back" class="btn_menu_sx" onclick="javascript:history.back();">Modifica dati</button></td>
  		</tr>
	</table>
	</div>


	<div id="mappa"></div>

</div>

	<input type="hidden" name="cod_contenuto" id="cod_contenuto" value="<?=$cod_contenuto?>"/>

	<input type="hidden" name="cod_luogo" id="cod_luogo" value="<?=$cod_luogo?>"/>

	<input type="hidden" name="cod_tema" id="cod_tema" value="<?=$cod_tema?>"/>

	<input type="hidden" name="coordinate" id="coordinate"/>

	<input type="hidden" name="zoom" id="zoom"/>

	<input type="hidden" name="titolo" id="titolo" value="<?=$titolo?>"/>

	<input type="hidden" name="messaggio" id="messaggio" value="<?=$messaggio?>"/>

	<input type="hidden" name="nick" id="nick" value="<?=$nick?>"/>

	<input type="hidden" name="email" id="email" value="<?=$email?>"/>

	<input type="hidden" name="EP" id="EP" value="1"/>
</form>
</body>
</html>


<? }
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

<body onload="setTimeout('tornaHome()',1500)">
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
<? }?>
