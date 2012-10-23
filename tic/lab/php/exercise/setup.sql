-- $Id:$

create database dbedu;

GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER,INDEX
  ON dbedu.*
  TO alex@"%"
  IDENTIFIED BY 'secret';

GRANT ALL PRIVILEGES
  ON dbedu.*
  TO alex@localhost
  IDENTIFIED BY 'secret';

FLUSH PRIVILEGES;

--UPDATE user SET Password = PASSWORD ('secret') WHERE user='alex';

-- bot

