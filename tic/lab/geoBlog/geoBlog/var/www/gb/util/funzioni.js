// JavaScript Document
// $Id: funzioni.js,v 1.1 2008-08-27 21:34:31 doros Exp $

function haBadwords(stringa){
	var badwords = new Array (' cazzo ',' minchia ',' figa ',' fica ',' mona ',' stronz',' coglion',' troia ',' puttana ',' zoccola ',' mignotta ',' culo ',' sbor ',' dio ',' pompin ',' incula ',' frocio ',' recchione');
		
	stringa=stringa.toLowerCase();
		
	for (var i = 0; i < badwords.length; i++){
      	if (stringa.indexOf(badwords[i]) >= 0) return true;
    }
		
	return false;
}	

function displayOBJ(idOBJ){
	document.getElementById(idOBJ).style.visibility='visible';
	document.getElementById(idOBJ).style.display='block';
}

function hideOBJ(idOBJ){
	document.getElementById(idOBJ).style.visibility='hidden';
	document.getElementById(idOBJ).style.display='none';
}
