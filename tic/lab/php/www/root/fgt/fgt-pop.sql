-- $Id: fgt-pop.sql,v 1.1 2005/01/21 09:11:08 doros Exp $

use fgt;

insert into GIOCATORI values (
  15, 'Bianchi', 'B.', '1980-12-01', 'M', '1998-01-01',
  'via neri', '3' , '10170', 'Torino', '', '');

insert into GIOCATORI values (
  8, 'Verdi', 'V.', '1982-03-21', 'M', '2001-11-01',
  'via bianchi', '4' , '36170', 'Torino', '', '');

insert into GIOCATORI values (
  2, 'Rossi', 'R.', '1986-10-04', 'M', '1995-02-01',
  'via gialli', '5/2' , '60170', 'Torino', '', '');


insert into GIOCATORI values (
  3, 'Parmegiani', 'R.', '1985-03-21', 'M', '1990-11-01',
  'via gialli', '5/2' , '60170', 'Torino', '', '');


insert into GIOCATORI values (
  4, 'Baggio', 'R.', '1968-11-01', 'M', '1980-01-01',
  'via sempre bravi', '5/8' , '60170', 'Vicenza', '', '');


--

insert into SQUADRE values (
  1, 8, 'seconda');

insert into SQUADRE values (
  2, 2, 'prima');

insert into SQUADRE values (
  3, 15, 'seconda');

insert into SQUADRE values (
  4, 3, 'prima');

insert into SQUADRE values (
  5, 4, 'prima');

--

insert into PENALITA values (
  1, 15, '2005-01-17', 123
);

insert into PENALITA values (
  2, 15, '2005-01-18', 50
);

