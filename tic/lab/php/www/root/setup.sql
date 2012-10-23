-- $Id: setup.sql,v 1.5 2004/12/06 16:40:22 doros Exp $

create database dbprova;

GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER,INDEX
  ON dbprova.*
  TO luca@"%"
  IDENTIFIED BY 'secret';

GRANT ALL PRIVILEGES
  ON dbprova.*
  TO luca@localhost
  IDENTIFIED BY 'secret';

FLUSH PRIVILEGES;

--UPDATE user SET Password = PASSWORD ('secret') WHERE user='luca';

-- bot
