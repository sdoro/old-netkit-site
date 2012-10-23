-- $Id:$

INSERT INTO Dipartimenti VALUES
  (10, 'Edilizia Civile', 1100, 'D1', 7977);

INSERT INTO Dipartimenti VALUES
  (20, 'Ricerche', 2100, 'D3', 7566);

INSERT INTO Dipartimenti VALUES
  (30, 'Edilizia Stradale', 5100, 'D2', 7698);

INSERT INTO Impiegati (NImp, Nome, Mansione, Data_A, Stipendio, NDip)
  VALUES
  (7566, 'Rosi', 'dirigente', '1981/04/02', 2975.00, 20);

INSERT INTO Impiegati (NImp, Nome, Mansione, Data_A, Stipendio, NDip)
  VALUES
  (7698, 'Blacchi', 'dirigente', '1981/05/01', 2850.00, 30);

INSERT INTO Impiegati VALUES
  (7782, 'Neri', 'ingegnere', '1981/06/01', 2450.00, 200, 10);

INSERT INTO Impiegati VALUES
  (7839, 'Dare', 'ingegnere', '1981/11/17', 2600.00, 300, 10);

INSERT INTO Impiegati (NImp, Nome, Mansione, Data_A, Stipendio, NDip)
  VALUES
  (7977, 'Verdi', 'dirigente', '1980/12/10', 3000.00, 10);

INSERT INTO Impiegati (NImp, Nome, Mansione, Data_A, Stipendio, NDip)
  VALUES
  (8150, 'Turni', 'tecnico', '1982/12/03', 1500.00, 30);

INSERT INTO Impiegati (NImp, Nome, Mansione, Data_A, Stipendio, NDip)
  VALUES
  (8170, 'Andrei', 'tecnico', '1983/01/23', 800.00, 30);

INSERT INTO Impiegati (NImp, Nome, Mansione, Data_A, Stipendio, NDip)
  VALUES
  (8182, 'Bianchi', 'tecnico', '1983/02/11', 800.00, 30);


-- bot
