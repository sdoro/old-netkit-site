<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>ANCH'IO - AGGIUNTA NUOVO SEGNALUOGO 1</title>
<link rel="stylesheet" href="util/stile.css" type="text/css">

<script language="javascript" type="text/javascript" src="util/funzioni.js"></script>
<script language="javascript" type="text/javascript" src="util/funzioni_ins1.js"></script>
<script language="javascript" type="text/javascript">
	var browserOK=1;
	var help_aperto="";
	
	
	function indietro(){
		self.location.replace("spec_cons.php");
	}
	

	function apriHelp(id_div,N){
		if(help_aperto!=""){
			hideOBJ(help_aperto);
		}
		if(!browserOK){
			document.getElementById("cod_tema").style.display="none";
			document.getElementById("cod_luogo").style.display="none";
			document.getElementById("cod_contenuto").style.display="none";
		}
		if(N==3){
			document.getElementById("cod_tema").style.display="block";
			document.getElementById("cod_luogo").style.display="block";
			document.getElementById("cod_contenuto").style.display="block";
		}
		displayOBJ(id_div);
		document.getElementById("div_tab_help_temi_ins").scrollTop=0;
		help_aperto=id_div.toString();
	}
	
	function chiudiHelp(id_div){
		if(!browserOK){
			document.getElementById("cod_tema").style.display="block";
			document.getElementById("cod_luogo").style.display="block";
			document.getElementById("cod_contenuto").style.display="block";
		}
		hideOBJ(id_div);
		help_aperto="";
	}

	browserUtente=navigator.userAgent.toUpperCase();
	if(browserUtente.indexOf("MSIE")>0){
		browserUtente=browserUtente.substring(browserUtente.indexOf("MSIE")+5,browserUtente.indexOf("MSIE")+9);
		if(browserUtente.indexOf("7")<0){
			browserOK=0;
		}
	}
</script>
</head>

<body>


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
		<a href="spec_cons.php" class="link_path">CONSULTAZIONE</a>
		<a href="javascript:void(0);" class="link_path">PAGINA INIZIALE</a>
		<!--<a href="javascript:void(0);" class="link_path">TEMI GENERALI</a>-->		</div>
	</div>
	
	<div id="div_tab_campi">
	<form id="formNew" name="formNew" method="post" action="spec_ins_2.php" onsubmit="return controlla();">
	
	<div style="width:977px; margin-bottom:5px;"><font size="-1">Questa pagina ti permette, attraverso la compilazione del modulo, di localizzare le tue segnalazioni sulla carta del territorio del Comune di Venezia. Al termine della compilazione dei seguenti campi devi cliccare il pulsante rosso per localizzare il tuo segnale sulla mappa.</font></div>
	<table border="0" cellpadding="0" cellspacing="0" width="977">		
		<tr height="37">
			<td width="352" class="nome_campi_form" colspan="2"><strong>1.</strong> Inserisci il tuo nome e cognome</td>
			<td width="210" class="campi_form"><input type="text" name="nick" id="nick" maxlength="50"></td>
			<td width="415" class="spiega_campi_form">Scrivi il tuo nome e cognome per identificare il tuo intervento</td>
		</tr>
        <tr height="8"><td colspan="4" class="tab_riga_vuota">&nbsp;</td></tr>
		<tr height="37">
			<td width="352" class="nome_campi_form" colspan="2"><strong>2.</strong> Inserisci la tua e-mail*</td>
			<td width="210" class="campi_form"><input type="text" name="email" id="email" maxlength="255"></td>
			<td width="415" class="spiega_campi_form">Compila il campo con il tuo indirizzo e-mail se vuoi ricevere informazioni sul processo di formazione del Piano di Assetto del Territorio o novit&agrave sul Geoblog</td>
		</tr>
        <tr height="8"><td colspan="4" class="tab_riga_vuota">&nbsp;</td></tr>
		<tr height="37">
			<td width="352" class="nome_campi_form" colspan="2"><strong>3.</strong> Dai un titolo alla tua segnalazione</td>
			<td width="210" class="campi_form"><input type="text" name="titolo" id="titolo" maxlength="25"></td>
			<td width="415" class="spiega_campi_form">Attribuisci un titolo significativo al tuo commento allo scopo di far comprendere chiaramente agli altri utenti il tema che tu intendi affrontare</td>
		</tr>
        <tr height="8"><td colspan="4" class="tab_riga_vuota">&nbsp;</td></tr>
		<tr height="37">
			<td width="330" class="nome_campi_form"><strong>4.</strong> Seleziona un tema<a href='javascript:apriHelp("help_temi_ins");'></a></td>
            <td width="22" class="cella_help"><a href='javascript:apriHelp("help_temi_ins");'><img src="img/help.png"/></a></td>
			<td width="210" class="campi_form">
				<select name="cod_tema" id="cod_tema"/>
					<option value="" > - </option>
				<?
										
$host='localhost';
$user='rot';
$password='150590';

$rs= mysql_connect($host,$user,$password) or die("connessione fallita");
mysql_select_db("urban") or die ("connessione fallita");
				
		

				$newstring_sql=mysql_query("SELECT * FROM Temi");
				
				//echo "<select name=\"".$nome."\" class=\"".$class."\">\n";
				
			while($linea= mysql_fetch_array($newstring_sql))
			{
					//echo ('<option value="'.($linea["id"]).'">'.($linea["desc"]).'</option>');
					echo "<option value=\"".$linea["id"]."\">".$linea["desc"]."</option>\n";
				}
				

			

			
			?>
				</select>
			</td>
			<td width="415" class="spiega_campi_form">Seleziona il tema della tua segnalazione</td>
		</tr>
        <tr height="8"><td colspan="4" class="tab_riga_vuota">&nbsp;</td></tr>
		<tr height="37">
			<td width="330" class="nome_campi_form"><strong>5.</strong> Seleziona un luogo</td>
            <td width="22" class="cella_help"><a href='javascript:apriHelp("help_luoghi_ins");'><img src="img/help.png"/></a></td>
			<td width="210" class="campi_form">
				<select name="cod_luogo" id="cod_luogo"/>
					<option value=""> - </option>
				<?



				$newstring_sql =mysql_query("SELECT * FROM Luoghi");
			
				//echo "<select name=\"".$nome."\" class=\"".$class."\">\n";
					
					while($linea= mysql_fetch_array($newstring_sql))
					{
						echo ('<option value="'.($linea["id"]).'">'.($linea["desc"]).'</option>');
						}
			
			?>
				</select>
			</td>
			<td width="415" class="spiega_campi_form">Seleziona una localit&agrave; per facilitare la localizzazione del tuo segnale</td>
		</tr>
        <tr height="8"><td colspan="4" class="tab_riga_vuota">&nbsp;</td></tr>
		<tr height="37">
			<td width="330" class="nome_campi_form"><strong>6.</strong> Definisci il valore della segnalazione</td>
            <td width="22" class="cella_help"><a href='javascript:apriHelp("help_contenuti_ins");'/><img src="img/help.png"/></a></td>
			<td width="210" class="campi_form">
				<select name="cod_contenuto" id="cod_contenuto"/>
					<option value=""> - </option>
				<?
			$newstring_sql =mysql_query("SELECT * FROM Contenuti");
				//echo "<select name=\"".$nome."\" class=\"".$class."\">\n";
					
					while($linea= mysql_fetch_array($newstring_sql))
					{
						echo ('<option value="'.($linea["id"]).'">'.($linea["desc"]).'</option>');
						}
			
			?>
				</select>
			</td>
			<td width="415" class="spiega_campi_form">Seleziona il valore del tuo intervento (risorse, proposte o problemi)</td>
		</tr>
        <tr height="8"><td colspan="4" class="tab_riga_vuota">&nbsp;</td></tr>
		<tr height="125">
			<td width="352" class="nome_campi_form" valign="top" colspan="2">
				<br /><strong>7.</strong> Messaggio<br />
				<div style="font-size:10px; font-style:italic; text-transform:lowercase; margin-left:15px; width:150px;">max 400 caratteri</div>
			</td>
			<td colspan="2" class="campi_form_doppi"><textarea name="messaggio" id="messaggio" rows="6" cols="73"></textarea></td>
		</tr>
		<tr height="8"><td colspan="4" class="tab_riga_vuota">&nbsp;</td></tr>
		<tr height="47">
			<td width="330" class="nome_campi_form"><strong>8.</strong> Localizza il commento sulla mappa</td>
            <td width="22" class="cella_help"><a href='javascript:apriHelp("help_conferma_ins",3);'><img src="img/help.png"/></a></td>
			<td colspan="2" class="campi_form_doppi" valign="middle"><button type="submit" class="btn_form">CONFERMA i dati inseriti e vai alla mappa</button>OPPURE<button type="button" onclick="indietro();" class="btn_form" id="btn_form_back">TORNA INDIETRO</button></td>
		</tr>
	</table>
			<input name="SI" type="hidden" id="SI" value="1"/>
	</form>
	</div>
	<div style="margin:4px 0px 0px 15px; font-size:12px; width:400px;">* L'e-mail inserita NON verr&agrave resa pubblica</div>

</div>

<div id="help_temi_ins" class="div_help_ins">
	<img src="img/close.gif" class="chiudi_help_ins" onclick="javascript:chiudiHelp('help_temi_ins');"/>
	<div id="div_tab_help_temi_ins">
	
	<table id="tab_help_temi_ins" border="0" cellspacing="0" cellpadding="0">
		<tr valign="middle" height="22">
			<td width="22"><img src="img/p1.png" align="absmiddle"/></td>
			<td width="543"><strong>Ambiente e difesa del suolo</strong></td>
		</tr>
		<tr height="30">
			<td width="22">&nbsp;</td>
			<td width="543">Si occupa di raccogliere i contribuiti e i commenti sugli obiettivi e sulle scelte affrontati nel Piano di Assetto del Territorio, soffermandosi su quelli che si incentrano sulla qualit&agrave; di vita per residenti e turisti. Dove si &egrave; gi&agrave; intervenuto in modo incisivo? Dov'&egrave; indispensabile intervenire per l'ambiente e per la difesa del suolo allo scopo di assicurare la vivibilit&agrave; e migliorare l'immagine della citt&agrave;?
			</td>
		</tr>
		<tr valign="middle" height="22">
			<td width="22"><img src="img/p2.png" align="absmiddle"/></td>
			<td width="543"><strong>Paesaggio agrario e storico</strong></td>
		</tr>
		<tr height="30">
			<td width="22">&nbsp;</td>
			<td width="543">Si sofferma sulla salvaguardia e sulla valorizzazione degli aspetti caratteristici del paesaggio (la Laguna, le valli da pesca, le aree agricole della Terraferma) del territorio del Comune di Venezia. Si chiede al cittadino di indicare per quali elementi storici (edifici, parchi e giardini) o per quali luoghi all'interno della propria realt&agrave; ritiene necessaria la tutela o la valorizzazione.
			</td>
		</tr>
		<tr valign="middle" height="22">
			<td width="22"><img src="img/p3.png" align="absmiddle"/></td>
			<td width="543"><strong>Residenza</strong></td>
		</tr>
		<tr height="30">
			<td width="22">&nbsp;</td>
			<td width="543">Vuole coinvolgere i cittadini nelle politiche abitative. Quali zone residenziali presentano una buona qualit&agrave; edilizia? Quali sono quelle pi&ugrave; svantaggiate? Dove sono localizzate le aree edilizie da restaurare e/o da recuperare?
			</td>
		</tr>
		<tr valign="middle" height="22">
			<td width="22"><img src="img/p4.png" align="absmiddle"/></td>
			<td width="543"><strong>Aree produttive</strong></td>
		</tr>
		<tr height="30">
			<td width="22">&nbsp;</td>
			<td width="543">Intende far riflettere i cittadini sulle aree produttive del comune di Venezia. Quali aree produttive rispondono alle esigenze economiche della citt&agrave;? Quali sono da potenziare o da migliorare? Quali zone produttive sono da contenere?
			</td>
		</tr>
		<tr valign="middle" height="22">
			<td width="22"><img src="img/p5.png" align="absmiddle"/></td>
			<td width="543"><strong>Turismo e ricettivit&agrave;</strong></td>
		</tr>
		<tr height="30">
			<td width="22">&nbsp;</td>
			<td width="543">Pone l'attenzione sulle possibili azioni da attuare per valutare il settore turistico. Quali aree con destinazione turistica e ricettiva offrono servizi idonei? Quali sono da migliorare o da potenziare? Quali quelle da qualificare?
			</td>
		</tr>
		<tr valign="middle" height="22">
			<td width="22"><img src="img/p6.png" align="absmiddle"/></td>
			<td width="543"><strong>Servizi</strong></td>
		</tr>
		<tr height="30">
			<td width="22">&nbsp;</td>
			<td width="543">&Egrave; aperta al contributo dei cittadini sulla materia dei servizi pubblici. Comprende la raccolta e lo smaltimento dei rifiuti, il sistema di gestione delle acque, la localizzazione e il funzionamento dei servizi e delle infrastrutture (verde, scuole, poste, cultura e sport, salute...). Come tutto questo pu&ograve; migliorare lo spazio e il tempo della vita quotidiana? Dove e come l'Amministrazione soddisfa gi&agrave; la richiesta dei cittadini? Dove e come l'Amministrazione deve intervenire per migliorare la fruibilit&agrave; del quartiere?
			</td>
		</tr>
		<tr valign="middle" height="22">
			<td width="22"><img src="img/p7.png" align="absmiddle"/></td>
			<td width="543"><strong>Trasporti</strong></td>
		</tr>
		<tr height="30">
			<td width="22">&nbsp;</td>
			<td width="543">Si sofferma sulla questione della mobilit&agrave;, del trasporto pubblico, dei parcheggi, del traffico veicolare, dell'illuminazione e della manutenzione ambientale. Quali aree offrono servizi idonei? In quale aree bisognerebbe migliorare la vivibilit&agrave; e la sicurezza?
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right"><a href="javascript:chiudiHelp('help_temi_ins');">CHIUDI</a>&nbsp;</td>
		</tr>
	</table>
	</div>
</div>

<div id="help_luoghi_ins" class="div_help_ins">
	<img src="img/close.gif" class="chiudi_help_ins" onclick="javascript:chiudiHelp('help_luoghi_ins');"/>
	<div class="div_spiega_help_ins">
	La selezione di un luogo &egrave; di aiuto all'utente nella successiva fase di posizionamento della propria segnalazione.
	Dopo aver dato conferma dei dati inseriti, verr&agrave; visualizzata sulla mappa l'area selezionata, con al centro il segnaluogo da posizionare.
	I luoghi indicati tra le scelte sono: Mestre Carpenedo, Chirignago Zelarino, Aeroporto, Favaro Veneto, Porto Marghera, Venezia, Isole e Lido di Pellestrina.
	<br/>
	<a href="javascript:chiudiHelp('help_luoghi_ins');" style="float:right; margin-bottom:10px;">CHIUDI</a>
	</div>
</div>

<div id="help_contenuti_ins" class="div_help_ins">
	<img src="img/close.gif" class="chiudi_help_ins" onclick="javascript:chiudiHelp('help_contenuti_ins');"/>
	<div class="div_spiega_help_ins">
	&Egrave; possibile assegnare alla propria segnalazione un valore, determinato dal contenuto della stessa. Si pu&ograve; scegliere tra le seguenti opzioni:<br/>
	<img src="img/risorsa.gif"/><strong>&nbsp;RISORSA: </strong>per indicare le aree o gli elementi qualificanti per la propria citt&agrave; che si ritiene debbano essere salvaguardate
	 (aree naturali da proteggere, edifici storici da mantenere, paesaggi storici agricoli e culturali da tutelare etc.) <br/>
	<img src="img/proposta.gif"/><strong>&nbsp;PROPOSTA: </strong>per individuare i luoghi o gli elementi da potenziare (qualificare gli spazi liberi dall'insediamento, migliorare le strutture sportive, potenziare il trasporto pubblico, sviluppare l'attivit&agrave artigianale etc.)<br/>
	<img src="img/problema.gif"/><strong>&nbsp;PROBLEMA: </strong>per segnalare situazioni di degrado urbano (edifici fatiscenti, illuminazione carente, rifiuti abbandonati, assenza di servizi o di aree verdi etc)<br/>
	<br/>
	<a href="javascript:chiudiHelp('help_contenuti_ins');" style="float:right; margin-bottom:10px;">CHIUDI</a>
	</div>
</div>

<div id="help_conferma_ins" class="div_help_ins">
	<img src="img/close.gif" class="chiudi_help_ins" onclick="javascript:chiudiHelp('help_conferma_ins');"/>
	<div class="div_spiega_help_ins">
	Cliccando sul pulsante rosso "CONFERMA I DATI INSERITI E VAI ALLA MAPPA", si accede alla seconda fase di posizionamento del segnaluogo sulla mappa.
	&Egrave; consigliabile controllare i dati inseriti prima di proseguire.<br/>
	Cliccando sul pulsante blu "TORNA INDIETRO", si torna alla pagina di consultazione di tutte le segnalazioni inserite.<br/>
	<strong>NOTA BENE: se si sceglie di tornare indietro si perderanno tutti i valori inseriti!</strong>
	<br/>
	<a href="javascript:chiudiHelp('help_conferma_ins');" style="float:right; margin-bottom:10px;">CHIUDI</a>
	</div>
</div>

</body>
</html>
