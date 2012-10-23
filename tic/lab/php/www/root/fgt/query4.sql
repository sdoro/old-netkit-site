-- $Id: query4.sql,v 1.1 2005/01/21 09:12:23 doros Exp $

use fgt;

select S.N_GIOCATORE
from SQUADRE S, PENALITA as P
where S.N_GIOCATORE = P.N_GIOCATORE;

