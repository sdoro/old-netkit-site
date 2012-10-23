#!/bin/sh
# $Id: mk-school-users.sh,v 1.3 2009-10-25 20:14:05 doros Exp $

HQ_HOME_STUDENT=/net/headquarters/student
HQ_HOME_STAFF=/net/headquarters/staff

BR_HOME_STUDENT=/net/branch/student
BR_HOME_STAFF=/net/branch/staff


_mkuser()
{
	(sleep 2; echo "not24get"; sleep 2; echo "not24get") | \
    adduser --home $1/$2 $2
}


_mkuser $HQ_HOME_STUDENT student1
_mkuser $HQ_HOME_STUDENT student2

_mkuser $HQ_HOME_STAFF staff1
_mkuser $HQ_HOME_STAFF staff2

_mkuser $BR_HOME_STUDENT student3
_mkuser $BR_HOME_STUDENT student4

_mkuser $BR_HOME_STAFF staff3
_mkuser $BR_HOME_STAFF staff4

#
# bot
