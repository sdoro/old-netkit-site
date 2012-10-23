<?php
if ($_POST["op_agg"]=="messaggi")
{
$host='localhost';
$user='rot';
$password='150590';

$rs= mysql_connect($host,$user,$password) or die("connessione fallita");
mysql_select_db("geoblog_admin") or die ("connessione fallita1");



$stringa_sql="";
$arrayID="";

while(list ($k, $valore) = each ($_POST)){


	if ($k[0]=="o" && $k[1]=="l" && $k[2]=="d" && $k[3]=="V" && $k[4]=="a" && $k[5]=="l")
	{	
		$a=strrpos($valore,"oldVal");
		$str_app=split("_",$valore);
		$id=$str_app[0];
		$daValutare_old=$str_app[1];
		$nonInseribile_old=$str_app[2];
		$daValutare_new="";
		$nonInseribile_new="";
		
		if ($_POST["daValutare_".$id]<>"")
		{
			$daValutare_new=1;
		}
		else
		{
			$daValutare_new=0;
		}
		
		if ($_POST["nonInseribile_".$id]<>"")
		{
			$nonInseribile_new=1;
		}		
		else
		{
			$nonInseribile_new=0;
		}
		
		if (($daValutare_new!=$daValutare_old) OR ($nonInseribile_new!=$nonInseribile_old))
		{
			$stringa_sql="UPDATE NuoviMessaggi SET daValutare=".$daValutare_new.", nonInseribile=".$nonInseribile_new." WHERE id=".$id;
			$stringa =mysql_query($stringa_sql);
			if (($daValutare_new==0) AND ($nonInseribile_new==0))
			{
				$arrayID=$arrayID."_".$id;
			}
		}
	
	}
}


$aggiornamento=0;

if ($arrayID!="")
{	
	
	$arrayID=split("_",$arrayID);
	$nElementi=count($arrayID);
	$arrayID[0]="X";
	for($j=1;$j<count($arrayID);$j=$j+1)	
	{
		$stringa="SELECT codLuogo, codTema, codContenuto, GLatLng, zoom, titolo, messaggio, quando, nickname, email FROM NuoviMessaggi WHERE id=".$arrayID[$j];
		$strQueryMess=mysql_query($stringa);
		$linea=mysql_fetch_array($strQueryMess);
		
		$msg=str_replace("'", "''",$linea["messaggio"]);
		$nick=str_replace("'", "''",$linea["nickname"]);
		if ($linea["email"]!="")
		{
			$email=str_replace("'", "''",$linea["email"]);
		}
		$titolo=str_replace("'", "''",$linea["titolo"]);
		mysql_select_db("urban") or die ("connessione fallita2");
		$strQueryIns="INSERT INTO Messaggi (codLuogo, codTema, codContenuto, GLatLng, zoom, titolo, messaggio, quando, nickname, email) VALUES (";
		$strQueryIns=$strQueryIns.$linea["codLuogo"]." , ";
		$strQueryIns=$strQueryIns.$linea["codTema"]." , ";
		$strQueryIns=$strQueryIns.$linea["codContenuto"]." , '";
		$strQueryIns=$strQueryIns.$linea["GLatLng"]."' , '";
		$strQueryIns=$strQueryIns.$linea["zoom"]."' , '";
		$strQueryIns=$strQueryIns.$titolo."' , '";
		$strQueryIns=$strQueryIns.$msg."' , '";
		$strQueryIns=$strQueryIns.$linea["quando"]."' , '";
		$strQueryIns=$strQueryIns.$nick."' , '";
		$strQueryIns=$strQueryIns.$email."')";
		$nuovastringa_sql =mysql_query($strQueryIns);
		mysql_select_db("geoblog_admin") or die ("connessione fallita3");
		$strQueryDelete="DELETE FROM NuoviMessaggi WHERE id=".$arrayID[$j];
		$stringa_sql =mysql_query($strQueryDelete);
		

	}
	mysql_close($rs);
	
	$aggiornamento=1;
}

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>ANCH'IO - RISULTATO</title>
</head>

<body style="font-family:Arial, Helvetica, sans-serif; font-size:14px;">
	<script language="javascript" type="text/javascript">
		//self.location.replace("gestione.php");
		//setTimeout('self.location.replace("gestione.php")',5000);

	</script>
	<table border="1" cellpadding="5">
	<? 
		if ($aggiornamento=1)
		{
			echo "<tr><td>Sono stati trasferiti nel Geoblog ".(count($arrayID)-1)." record</td></tr>";
			for($k=1;$k<count($arrayID);$k=$k+1)
			{
				echo "<tr><td>Id: ".$arrayID[$k]."</td></tr>";
			}
		}
		else
		{
			echo "<tr><td>Nessun record da spostare!</td></tr>";
		}
	?>
	</table>
	<br /><br /><br /><br />
	<a href="gestione.php">TORNA ALLA PAGINA D'AMMINISTRAZIONE</a>
</body>
</html>

<?
}
else
{
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>ANCH'IO - ERRORE</title>

</head>

<body style="font-family:Arial, Helvetica, sans-serif; font-size:14px;">
<table width="500" border="1" cellspacing="0" cellpadding="7">
  
  <tr>
    <td>
	<font color="#FF0000" size="+6" face="Arial, Helvetica, sans-serif"><strong>ERRORE!!!</strong></font>
	</td>
  </tr>
</table>
</body>
</html>

<?}?>
