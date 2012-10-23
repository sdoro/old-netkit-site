// JavaScript Document
// $Id: funzioni_cons.js,v 1.1 2008-08-27 21:34:55 doros Exp $

var map;  //la mappa!
//var gx; //il kml dei confini
var iconaBase;  //classe base per i segnalini
var arrayMarkers=new Array();  //matrice dei segnalini, divisi per tema
var arrayLuoghi=new Array();  //array di coordinate e zoom dei luoghi

var lat = 45.456759219007125;	//latitudine, longitudine e zoom iniziali della mappa
var lng = 12.302284240722656;
var zm = 12;

var i, point, id, msg, titolo, valore, luogo, tema, nick, contenuto, numTemi;
var coord_marker, zoom_marker;



function creaMarker(idMess, coord, z, mess, tit, user, luogo, tema, content, id_tema, id_content, lista_comm, nComm) {
	var iconaTematica = new GIcon(iconaBase);
	iconaTematica.image="img/"+id_tema+"_"+id_content+".png";
	markerOptions = { icon:iconaTematica, title:tit };
  	var marker = new GMarker(coord, markerOptions);
  	marker.value = idMess;
	
	var cerchioTematico="img/cerchi/"+id_tema+"_"+id_content+".png";
	
  	GEvent.addListener(marker, "click", function() {
		zoom_marker=z;
		coord_marker=coord;
		info_msg='<table width="525" cellpadding="0" cellspacing="0" align="left" style="margin:0px 15px 0px 0px; border:1px solid #CCCCCC; font-size:14px;">';
		info_msg=info_msg+'<tr valign="middle" height="23" style="background:#ccd2ea;">';
		info_msg=info_msg+'<td colspan="3" align="left" style="border-bottom:1px solid #CCCCCC; padding:4px;"><strong>'+tit+'</strong></td>';
		
		/*info_msg=info_msg+'<td width="265" align="right" style="border-bottom:1px solid #CCCCCC; padding:4px;"><a href="javascript:void(0);" style="text-decoration:none; color:#000000;">';
			info_msg=info_msg+'ingrandisci&nbsp;<img src="img/lente.gif" border="0" align="absmiddle" alt="Clicca per ingrandire la mappa sul punto preciso del Segnaluogo"/></a></td></tr>';*/
		
		info_msg=info_msg+'<tr height="31" valign="middle" style="background:#F2F2F9;">';
		info_msg=info_msg+'<td width="31" style="border-bottom:1px solid #CCCCCC; padding:4px;"><img src="'+cerchioTematico+'"/></td>';
		info_msg=info_msg+'<td width="229" style="border-bottom:1px solid #CCCCCC; padding:4px;">'+content+' <strong>|</strong> '+tema+'</td>';
		info_msg=info_msg+'<td width="265" align="right" style="border-bottom:1px solid #CCCCCC; padding:4px;"><strong>'+user+'</strong></td></tr>';
		
		info_msg=info_msg+'<tr height="22"><td colspan="3" style="border-bottom:1px solid #CCCCCC; padding:4px;">'+mess+'</td></tr>';
		info_msg=info_msg+'<tr height="10"><td colspan="3" style="background:#FFFFFF; border-bottom:1px solid #CCCCCC; font-size:2px; padding:4px;">&nbsp;</td></tr>';
		
		info_msg=info_msg+'<tr height="32" valign="middle" style="background:#ccd2ea;">';
		info_msg=info_msg+'<td colspan="2" align="left" style="padding:4px;"><strong>Commenti: '+nComm+'</strong></td>';
		info_msg=info_msg+'<td width="265" align="center" style="padding:4px;"><button type="button" onClick="javascript:openFormComm('+idMess+')" style="margin:0px; padding:0px; background:url(img/sfondob_nuovo_commento.jpg); cursor:pointer; color:#FFFFFF; font-size:10px; font-weight:bold; width:200px; height:24px;">AGGIUNGI UN COMMENTO</button></td></tr>';
		info_comm="";
		
		if(nComm!=0){
			info_comm='<tr height="56"><td colspan="3">';
			if(nComm<=3){
				info_comm=info_comm+'<table border="0" cellpadding="0" cellspacing="0">';
				for(k=0;k<nComm;k++){
					info_comm=info_comm+'<tr height="34" valign="middle" style="background:#F2F2F9;">';
					info_comm=info_comm+'<td width="34" style="border-top:1px solid #CCCCCC; padding:4px;"><img src="img/'+lista_comm[k][4]+'_smile.gif"/></td>';
					info_comm=info_comm+'<td width="226" style="border-top:1px solid #CCCCCC; padding:4px;">'+lista_comm[k][3]+'</td>';
					info_comm=info_comm+'<td width="265" align="right" style="border-top:1px solid #CCCCCC; padding:4px;"><strong>'+lista_comm[k][0]+'</strong></td></tr>';
					info_comm=info_comm+'<tr height="22"><td colspan="3" style="border-top:1px solid #CCCCCC; padding:4px;">'+lista_comm[k][1]+'</td></tr>';
				}
				info_comm=info_comm+'</table></td></tr>';
			}
			else{
				info_comm=info_comm+'<div style="overflow:auto; height:243px;"><table border="0" cellpadding="0" cellspacing="0">';
				for(k=0;k<nComm;k++){
					info_comm=info_comm+'<tr height="34" valign="middle" style="background:#F2F2F9;">';
					info_comm=info_comm+'<td width="34" style="border-top:1px solid #CCCCCC; padding:4px;"><img src="img/'+lista_comm[k][4]+'_smile.gif"/></td>';
					info_comm=info_comm+'<td width="216" style="border-top:1px solid #CCCCCC; padding:4px;">'+lista_comm[k][3]+'</td>';
					info_comm=info_comm+'<td width="253" align="right" style="border-top:1px solid #CCCCCC; padding:4px;"><strong>'+lista_comm[k][0]+'</strong></td></tr>';
					info_comm=info_comm+'<tr height="22"><td colspan="3" style="border-top:1px solid #CCCCCC; padding:4px;">'+lista_comm[k][1]+'</td></tr>';
				}
				info_comm=info_comm+'</table></div></td></tr>';
			}
		}
		info_msg=info_msg+info_comm+'</table>';
		
		/*schede= [ new GInfoWindowTab('Segnalazione',info_msg), new GInfoWindowTab('Nuovo Commento','Cucu') ];
		
		windowOptions = { maxContent:"CULO", maxTitle:"OCIO!" };
    	marker.openInfoWindowTabsHtml(schede, windowOptions);
    	marker.openInfoWindowTabsHtml(schede);*/
		marker.openInfoWindowHtml(info_msg);
  	});
	
	GEvent.addListener(marker, "dblclick", function() {
		map.setCenter(coord, z);
	});
	
	GEvent.addListener(marker, "infowindowclose", function() { closeFormComm(); });
	
	pushMarker(marker, id_tema); //aggiungo il nuovo segnalino alla lista
	
 	return marker;
}

function settaIconaBase(){
	iconaBase = new GIcon();
	iconaBase.shadow = "img/ombra_blk.png";
	iconaBase.iconSize = new GSize(23, 34);
	iconaBase.shadowSize = new GSize(34, 34);
	iconaBase.iconAnchor = new GPoint(0, 34);
	iconaBase.infoWindowAnchor = new GPoint(12, 0);
}

function cambiaLuogo(id_L){
	map.setCenter(arrayLuoghi[id_L]["coord"],arrayLuoghi[id_L]["zoom"]);
}

function pushMarker(newMarker, T){
	arrayMarkers[T].push(newMarker);
}

function filtraMarker(T){
	if(T!=0){   //visualizzo i segnalini di una tema in particolare
		map.clearOverlays();                                          //**modifica rispetto originale mettendo prima clearOverlays() elimino tutti i Marker cosi se nn ci dovessere essere Marker di un certo tipo non viene visualizzato nessun Marker sulla mappa
		if(arrayMarkers[T].length!=0){
			 //ripulisco la mappa da segnalini, linee, etc...
			for(i=0; i<arrayMarkers[T].length; i++)
				map.addOverlay(arrayMarkers[T][i]);
		}
	}
	else{		//visualizzo tutti i segnalini
		map.clearOverlays();
		for(i=1; i<=numTemi; i++)
			for(j=0; j<arrayMarkers[i].length; j++)
				map.addOverlay(arrayMarkers[i][j]);
	}
	
	markerGrigi(T);
}

function markerGrigi(id_attivo){
	if(id_attivo!=0){
		document.getElementById("T0").style.color="#999999";
		stile_sel="color:#000000; font-weight:bold;";
		stile_desel="color:#999999; text-decoration:none;";
		id_riga='T'+id_attivo.toString();
		
		for(i=1; i<=numTemi; i++){
			if(i!=id_attivo){
				if(document.all && !window.opera) document.getElementById('T'+i.toString()).style.setAttribute("cssText",stile_desel);
				else document.getElementById('T'+i.toString()).setAttribute("style",stile_desel);
				document.getElementById('T'+i.toString()+'_img').src="img/pG.png";
			}
			else{
				if(document.all && !window.opera) document.getElementById(id_riga).style.setAttribute("cssText",stile_sel);
				else document.getElementById(id_riga).setAttribute("style",stile_sel);
				document.getElementById(id_riga+"_img").src="img/p"+id_attivo.toString()+".png";
			}
		}
	}
	else{
		document.getElementById("T0").style.color="#333333";
		str="color:#333333; text-decoration:none;";
		for(i=1; i<=numTemi; i++){
			if(document.all && !window.opera) document.getElementById('T'+i.toString()).style.setAttribute("cssText",str);
			else document.getElementById('T'+i.toString()).setAttribute("style",str);
			document.getElementById('T'+i.toString()+'_img').src="img/p"+i.toString()+".png";
		}
	}
}

function load() {
      if (GBrowserIsCompatible()) {
        map = new GMap2(document.getElementById("mappa"));
		//gx=new GGeoXml("http://194.243.104.176/website/geoblog/Con_comunale.kml");
		map.setCenter(new GLatLng(lat, lng), zm);
		map.setMapType(G_HYBRID_MAP);    //da fare dopo setCenter
		coord_corrente = new GLatLng(lat, lng);
		zoom_corrente = zm;
        map.addControl(new GLargeMapControl());
		map.addControl(new GMapTypeControl());
		keyHandler= new GKeyboardHandler(map);
		//map.addOverlay(gx);
		map.enableScrollWheelZoom();
		map.enableGoogleBar();
		settaArrayLuoghi(coord_corrente, zoom_corrente);
		
		settaIconaBase();
		settaArrayMarkers();
		
		estraiMessaggi();     
      }
}


function addM(){
	self.location.href="spec_ins_1.php";
}

function closeFormComm(){
	hideOBJ("div_ins_commento");
}

function openFormComm(id_p){
	displayOBJ("div_ins_commento");
	document.commIns.idPadre.value=id_p;
	document.commIns.nick.value="";
	document.commIns.email.value="";
	document.commIns.messaggio.value="";
	document.commIns.valore.value=-1;
	document.commIns.nick.focus();
}

function controlla(){
		nick=document.commIns.nick.value;
		email=document.commIns.email.value;
		msg=document.commIns.messaggio.value;
		
		if((nick=="")||(nick== "undefined")){
			alert("Il campo Nome e Cognome è vuoto!");
			document.commIns.nick.focus();
			return false;
		}
		else if(email!=""){
			if((email.indexOf('@')==-1)||(email.indexOf('.')==-1)){
				alert("L'indirizzo e-mail inserito non è corretto!");
				document.commIns.email.focus();
				return false;
			}
		}
		else if((msg=="")||(msg== "undefined")){
			alert("Il campo Messaggio è vuoto!");
			document.commIns.messaggio.focus();
			return false;
		}
		else if(msg.length>200){
			alert("Il testo del messaggio è troppo lungo!");
			document.commIns.messaggio.focus();
			return false;
		}
		
		
      	if (haBadwords(nick)){
         	alert("E' presente una parola proibita nel campo Nome e Cognome");
			document.commIns.nick.focus();
         	return false;
      	}
		else if (haBadwords(email)){
         	alert("E' presente una parola proibita nel campo e-mail");
			document.commIns.email.focus();
         	return false;
      	}
		else if (haBadwords(msg)){
         	alert("E' presente una parola proibita nel campo Messaggio");
			document.commIns.messaggio.focus();
         	return false;
      	}
		
		if(msg.indexOf('\n')!=-1){
			while(msg.indexOf('\n')!=-1){
				msg=msg.replace(/\n/m," ");
				msg=msg.replace(/\r/m," ");
			}
			document.commIns.messaggio.value=msg;
		}
		
		return true;
}
