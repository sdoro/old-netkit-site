-- $Id: db.sql,v 1.1 2008-08-27 21:33:33 doros Exp $

create database urban;
GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,CREATE TEMPORARY TABLES, DROP,INDEX,ALTER ON urban.* to rot@localhost;

create database geoblog_admin;
GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,CREATE TEMPORARY TABLES, DROP,INDEX,ALTER ON geoblog_admin.* to rot@localhost;

set password for rot@localhost = password('150590');
flush privileges;
