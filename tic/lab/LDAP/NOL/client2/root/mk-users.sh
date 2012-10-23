#!/bin/sh
# $Id: $

HOME_STUDENT=/net/dir2/dir21/dir211
HOME_STAFF=/net/dir2/dir22
HOME_SYSADMIN=/net/dir1
HOME_BIENNIO=/net/dir2/dir21/dir212

#adduser --home $HOME_STUDENT/student student
#adduser --home $HOME_STAFF/sysadmin sysadmin
#adduser --home $HOME_SYSADMIN/staff staff
#adduser --home $HOME_BIENNIO/biennio biennio


_mkuser()
{
	#echo adduser --home $1/$2 $2
	(sleep 2; echo "not24get"; sleep 2; echo "not24get") | \
    adduser --home $1/$2 $2
	
}

_mkuser $HOME_STUDENT student1
_mkuser $HOME_STUDENT student2
_mkuser $HOME_STUDENT student3

_mkuser $HOME_STAFF staff1
_mkuser $HOME_STAFF staff2
_mkuser $HOME_STAFF staff3

_mkuser $HOME_SYSADMIN sysadmin1
_mkuser $HOME_SYSADMIN sysadmin2
_mkuser $HOME_SYSADMIN sysadmin3

_mkuser $HOME_BIENNIO biennio1
_mkuser $HOME_BIENNIO biennio2
_mkuser $HOME_BIENNIO biennio3

#
# bot
