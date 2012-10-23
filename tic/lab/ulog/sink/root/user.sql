-- $Id: user.sql,v 1.2 2007-06-27 19:45:30 doros Exp $
use mysql;

INSERT INTO user (Host, User, Password)
VALUES ('10.0.0.1','ulog', OLD_PASSWORD('secret'));

INSERT INTO user (Host, User, Password)
VALUES ('localhost','ulog', OLD_PASSWORD('secret'));

flush privileges;

