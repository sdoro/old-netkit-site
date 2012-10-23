#!/bin/sh
# /etc/init.d/htb.init
# $Id: htb.init.d,v 1.1 2004/11/01 14:06:01 doros Exp $

#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either
# version 2 of the License, or (at your option) any later
# version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# ===
#
# htb.init
# 
# A shell-script wrapper for HTB.INIT designed for
# use in the SysV-init system (/etc/init.d).
#
# usage: htb.init { start | stop | restart | stats }
#

RCDLINKS="0,K89 1,K89 2,S11 3,S11 4,S11 5,S11 6,K89"

# check the command line
#
usage="{ start | stop | restart | reload | recreate | stats }"
if test $# -eq 0
then
	echo usage: `basename $0` "${usage}" >&2
	exit 2
fi

# process the command line
#
if test "${1}" = "start"
then
	# "start"
	#
    # start netkit4tic
	/bin/rm -rf /etc/sysconfig/htb/*
	/sbin/htb.sysconfig
    # end netkit4tic
	shift
	/sbin/htb.init start > /dev/null 2>&1
	echo "htb.init (QoS) ... start"

elif test "${1}" = "stop"
then
	# "stop"
	#
	/sbin/htb.init stop > /dev/null 2>&1
	echo "htb.init (QoS) ... stop"

elif test "${1}" = "restart"
then
	# "restart"
	#
	/sbin/htb.init restart > /dev/null 2>&1
	echo "htb.init (QoS) ... restart"

elif test "${1}" = "reload"
then
	# "restart"
	#
	/sbin/htb.init stop > /dev/null 2>&1
	/sbin/htb.init start invalidate > /dev/null 2>&1
	echo "htb.init (QoS) ... reload"

elif test "${1}" = "recreate"
then
	# "recreate"
	#
	/bin/rm -rf /etc/sysconfig/htb/*
	/sbin/htb.sysconfig
	echo "htb.init (QoS) ... recreated. Use \"reload\" to load the new configuration."

elif test "${1}" = "stats"
then
	# "stats"
	#
	/sbin/htb.init stats

else
	echo usage: `basename $0` "${usage}" >&2
	exit 2
fi
