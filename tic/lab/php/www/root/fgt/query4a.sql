-- $Id: query4a.sql,v 1.1 2005/01/21 09:12:40 doros Exp $

use fgt;

select distinct S.N_GIOCATORE
from SQUADRE S, PENALITA as P
where S.N_GIOCATORE = P.N_GIOCATORE;

