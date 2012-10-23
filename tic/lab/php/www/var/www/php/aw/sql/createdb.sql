/* $Id: createdb.sql,v 1.1 2005/04/28 17:20:31 doros Exp $ */

create database dbaw;

grant insert, select, update, delete on dbaw.*
  to aw@localhost
  identified by 'not24get';

use dbaw;
