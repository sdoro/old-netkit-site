-- $Id: fgt-schema.sql,v 1.1 2005/01/21 09:11:24 doros Exp $


--
create database fgt;
use fgt;
--

create table GIOCATORI (
  N_GIOCATORE smallint not null,
  COGNOME char(15) not null,
  INIZIALI char(3) not null,
  DATA_NASCITA date,
  SESSO char(1) not null,
  ISCRITTO_DAL smallint not null,
  INDIRIZZO char(20) not null,
  NUMERO char(4),
  CAP char(5),
  CITTA char(20) not null,
  TELEFONO char(10),
  N_SOCIO char(4),

  PRIMARY KEY (N_GIOCATORE)
);

create table PARTITE (
  N_PARTITA smallint not null,
  N_SQUADRA smallint not null,
  N_GIOCATORE smallint not null,
  VITTORIE smallint not null,
  SCONFITTE smallint not null,

  PRIMARY KEY (N_PARTITA)
);

create table PENALITA (
  N_PAGAMENTO integer not null,
  N_GIOCATORE smallint not null,
  DATA_PAGAMENTO date not null,
  IMPORTO decimal(7) not null,

  PRIMARY KEY (N_PAGAMENTO)
);

create table SQUADRE (
  N_SQUADRA smallint not null,
  N_GIOCATORE smallint not null,
  CATEGORIA char(7) not null,

  PRIMARY KEY (N_SQUADRA)
);

create table MEMBRI_COMMISSIONE (
  N_GIOCATORE smallint not null,
  DATA_INIZIO date not null,
  DATA_FINE date,
  CARICA char(20),

  PRIMARY KEY (N_GIOCATORE, DATA_INIZIO)
);


