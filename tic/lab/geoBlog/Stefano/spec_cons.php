

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>ANCH'IO - CONSULTAZIONE DELLE SEGNALAZIONI</title>

<link rel="stylesheet" href="util/stile.css" type="text/css">

<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAdQXG59Zx0dhMnWREPWAdbhSvBYt3XJnTzPBn6qKZNWJEn_RWwhT6lM7MjKuZJePIIMI3xI1b9I1b8A" type="text/javascript"></script>
<script language="javascript" type="text/javascript" src="util/funzioni.js"></script> 
<script language="javascript" type="text/javascript" src="util/funzioni_cons.js"></script>  
<script type="text/javascript">
	
var help_aperto="";

function estraiMessaggi(){
//---- Estrae i segnalini dal DB e li genera sulla mappa, li filtra in base al tema e luogo scelto (se entrambi sono 0 li estrae tutti)
		
	    index_RS=0;	
		<?php 
//http://www.tic.fdns.net/tic/html/uml-php.html

$host='localhost';
$user='root';
$password='150590';

$rs= mysql_connect($host,$user,$password) or die("connessione fallita");
mysql_select_db("urban") or die ("connessione fallita");

$stringa_sql =mysql_query("select Messaggi.*, Luoghi.desc AS descL, Temi.desc AS descT, Contenuti.desc AS descC FROM Contenuti INNER JOIN (Temi INNER JOIN (Luoghi INNER JOIN Messaggi ON Luoghi.id = Messaggi.codLuogo) ON Temi.id = Messaggi.codTema) ON Contenuti.id = Messaggi.codContenuto");

	while($linea= mysql_fetch_array($stringa_sql))			//Inserisco la query in $linea. con un while() per avere tutte le righe									
	{
	
		$cgs=$linea["GLatLng"];								//Inserisco in $cgs i valori della colonna GlatLng
			$cgs=str_replace("(", "", $cgs);				//tramite la funzione str_replace elimino le parentesi dalle coordinate dei Luoghi
			$cgs=str_replace( ")", "",$cgs);
			list ($lat_m, $lon_m) = split ('[,]', $cgs);	//Divido in 2 $cgs sulla virgola, e ne creo due variabile
		?>
		
		point = new GLatLng (<?=$lat_m?>, <?=$lon_m?>);

		id =<?=$linea["id"]?>;
		
		<?
						
		$testo=$linea["messaggio"];							//estraggo un messaggio e lo inserisco in $testo
		$parole=(list () = split ('[ ]', $testo));		//divido $testo negli spazi, in modo da avere singole parole e le
															//inserisco nell'array parole
		$testo="";											//svuoto $testo
		foreach ($parole as $parola)						//creo un ciclo che mi scorra il vettore
			{
				$testo=$testo." ".$parola;					//ricompongo il testo parola per parola aggiungendo gli spazi
				$att+=strlen($parola); 						//monitorizzo la lunghezza della riga
				if ($att>=80)								//se la lunghezza attuale è maggiore o uguale a 80 caratteri
				{											
					$testo.="<br/>"; 	 					//vado a capo
					$att=0; 								//ritorno a capo riga
				}
			}
				
?>
		
		titolo="<?=($linea["titolo"])?>";
		msg="<?=$testo?> ";
		zm=<?=($linea["zoom"])?>;
		luogo="<?=($linea["descL"])?>";
		tema="<?=($linea["descT"])?>";
		nick="<?=($linea["nickname"])?>";
		contenuto="<?=($linea["descC"])?>";
		n_tema=<?=($linea["codTema"])?>;
		n_contenuto=<?=($linea["codContenuto"])?>;
		
		commenti=new Array();
		nCommenti=0;

<?


$rc= mysql_connect($host,$user,$password) or die("connessione fallita");
mysql_select_db("urban") or die ("connessione fallita");
	
	$id = $linea["id"];

$stringa_sql2 =mysql_query("Select messaggio, quando, nickname, id_padre,codValore, Valori.desc AS descV 
FROM Valori INNER JOIN Commenti ON Valori.valore = Commenti.codValore WHERE ((Commenti.id_padre)=$id) ORDER BY Commenti.quando");

	while($linea2=mysql_fetch_array($stringa_sql2))
	{
	
?>
	commenti[nCommenti]=new Array("<?=($linea2["nickname"])?>",
	"<?=($linea2["messaggio"])?>","<?=($linea2["quando"])?>","<?=($linea2["descV"])?>","<?=($linea2["codValore"])?>");
			
			id_padre=<?=($linea2["id_padre"])?>;
			nCommenti++;
<?
	}	
?>
		
		map.addOverlay(creaMarker(id, point, zm, msg, titolo, nick, luogo, tema, contenuto, n_tema, n_contenuto, commenti, nCommenti));
		
		index_RS++;
		
<? 
  	}
?>
	
	
}

function settaArrayMarkers(){
<? 		
	$rt= mysql_connect($host,$user,$password) or die("connessione fallita");
	mysql_select_db("urban") or die ("connessione fallita");

	$stringa_sql4 =mysql_query("Select Count(*) as nTemi from Temi");
	$linea4a=mysql_fetch_array($stringa_sql4);
?>
		
	numTemi=<?=($linea4a["nTemi"])?>;
	
	
	for(i=0; i<=numTemi; i++)
		arrayMarkers[i] = new Array();
}

function settaArrayLuoghi(c_inizio, z_inizio){
	arrayLuoghi[0]=new Array();
	arrayLuoghi[0]["coord"]= c_inizio;
	arrayLuoghi[0]["zoom"]= z_inizio;
	
	<?
	$i_luoghi=1;

	$rl= mysql_connect($host,$user,$password) or die("connessione fallita");

	mysql_select_db("urban") or die ("connessione fallita");

	$stringa_sql5 =mysql_query("select GLatLng,zoom FROM Luoghi");

	while($linea5= mysql_fetch_array($stringa_sql5))			//Inserisco la query in $linea. con un while() per avere tutte le righe									
	{
		$cgsL=$linea5["GLatLng"];								//Inserisco in $cgs i valori della colonna GlatLng
			$cgsL=str_replace( "(", "" , $cgsL);				//tramite la funzione str_replace elimino le parentesi dalle coordinate dei Luoghi
			$cgsL=str_replace( ")", "" , $cgsL);
			list ($lat_L, $lon_L) = split ('[,]', $cgsL);		//Divido in 2 $cgsL sulla virgola, e ne creo due variabile
			$zoomL=$linea5["zoom"];
							
		

	?>
		pointL= new GLatLng(<?=$lat_L?>, <?=$lon_L?>);
		zL=<?=$zoomL?>;
		arrayLuoghi[<?=$i_luoghi?>]=new Array();
		arrayLuoghi[<?=$i_luoghi?>]["coord"]=pointL;
		arrayLuoghi[<?=$i_luoghi?>]["zoom"]=zL;
	<?
	$i_luoghi=$i_luoghi+1;
	
	}
	
	?>
}

function apriHelp(id_div,N){

	if(help_aperto!=""){
		hideOBJ(help_aperto);
	}
	displayOBJ(id_div);
	document.getElementById("div_tab_help_temi").scrollTop=0;
	help_aperto=id_div.toString();
}
	
function chiudiHelp(id_div){
	hideOBJ(id_div);
	help_aperto="";
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
	<div id="div_path">
		<div class="div_link_path">
		<!--<a href="javascript:void(0);" class="link_path" id="aiuto">AIUTO</a>-->
		<a href="spec_ins_1.php" class="link_path">INSERIMENTO</a>
		<a href="javascript:void(0);" class="link_path">PAGINA INIZIALE</a>
		<!--<a href="javascript:void(0);" class="link_path">TEMI GENERALI</a>-->		</div>
	</div>


	<div id="div_menu_sx">
	<table width="197" height="519" border="0" cellpadding="0" cellspacing="0">
  		<tr>
    		<td valign="top" height="176">
			<div class="scelte_menu_sx">
			<table border="0" cellpadding="0" cellspacing="0" width="190">
				<tr height="22" bgcolor="#ccd2ea">
					<td width="172"><a href="javascript:filtraMarker(0);" class="titolo_menu_sx" id="T0">I TEMI DEL PIANO</a></td>
					<td width="18"><a href=javascript:apriHelp("help_temi")><img src="img/help.png"/></a></td>
				</tr>
				<tr height="21">
					<td colspan="2"><a href="javascript:filtraMarker(1);" class="scelta_menu_sx" id="T1"><img src="img/p1.png" id="T1_img"/>&nbsp;Ambiente</a></td>
				</tr>
				<tr height="21">					
					<td colspan="2"><a href="javascript:filtraMarker(2);" class="scelta_menu_sx" id="T2"><img src="img/p2.png" id="T2_img"/>&nbsp;Paesaggio</a></td>
				</tr>
				<tr height="21">
					<td colspan="2"><a href="javascript:filtraMarker(3);" class="scelta_menu_sx" id="T3"><img src="img/p3.png" id="T3_img"/>&nbsp;Residenza</a></td>
				</tr>
				<tr height="21">
					<td colspan="2"><a href="javascript:filtraMarker(4);" class="scelta_menu_sx" id="T4"><img src="img/p4.png" id="T4_img"/>&nbsp;Aree produttive</a></td>
				</tr>
				<tr height="21">
					<td colspan="2"><a href="javascript:filtraMarker(5);" class="scelta_menu_sx" id="T5"><img src="img/p5.png" id="T5_img"/>&nbsp;Turismo-Ricettivit&agrave;</a></td>
				</tr>
				<tr height="21">
					<td colspan="2"><a href="javascript:filtraMarker(6);" class="scelta_menu_sx" id="T6"><img src="img/p6.png" id="T6_img"/>&nbsp;Servizi</a></td>
				</tr>
				<tr height="21">
					<td colspan="2"><a href="javascript:filtraMarker(7);" class="scelta_menu_sx" id="T7"><img src="img/p7.png" id="T7_img"/>&nbsp;Trasporti</a></td>
				</tr>
			</table>
			</div>			</td>
  		</tr>
  		<tr>
    		<td valign="top" height="220">
			<div class="scelte_menu_sx">
			<table border="0" cellpadding="0" cellspacing="0" width="190">
				<tr height="22" bgcolor="#ccd2ea">
					<td width="172"><a href="javascript:cambiaLuogo(0);" class="titolo_menu_sx">LUOGHI</a></td>
					<td width="18"><a href=javascript:apriHelp("help_luoghi")><img src="img/help.png"</a></td>
				</tr>
				<tr height="21">
					<td colspan="2"><a href="javascript:cambiaLuogo(1);" class="scelta_menu_sx"><img src="img/pL.png"/>&nbsp;Mestre Carpenedo</a></td>
				</tr>
				<tr height="21">					
					<td colspan="2"><a href="javascript:cambiaLuogo(2);" class="scelta_menu_sx"><img src="img/pL.png"/>&nbsp;Chirignago Zelarino</a></td>
				</tr>
				<tr height="21">
					<td colspan="2"><a href="javascript:cambiaLuogo(3);" class="scelta_menu_sx"><img src="img/pL.png"/>&nbsp;Aeroporto</a></td>
				</tr>
				<tr height="21">
					<td colspan="2"><a href="javascript:cambiaLuogo(4);" class="scelta_menu_sx"><img src="img/pL.png"/>&nbsp;Favaro Veneto</a></td>
				</tr>
				<tr height="21">
					<td colspan="2"><a href="javascript:cambiaLuogo(5);" class="scelta_menu_sx"><img src="img/pL.png"/>&nbsp;Marghera</a></td>
				</tr>
				<tr height="21">
					<td colspan="2"><a href="javascript:cambiaLuogo(6);" class="scelta_menu_sx"><img src="img/pL.png"/>&nbsp;Porto Marghera</a></td>
				</tr>
				<tr height="21">
					<td colspan="2"><a href="javascript:cambiaLuogo(7);" class="scelta_menu_sx"><img src="img/pL.png"/>&nbsp;Venezia</a></td>
				</tr>
				<tr height="21">
					<td colspan="2"><a href="javascript:cambiaLuogo(8);" class="scelta_menu_sx"><img src="img/pL.png"/>&nbsp;Isole</a></td>
				</tr>
				<tr height="21">
					<td colspan="2"><a href="javascript:cambiaLuogo(9);" class="scelta_menu_sx"><img src="img/pL.png"/>&nbsp;Lido Pellestrina</a></td>
				</tr>
			</table>
			</div>			</td>
  		</tr>
  		<tr>
   	 		<td valign="top" height="80"><button type="button" class="btn_menu_sx" onclick="javascript:addM()">Nuovo&nbsp;segnaluogo</button></td>
 		</tr>
  		<tr>
    		<td valign="top" height="39">&nbsp;</td>
  		</tr>
	</table>
	</div>
	
	
	<div id="mappa"></div>
</div>


<div id="help_temi" class="div_help">
	<img src="img/close.gif" class="chiudi_help" onclick="javascript:chiudiHelp('help_temi');"/>
	<div class="div_spiega_help">
		Attraverso questo strumento l'utente ha la possibilit&agrave di consultare i segnaluoghi, cio&egrave; i commenti localizzati sulla mappa tramite un segnale.
		Premendo i pulsanti che descrivono i diversi temi (Ambiente, Paesaggio, Residenza, Aree produttive, Turismo e ricettivit&agrave;, Trasporti), l'utente ha
		la possibilit&agrave; di visualizzare i segnaluoghi per temi. Premendo il pulsante Temi l'utente riattiva sulla mappa tutti i segnaluoghi.
	</div>
	<div id="div_tab_help_temi">
	<table id="tab_help_temi" border="0" cellspacing="0" cellpadding="0">
		<tr valign="middle" height="22">
			<td width="22"><img src="img/p1.png" align="absmiddle"/></td>
			<td width="709"><strong>Ambiente e difesa del suolo</strong></td>
		</tr>
		<tr height="30">
			<td width="22">&nbsp;</td>
			<td width="709">Si occupa di raccogliere i contribuiti e i commenti sugli obiettivi e sulle scelte affrontati nel Piano di Assetto del Territorio, soffermandosi su quelli che si incentrano sulla qualit&agrave; di vita per residenti e turisti. Dove si &egrave; gi&agrave; intervenuto in modo incisivo? Dov'&egrave; indispensabile intervenire per l'ambiente e per la difesa del suolo allo scopo di assicurare la vivibilit&agrave; e migliorare l'immagine della citt&agrave;?
			</td>
		</tr>
		<tr valign="middle" height="22">
			<td width="22"><img src="img/p2.png" align="absmiddle"/></td>
			<td width="709"><strong>Paesaggio agrario e storico</strong></td>
		</tr>
		<tr height="30">
			<td width="22">&nbsp;</td>
			<td width="709">Si sofferma sulla salvaguardia e sulla valorizzazione degli aspetti caratteristici del paesaggio (la Laguna, le valli da pesca, le aree agricole della Terraferma) del territorio del Comune di Venezia. Si chiede al cittadino di indicare per quali elementi storici (edifici, parchi e giardini) o per quali luoghi all'interno della propria realt&agrave; ritiene necessaria la tutela o la valorizzazione.
			</td>
		</tr>
		<tr valign="middle" height="22">
			<td width="22"><img src="img/p3.png" align="absmiddle"/></td>
			<td width="709"><strong>Residenza</strong></td>
		</tr>
		<tr height="30">
			<td width="22">&nbsp;</td>
			<td width="709">Vuole coinvolgere i cittadini nelle politiche abitative. Quali zone residenziali presentano una buona qualit&agrave; edilizia? Quali sono quelle pi&ugrave; svantaggiate? Dove sono localizzate le aree edilizie da restaurare e/o da recuperare?
			</td>
		</tr>
		<tr valign="middle" height="22">
			<td width="22"><img src="img/p4.png" align="absmiddle"/></td>
			<td width="709"><strong>Aree produttive</strong></td>
		</tr>
		<tr height="30">
			<td width="22">&nbsp;</td>
			<td width="709">Intende far riflettere i cittadini sulle aree produttive del comune di Venezia. Quali aree produttive rispondono alle esigenze economiche della citt&agrave;? Quali sono da potenziare o da migliorare? Quali zone produttive sono da contenere?
			</td>
		</tr>
		<tr valign="middle" height="22">
			<td width="22"><img src="img/p5.png" align="absmiddle"/></td>
			<td width="709"><strong>Turismo e ricettivit&agrave;</strong></td>
		</tr>
		<tr height="30">
			<td width="22">&nbsp;</td>
			<td width="709">Pone l'attenzione sulle possibili azioni da attuare per valutare il settore turistico. Quali aree con destinazione turistica e ricettiva offrono servizi idonei? Quali sono da migliorare o da potenziare? Quali quelle da qualificare?
			</td>
		</tr>
		<tr valign="middle" height="22">
			<td width="22"><img src="img/p6.png" align="absmiddle"/></td>
			<td width="709"><strong>Servizi</strong></td>
		</tr>
		<tr height="30">
			<td width="22">&nbsp;</td>
			<td width="709">&Egrave; aperta al contributo dei cittadini sulla materia dei servizi pubblici. Comprende la raccolta e lo smaltimento dei rifiuti, il sistema di gestione delle acque, la localizzazione e il funzionamento dei servizi e delle infrastrutture (verde, scuole, poste, cultura e sport, salute...). Come tutto questo pu&ograve; migliorare lo spazio e il tempo della vita quotidiana? Dove e come l'Amministrazione soddisfa gi&agrave; la richiesta dei cittadini? Dove e come l'Amministrazione deve intervenire per migliorare la fruibilit&agrave; del quartiere?
			</td>
		</tr>
		<tr valign="middle" height="22">
			<td width="22"><img src="img/p7.png" align="absmiddle"/></td>
			<td width="709"><strong>Trasporti</strong></td>
		</tr>
		<tr height="30">
			<td width="22">&nbsp;</td>
			<td width="709">Si sofferma sulla questione della mobilit&agrave;, del trasporto pubblico, dei parcheggi, del traffico veicolare, dell'illuminazione e della manutenzione ambientale. Quali aree offrono servizi idonei? In quale aree bisognerebbe migliorare la vivibilit&agrave; e la sicurezza?
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right"><a href="javascript:chiudiHelp('help_temi');">CHIUDI</a>&nbsp;</td>
		</tr>
	</table>
	</div>
</div>

<div id="help_luoghi" class="div_help">
	<img src="img/close.gif" class="chiudi_help" onclick="javascript:chiudiHelp('help_luoghi');"/>
	<div class="div_spiega_help">
		Premendo i pulsanti del pannello "Luoghi", la mappa si sposter&agrave verso la localit&agrave indicata sui "tasti". I luoghi indicati su questo pannello sono: Mestre Carpenedo, 
		Chirignago Zelarino, Aeroporto, Favaro Veneto, Porto Marghera, Venezia, Isole e Lido di Pellestrina. Selezionando il pulsante Luoghi la mappa torna alla 
		posizione di partenza.
		<br/>
		<a href="javascript:chiudiHelp('help_luoghi');" style="float:right; margin-bottom:10px;">CHIUDI</a>
	</div>
</div>


<div id="div_ins_commento">
	<img src="img/close.gif" class="chiudi_comm" onclick="javascript:closeFormComm();"/>
	<form id="commIns" name="commIns" method="post" action="spec_ins_engine.php" onsubmit="return controlla();">
	<table id="tab_ins_comm" border="0" cellspacing="0" cellpadding="0" width="500">
		<tr>
			<td width="130" align="left" class="tab_ins_comm_label">Nome e cognome:</td>
			<td align="left"><input type="text" maxlength="50" name="nick" id="nick" /></td>
		</tr>
		<tr>
			<td align="left" class="tab_ins_comm_label">e-mail:</td>
			<td align="left"><input type="text" maxlength="255" name="email" id="email" /></td>
		</tr>
		<tr>
			<td align="left" valign="top" class="tab_ins_comm_label">Messaggio:</td>
			<td align="left"><textarea name="messaggio" id="messaggio" rows="4" cols="36"></textarea></td>
		</tr>
		<tr>
			<td align="left" class="tab_ins_comm_label">Come ti poni:</td>
			<td align="left"><select name="valore" id="valore">
					<option value="-1">contrario</option>
					<option value="0">indifferente</option>
					<option value="1">a favore</option>
				</select>
			</td>
		</tr>
		<tr>
			<td align="right" colspan="2">
			<button type="submit" id="btn_submit_comm" name="submit">CONFERMA</button></td>
		</tr>
	<table>
		<input name="EP" type="hidden" id="EP" value="2"/>
		<input name="idPadre" type="hidden" id="idPadre"/>
	</form>	
	
</div>

</body>
</html>
