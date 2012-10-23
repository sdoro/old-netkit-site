CREATE DATABASE snort;
grant CREATE, INSERT, SELECT, UPDATE on snort.* to snort@localhost;
grant CREATE, INSERT, SELECT, UPDATE on snort.* to snort;
SET PASSWORD FOR snort=PASSWORD('snort-db');
flush privileges;
