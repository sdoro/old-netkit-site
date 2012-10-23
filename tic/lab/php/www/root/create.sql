-- $Id: create.sql,v 1.1 2005/05/08 21:42:31 doros Exp $

CREATE TABLE rubrica (
  Progressivo int PRIMARY KEY AUTO_INCREMENT,
  Nome varchar(40) NOT NULL,
  DataNascita date,
  Cognome varchar(40) NOT NULL,
  Telefono varchar(20)
);

-- bot
