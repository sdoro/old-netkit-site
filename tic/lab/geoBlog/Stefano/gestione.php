

<?php
if($_GET["operazione"]=="false"){
?> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>ANCH'IO - AMMINISTRAZIONE</title>
</head>

<script language="javascript" type="text/javascript">
	var tab_intestazione, tab_piepagina, form_apertura, form_chiusura;
	
	tab_intestazione='<table border="1" cellpadding="2" cellspacing="0"><tr align="center"><td><strong>id</strong></td><td width="190"><strong>Luogo - Tema - Contenuto</strong></td><td width="160"><strong>GLatLng</strong></td><td><strong>zoom</strong></td><td width="75"><strong>titolo</strong></td><td width="200"><strong>messaggio</strong></td><td width="50"><strong>quando</strong></td><td width="70"><strong>nick</strong></td><td width="70"><strong>email</strong></td><td><strong>daValutare</strong></td><td><strong>nonInseribile</strong></td></tr>';
	
	tab_piepagina='<tr height="25"><td colspan="11" align="right"><button name="btn_aggiorna" type="submit" value="aggiorna"><strong>AGGIORNA</strong></button></td></tr></table>';
	
	form_apertura='<form name="verifica_totale" action="gestione_update_mess.php" method="post">';
	form_chiusura='<input type="hidden" name="op_agg" value="messaggi"/></form>';
	
	function http_obj(){        //crea un oggetto XMLHttpRequest controllando il browser
		var xmlreq = false;
				
		//Controllo il tipo di oggetto XMLHttpRequest da utilizzare
		if(window.XMLHttpRequest){
			//Per browser non Microsoft
			xmlreq = new XMLHttpRequest();
		}else if(window.ActiveXObject){
			//Cerco di creare l'oggetto via MS ActiveX
			try{
				//Nuove versioni per browser IE
				xmlreq = new ActiveXObject("Msxml2.XMLHTTP");
			}catch(e1){ //Errore riscontrato durante la creazione dell'oggetto
				try{
					//Precedenti versioni per browser IE
					xmlreq = new ActiveXObject("Microsoft.XMLHTTP");
				}catch(e2){ //Nuovo errore durante la creazione dell'oggetto
					xmlreq = false;
				}
			}
		}
		//Restituisco l'eventuale oggetto XMLHttpRequest
		return xmlreq;
	}
	
	var http_query=http_obj();
	
	function query_req(tipo_query,pagina){
		s='tipo_query='+tipo_query+'&pagina='+pagina;  //variabile contenente le variabili da passare in post alla pagina destinazione
		http_query.open('post','gestione_engine.php');   //imposta il metodo di richiesta e la pagina di destinazione

		http_query.setRequestHeader('Content-Type','application/x-www-form-urlencoded');  //setta l'header
		http_query.onreadystatechange=risposta;   //imposta la funzione da chiamare quando la pagina scelta &egrave; stata letta
		http_query.send(s);  //esegue la richiesta di aprire la pagina desiderata
		return false;
	}
	
	
	function risposta(){ // Cambiamento Stato
		if (http_query.readyState == 4) { // Caricamento avvenuto
		if (http_query.status == 200) { // con successo
			if(http_query.responseText!="")   //riempio il div con il risultato
				document.getElementById("div_tabella").innerHTML=form_apertura+tab_intestazione+http_query.responseText+tab_piepagina+form_chiusura;
			else
				document.getElementById("div_tabella").innerHTML=tab_intestazione+'<tr height="25"><td colspan="11" align="center">Nessun risultato!</td></tr>'+tab_piepagina;
		} else {
			alert("Errore: "+http_query.status+" "+http_query.statusText);
		}
		}
	}
	
	function select_req(){
		str_op=document.getElementById("operazioni").value.toString();
		str_pag=document.getElementById("pagina").value.toString();
		return query_req(str_op,str_pag);
	}
</script>

<body onLoad="query_req(2,'messaggi');" style="font-family:Arial, Helvetica, sans-serif; font-size:14px;">
<br/>
<form name="modifica_tab" action="" method="post" onSubmit="return select_req();">
CHE MESSAGGI VUOI VISIONARE? &nbsp;&nbsp;&nbsp;
<select name="operazioni" id="operazioni" onChange="select_req();">
	<option value="2">I messaggi "da valutare"</option>
	<option value="3">I messaggi valutati ma "non inseribili"</option>
	<option value="1">Tutti i messaggi presenti</option>
</select>
<input type="hidden" id="pagina" name="pagina" value="messaggi"/>
&nbsp;&nbsp;&nbsp;<button type="submit" value="conferma">VAI!</button>
<a href="gestione.php?operazione=true" style="margin-left:200px;"><strong>CONTROLLA I COMMENTI</strong></a>
</form>
<br/>

<div id="div_tabella"></div>

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
<title>ANCH'IO - AMMINISTRAZIONE</title>
</head>

<script language="javascript" type="text/javascript">
	var tab_intestazione, tab_piepagina, form_apertura, form_chiusura;
	
	tab_intestazione='<table border="1" cellpadding="2" cellspacing="0"><tr align="center"><td><strong>id</strong></td><td width="200"><strong>messaggio</strong></td><td width="50"><strong>quando</strong></td><td width="70"><strong>nick</strong></td><td width="70"><strong>email</strong></td><td width="30"><strong>codValore</strong></td><td width="30"><strong>id padre</strong></td><td><strong>daValutare</strong></td><td><strong>nonInseribile</strong></td></tr>';
	
	tab_piepagina='<tr height="25"><td colspan="11" align="right"><button name="btn_aggiorna" type="submit" value="aggiorna"><strong>AGGIORNA</strong></button></td></tr></table>';
	
	form_apertura='<form name="verifica_totale" action="gestione_update_comm.php" method="post">';
	form_chiusura='<input type="hidden" name="op_agg" value="commenti"/></form>';
	
	function http_obj(){        //crea un oggetto XMLHttpRequest controllando il browser
		var xmlreq = false;
				
		//Controllo il tipo di oggetto XMLHttpRequest da utilizzare
		if(window.XMLHttpRequest){
			//Per browser non Microsoft
			xmlreq = new XMLHttpRequest();
		}else if(window.ActiveXObject){
			//Cerco di creare l'oggetto via MS ActiveX
			try{
				//Nuove versioni per browser IE
				xmlreq = new ActiveXObject("Msxml2.XMLHTTP");
			}catch(e1){ //Errore riscontrato durante la creazione dell'oggetto
				try{
					//Precedenti versioni per browser IE
					xmlreq = new ActiveXObject("Microsoft.XMLHTTP");
				}catch(e2){ //Nuovo errore durante la creazione dell'oggetto
					xmlreq = false;
				}
			}
		}
		//Restituisco l'eventuale oggetto XMLHttpRequest
		return xmlreq;
	}
	
	var http_query=http_obj();
	
	function query_req(tipo_query,pagina){
		s='tipo_query='+tipo_query+'&pagina='+pagina;  //variabile contenente le variabili da passare in post alla pagina destinazione
		http_query.open('post','gestione_engine.php');   //imposta il metodo di richiesta e la pagina di destinazione

		http_query.setRequestHeader('Content-Type','application/x-www-form-urlencoded');  //setta l'header
		http_query.onreadystatechange=risposta;   //imposta la funzione da chiamare quando la pagina scelta &egrave; stata letta
		http_query.send(s);  //esegue la richiesta di aprire la pagina desiderata
		return false;
	}
	
	
	function risposta(){ // Cambiamento Stato
		if (http_query.readyState == 4) { // Caricamento avvenuto
		if (http_query.status == 200) { // con successo
			if(http_query.responseText!="")   //riempio il div con il risultato
				document.getElementById("div_tabella").innerHTML=form_apertura+tab_intestazione+http_query.responseText+tab_piepagina+form_chiusura;
			else
				document.getElementById("div_tabella").innerHTML=tab_intestazione+'<tr height="25"><td colspan="11" align="center">Nessun risultato!</td></tr>'+tab_piepagina;
		} else {
			alert("Errore: "+http_query.status+" "+http_query.statusText);
		}
		}
	}
	
	function select_req(){
		str_op=document.getElementById("operazioni").value.toString();
		str_pag=document.getElementById("pagina").value.toString();
		return query_req(str_op,str_pag);
	}
</script>

<body onLoad="query_req(4,'commenti');" style="font-family:Arial, Helvetica, sans-serif; font-size:14px;">
<br/>
<form name="modifica_tab" action="" method="post" onSubmit="return select_req();">
CHE COMMENTI VUOI VISIONARE? &nbsp;&nbsp;&nbsp;
<select name="operazioni" id="operazioni" onChange="select_req();">
	<option value="4">I commenti "da valutare"</option>
	<option value="5">I commenti valutati ma "non inseribili"</option>
	<option value="6">Tutti i commenti presenti</option>
</select>
<input type="hidden" id="pagina" name="pagina" value="commenti"/>
&nbsp;&nbsp;&nbsp;<button type="submit" value="conferma">VAI!</button>
<a href="gestione.php?operazione=false" style="margin-left:200px;"><strong>CONTROLLA I SEGNALUOGHI</strong></a>
</form>
<br/>

<div id="div_tabella"></div>

</body>
</html>

<?
}
?>
