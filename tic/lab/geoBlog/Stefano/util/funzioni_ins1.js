// JavaScript Document

	function controlla(){
		tuttoOK=0;
		
		nick=document.formNew.nick.value;
		email=document.formNew.email.value;
		titolo=document.formNew.titolo.value;
		tema=document.formNew.cod_tema.value;
		luogo=document.formNew.cod_luogo.value;
		contenuto=document.formNew.cod_contenuto.value;
		msg=document.formNew.messaggio.value;
		
		if((nick=="")||(nick== "undefined")){
			alert("Il campo Nome e Cognome è vuoto!");
			document.formNew.nick.focus();
			return false;
		}
		else if(email!=""){
			if((email.indexOf('@')==-1)||(email.indexOf('.')==-1)){
				alert("L'indirizzo e-mail inserito non è corretto!");
				document.formNew.email.focus();
				return false;
			}
		}
		else if((titolo=="")||(titolo== "undefined")){
			alert("Il campo Titolo è vuoto!");
			document.formNew.titolo.focus();
			return false;
		}
		else if((tema=="")||(tema== "undefined")){
			alert("Selezionare un tema!");
			document.formNew.cod_tema.focus();
			return false;
		}
		else if((luogo=="")||(luogo== "undefined")){
			alert("Selezionare un luogo!");
			document.formNew.cod_luogo.focus();
			return false;
		}
		else if((contenuto=="")||(contenuto== "undefined")){
			alert("Selezionare il contenuto!");
			document.formNew.cod_contenuto.focus();
			return false;
		}
		else if((msg=="")||(msg== "undefined")){
			alert("Il campo Messaggio è vuoto!");
			document.formNew.messaggio.focus();
			return false;
		}
		else if(msg.length>400){
			alert("Il testo del messaggio è troppo lungo!");
			document.formNew.messaggio.focus();
			return false;
		}
		
		if (haBadwords(nick)){
         	alert("E' presente una parola proibita nel campo Nome e Cognome");
			document.formNew.nick.focus();
         	return false;
      	}
		else if (haBadwords(email)){
         		alert("E' presente una parola proibita nel campo e-mail");
				document.formNew.email.focus();
         		return false;
      	}
		else if (haBadwords(titolo)){
         		alert("E' presente una parola proibita nel campo Titolo");
				document.formNew.titolo.focus();
         		return false;
      	}
		else if (haBadwords(msg)){
         		alert("E' presente una parola proibita nel campo Messaggio");
				document.formNew.messaggio.focus();
         		return false;
      	}
		
		if(msg.indexOf('\n')!=-1){
			while(msg.indexOf('\n')!=-1){
				msg=msg.replace(/\n/m," ");
				msg=msg.replace(/\r/m," ");
			}
			document.formNew.messaggio.value=msg;
		}
		
		return true;
	}