

<?php

$op_type=$_POST["tipo_query"];

$pagina=$_POST["pagina"];




if ($pagina=="messaggi") 
{
	$host='localhost';
$user='rot';
$password='150590';

$rs= mysql_connect($host,$user,$password) or die("connessione fallita");
mysql_select_db("geoblog_admin") or die ("connessione fallita");
	$stringa_sql="SELECT NuoviMessaggi.*, Luoghi.desc AS descL, Temi.desc AS descT, Contenuti.desc AS descC FROM Contenuti INNER JOIN (Temi INNER JOIN (Luoghi INNER JOIN NuoviMessaggi ON Luoghi.id = NuoviMessaggi.codLuogo) ON Temi.id = NuoviMessaggi.codTema) ON Contenuti.id = NuoviMessaggi.codContenuto ";

	$risposta="";

	 switch($op_type) 
	 {
		case 1:
			$stringa_sql=$stringa_sql." ORDER BY quando";
			break;
		case 2:
			$stringa_sql=$stringa_sql." WHERE (daValutare=true AND nonInseribile=false) ORDER BY quando";
			break;
		case 3:
			$stringa_sql=$stringa_sql." WHERE (daValutare=false AND nonInseribile=true) ORDER BY quando";
			break;
		default:
			$risposta=$risposta." <tr height='25'><td colspan='13' align='center'>1:  ERRORE! ERRORE! L'opzione scelta e' scorretta. Op_type: ".$op_type." Pagina: ".$pagina."</td></tr>";
			echo $risposta;
	}
	$stringa=mysql_query($stringa_sql) or die(mysql_error());
	while($linea=mysql_fetch_array($stringa))	
	{
		$id=$linea["id"];
		$old_val="<input type='hidden' name='oldVal_".$id."' value='".$id;
		
		$risposta=$risposta."<tr>";	
		$risposta=$risposta."<td>".$linea["id"]."</td>";
		$risposta=$risposta."<td>".$linea["descL"]."&nbsp;".$linea["codLuogo"]."<br/>";
		$risposta=$risposta.$linea["descT"]."&nbsp;".$linea["codTema"]."<br/>";	
		$risposta=$risposta.$linea["descC"]."&nbsp;".$linea["codContenuto"]."</td>";
		
		$risposta=$risposta."<td>".$linea["GLatLng"]."</td>";
		$risposta=$risposta."<td>".$linea["zoom"]."</td>";

		$risposta=$risposta."<td>".htmlspecialchars($linea["titolo"])."</td>";
		$risposta=$risposta."<td>".htmlspecialchars($linea["messaggio"])."</td>";
		$risposta=$risposta."<td>".$linea["quando"]."</td>";	
			
		$risposta=$risposta."<td>".htmlspecialchars($linea["nickname"])."</td>";
	
		if ($linea["email"]!="")
		{
			$risposta=$risposta."<td>".htmlspecialchars($linea["email"])."</td>";
		}
		else
		{
			$risposta=$risposta."<td>&nbsp;</td>";
		}
		
		$risposta=$risposta."<td><input type='checkbox' name='daValutare_".$id."' id='daValutare_".$id."' value='".$id."'";
		if ($linea["daValutare"]==1)
		{
   			$risposta=$risposta." checked='checked'/>";
			$old_val=$old_val."_1";
		}
   		else
		{
   			$risposta=$risposta."/>";
			$old_val=$old_val."_0";
	   	}
		
   		$risposta=$risposta."</td><td><input type='checkbox' name='nonInseribile_".$id."' id='nonInseribile_".$id."' value='".$id."'";
		
		if($linea["nonInseribile"]==1) 
		{
   			$risposta=$risposta." checked='checked'/>";
			$old_val=$old_val."_1'/>";
		}
	  	else
		{
   			$risposta=$risposta."/>";
			$old_val=$old_val."_0'/>";
	   	}
	
		$risposta=$risposta.$old_val;
	
	}
		

}
else
{
	if($pagina=="commenti")
	{
		$host='localhost';
$user='rot';
$password='150590';

$rs= mysql_connect($host,$user,$password) or die("connessione fallita");
mysql_select_db("geoblog_admin") or die ("connessione fallita");
		$stringa_sql="SELECT * FROM NuoviCommenti";

		$risposta="";

		switch($op_type) 
		{
			case 6:
				$stringa_sql=$stringa_sql." ORDER BY quando";
				break;
			case 4:
				$stringa_sql=$stringa_sql." WHERE (daValutare=true AND nonInseribile=false) ORDER BY quando";	
				break;
			case 5:
				$stringa_sql=$stringa_sql." WHERE (daValutare=false AND nonInseribile=true) ORDER BY quando";
				break;
			default:
				$risposta=$risposta." <tr height='25'><td colspan='13' align='center'>1:  ERRORE! ERRORE! L'opzione scelta e' scorretta. Op_type: ".$op_type." Pagina: ".$pagina."</td></tr>";
				echo $risposta;
		}
		$stringa =mysql_query($stringa_sql) or die(mysql_error());
		while($linea= mysql_fetch_array($stringa))	
		{
			
			$id=$linea["id"];
			$old_val="<input type='hidden' name='oldVal_".$id."' value='".$id;
			$risposta=$risposta."<tr>";	
			$risposta=$risposta."<td>".$linea["id"]."</td>";
			$risposta=$risposta."<td>".htmlspecialchars($linea["messaggio"])."</td>";
			$risposta=$risposta."<td>".$linea["quando"]."</td>";			
			$risposta=$risposta."<td>".htmlspecialchars($linea["nickname"])."</td>";
	
			if ($linea["email"]!="")
			{
				$risposta=$risposta."<td>".htmlspecialchars($linea["email"])."</td>";
			}
			else
			{
				$risposta=$risposta."<td>&nbsp;</td>";
			}
			$risposta=$risposta."<td>".$linea["codValore"]."</td>";
			$risposta=$risposta."<td>".$linea["id_padre"]."</td>";

			$risposta=$risposta."<td><input type='checkbox' name='daValutare_".$id."' id='daValutare_".$id."' value='".$id."'";
			if ($linea["daValutare"]==1)
			{
   				$risposta=$risposta." checked='checked'/>";
				$old_val=$old_val."_1";
			}
   			else
			{
   				$risposta=$risposta."/>";
				$old_val=$old_val."_0";
		   	}
			$risposta=$risposta."</td><td><input type='checkbox' name='nonInseribile_".$id."' id='nonInseribile_".$id."' value='".$id."'";
		
			if($linea["nonInseribile"]==1) 
			{
   				$risposta=$risposta." checked='checked'/>";
				$old_val=$old_val."_1'/>";
			}
		  	else
			{
   				$risposta=$risposta."/>";
				$old_val=$old_val."_0'/>";
		   	}
		
			$risposta=$risposta.$old_val;
		}
	}
	else
	{
		$risposta=$risposta."<tr height='25'><td colspan='13' align='center'>3:  ERRORE! ERRORE! L'opzione scelta e' scorretta</td></tr>";
		echo $risposta;
		
	}
}
echo $risposta;
?>
