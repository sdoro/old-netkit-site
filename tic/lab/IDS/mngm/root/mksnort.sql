--
-- $Id: mksnort.sql,v 1.1 2003-10-02 16:03:08 doros Exp $
--

create database snort;
connect snort;
grant CREATE,INSERT,SELECT,DELETE,UPDATE on snort.* to snort;
grant CREATE,INSERT,SELECT,DELETE,UPDATE on snort.* to snort@localhost;
set password for snort@localhost=password('snort');
set password for snort@"%"=password('snort');
flush privileges;
