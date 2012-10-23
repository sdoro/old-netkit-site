-- $Id: schema.sql,v 1.1 2005/01/21 09:13:36 doros Exp $

CREATE TABLE Categorie (
  Cod_Categoria CHAR(2) NOT NULL,
  Nome_Categoria CHAR(20),
  PRIMARY KEY (Cod_Categoria)
) type = InnoDB;

CREATE TABLE Veicoli (
  Targa CHAR(7) PRIMARY KEY,
  Cod_Categoria CHAR(2),
  Cilindrata NUMERIC(4),
  Cavalli_Fiscali NUMERIC(3),
  Velocita NUMERIC(4),
  Posti NUMERIC(1),
  Immatricolazione DATE,
  INDEX cat_index (Cod_Categoria),
  FOREIGN KEY (Cod_Categoria)
  REFERENCES Categorie(Cod_Categoria) ON DELETE SET NULL
  -- REFERENCES Categorie(Cod_Categoria) ON DELETE CASCADE
) type = InnoDB;

