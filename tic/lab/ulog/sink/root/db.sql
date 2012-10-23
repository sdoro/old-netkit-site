-- $Id: db.sql,v 1.1 2007-02-11 22:39:45 doros Exp $
create database ulogdb;
use ulogdb;
source /root/ulogd.mysqldump;
grant select,insert,update,drop,delete,create temporary tables
  on ulogdb.*
  to ulog@10.0.0.1
  identified by 'secret';
flush privileges;
