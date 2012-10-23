/* $Id: tables.sql,v 1.1 2005/04/28 17:22:14 doros Exp $ */

create table users (
  user_id       integer auto_increment primary key,
  user          varchar(100) not null,
  password      varchar(100) not null
);    
