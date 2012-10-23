-- $Id: query1.sql,v 1.1 2005/01/21 09:11:38 doros Exp $

use fgt;

select N_GIOCATORE, COGNOME, DATA_NASCITA
from GIOCATORI
where CITTA='Torino'
order by COGNOME;

