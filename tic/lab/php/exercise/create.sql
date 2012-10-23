-- $Id:$

CREATE TABLE Impiegati (
  NImp Decimal(4) NOT NULL,
  Nome CHAR(20),
  Mansione CHAR(10),
  Data_A DATE,
  Stipendio Decimal(7,2),
  Premio_P Decimal (7,2),
  NDip Decimal(2),
  PRIMARY KEY (NImp)
);

CREATE TABLE Dipartimenti (
  NDip Decimal(2) NOT NULL,
  Nome_Dip CHAR(20),
  Ufficio CHAR(10),
  Divisione CHAR(2),
  Dirigente Decimal(4),
  PRIMARY KEY (NDip)
);

-- bot
