-- $Id: query2.sql,v 1.1 2005/01/21 09:11:50 doros Exp $

use fgt;

select N_SQUADRA, COGNOME
from SQUADRE, GIOCATORI
where SQUADRE.N_GIOCATORE = GIOCATORI.N_GIOCATORE;

