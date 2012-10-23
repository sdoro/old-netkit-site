// JavaScript Document
// $Id: funzioni_ins2.js,v 1.1 2008-08-27 21:35:39 doros Exp $

var map, marker, iconaBase;

var coord_corrente, zoom_corrente, center, zm;

var mess_nuvoletta='<div style="width:400px; margin:0px 10px 0px 0px;">Seleziona e trascina l\'icona con il tasto sinistro del mouse per posizionare il segnaluogo, utilizza lo zoom della mappa per avere più precisione.</div>';

function settaIconaBase(){
	iconaBase = new GIcon();
	iconaBase.shadow = "img/ombra_blk.png";
	iconaBase.iconSize = new GSize(23, 34);
	iconaBase.shadowSize = new GSize(34, 34);
	iconaBase.iconAnchor = new GPoint(0, 34);
	iconaBase.infoWindowAnchor = new GPoint(12, 0);
}

function createDraggableMarker(coord, id_tema, id_content, tit){
	var iconaTematica = new GIcon(iconaBase);
	iconaTematica.image="img/"+id_tema+"_"+id_content+".png";

	var draggableMarker = new GMarker(coord, {draggable:true, icon:iconaTematica, title:tit, bouncy:false});
	
	GEvent.addListener(draggableMarker, "dragstart", function() {  draggableMarker.closeInfoWindow();  });
	
	GEvent.addListener(draggableMarker, "dragend", function(){
		draggableMarker.openInfoWindowHtml(mess_nuvoletta);
		coord_corrente = draggableMarker.getLatLng();
		aggiorna();
	});
	
	return draggableMarker;
}

function aggiorna(){
	document.formNew.coordinate.value=coord_corrente;
	document.formNew.zoom.value=zoom_corrente;
}

function indietro(){
	self.location.replace("spec_cons.php");
}
