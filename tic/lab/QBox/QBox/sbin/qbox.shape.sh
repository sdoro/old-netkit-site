#!/bin/bash
#
# Q*Box Script
# Ron Senykoff - rsenykoff < -- at -- > gmail < -- d o t -- > com
# Thanks to http://lartc.org and http://leaf.sourceforge.net

#####################################
####### Grab the VARIABLES ##########
#                                   #
BOTTOMPORTS=`/etc/qbox/bottomPorts.sh`
MIDPORTS=`/etc/qbox/midPorts.sh`
TOPPORTS=`/etc/qbox/topPorts.sh`
BOTTOMIPS=`/etc/qbox/bottomIPs.sh`
MIDIPS=`/etc/qbox/midIPs.sh`
TOPIPS=`/etc/qbox/topIPs.sh`

DOWNLOADS=(`/etc/qbox/download.sh`)
UPLOADS=(`/etc/qbox/upload.sh`)

downmax=${DOWNLOADS[0]}
downinteractive=${DOWNLOADS[1]}
downmid=${DOWNLOADS[2]}
downdefault=${DOWNLOADS[3]}
downlow=${DOWNLOADS[4]}

upmax=${UPLOADS[0]}
upinteractive=${UPLOADS[1]}
upmid=${UPLOADS[2]}
updefault=${UPLOADS[3]}
uplow=${UPLOADS[4]}


##### Set up static variables #######

ethInbound=eth0
ethOutbound=eth1

#                                   #
#####################################
#####################################

# clear out any existing queues attached to NICs
# first time this runs (on bootup) you'll get a
# RNETLINK something or other error indicating 
# that what you want to delete isn't there
# this is OK to ignore. I'm not really sure
# how to check for it

tc qdisc del root dev $ethInbound
tc qdisc del root dev $ethOutbound

#####################################
######### Attach Queues #############
#                                   #

# root qdisc /  qdisc = queueing discipline #
tc qdisc add dev $ethInbound root handle 1: htb default 30
tc qdisc add dev $ethOutbound root handle 1: htb default 30

tc class add dev $ethInbound parent 1: classid 1:1 htb rate ${downmax}kbit burst 15k
tc class add dev $ethOutbound parent 1: classid 1:1 htb rate ${upmax}kbit burst 15k

tc class add dev $ethInbound parent 1:1 classid 1:10 htb rate ${downinteractive}kbit ceil ${downmax}kbit burst 15k quantum 1514 prio 0
tc class add dev $ethOutbound parent 1:1 classid 1:10 htb rate ${upinteractive}kbit ceil ${upmax}kbit burst 15k quantum 1514 prio 0

tc class add dev $ethInbound parent 1:1 classid 1:20 htb rate ${downmid}kbit ceil ${downmax}kbit burst 15k quantum 1514 prio 1
tc class add dev $ethOutbound parent 1:1 classid 1:20 htb rate ${upmid}kbit ceil ${upmax}kbit burst 15k quantum 1514 prio 1

tc class add dev $ethInbound parent 1:1 classid 1:30 htb rate ${downdefault}kbit ceil ${downmax}kbit burst 15k quantum 1514 prio 2
tc class add dev $ethOutbound parent 1:1 classid 1:30 htb rate ${updefault}kbit ceil ${upmax}kbit burst 15k quantum 1514 prio 2

tc class add dev $ethInbound parent 1:1 classid 1:40 htb rate ${downlow}kbit ceil ${downmax}kbit burst 15k quantum 1514 prio 3
tc class add dev $ethOutbound parent 1:1 classid 1:40 htb rate ${uplow}kbit ceil ${upmax}kbit burst 15k quantum 1514 prio 3

#######
# Now that we've throttled the different prios, let's add some 
# fairness to the appropriate queues. it is my experience that
# fairness on interactive traffic is not always the best solution
# it depends on whether you know the max level of expected usage
# for example a work environment using VoIP where you know they
# usually don't go over X amount of calls
############

# interactive gets pfifo queue
tc qdisc add dev $ethInbound parent 1:10 handle 10: pfifo limit 50 
tc qdisc add dev $ethOutbound parent 1:10 handle 10: pfifo limit 50 

# mid level gets sfq (stochastic fairness queueing)
tc qdisc add dev $ethInbound parent 1:20 handle 20: sfq quantum 1514b perturb 10 
tc qdisc add dev $ethOutbound parent 1:20 handle 20: sfq quantum 1514b perturb 10

##########
# the rehashing in sfq can get intense, so let's keep it
# lower for the traffic that isn't going to notice it as much
# to do this we increase the perturb value, which is how many
tc qdisc add dev $ethInbound parent 1:30 handle 30: sfq quantum 1514b perturb 20 
tc qdisc add dev $ethOutbound parent 1:30 handle 30: sfq quantum 1514b perturb 20

tc qdisc add dev $ethInbound parent 1:40 handle 40: sfq quantum 1514b perturb 20 
tc qdisc add dev $ethOutbound parent 1:40 handle 40: sfq quantum 1514b perturb 20

#                                   #
######## End Attach Queues ##########
#####################################

###################################################
############## Create Filters #####################
##                                               ##

# helper vars
U32IN="tc filter add dev $ethInbound protocol ip parent 1:0 prio 1 u32"
U32OUT="tc filter add dev $ethOutbound protocol ip parent 1:0 prio 1 u32"

#####################################
########### Interactive #############
#                                   #

for i in $TOPPORTS;  do
	$U32IN match ip sport ${i} 0xffff flowid 1:10
	$U32IN match ip dport ${i} 0xffff flowid 1:10
	$U32OUT match ip sport ${i} 0xffff flowid 1:10
	$U32OUT match ip dport ${i} 0xffff flowid 1:10
	echo ${i} added to interactive port list
done

for i in $TOPIPS;  do
	$U32IN match ip src ${i}/32 flowid 1:10
	$U32IN match ip dst ${i}/32 flowid 1:10
	$U32OUT match ip src ${i}/32 flowid 1:10
	$U32OUT match ip dst ${i}/32 flowid 1:10
	echo ${i} added to interactive IP list
done

#                                   #
########## End Interactive ##########
#####################################

#####################################
############# Mid  ##################
#                                   #

for i in $MIDPORTS;  do
	$U32IN match ip sport ${i} 0xffff flowid 1:20
	$U32IN match ip dport ${i} 0xffff flowid 1:20
	$U32OUT match ip sport ${i} 0xffff flowid 1:20
	$U32OUT match ip dport ${i} 0xffff flowid 1:20
	echo ${i} added to middle queue port list
done

for i in $MIDIPS;  do
	$U32IN match ip src ${i}/32 flowid 1:20
	$U32IN match ip dst ${i}/32 flowid 1:20
	$U32OUT match ip src ${i}/32 flowid 1:20
	$U32OUT match ip dst ${i}/32 flowid 1:20
	echo ${i} added to middle queue IP list
done

#                                   #
############ End Mid ################
#####################################

#####################################
########### Low / Bulk ##############
#                                   #
## if it's matched here, it is banished to the netherqueue...
## nah, how could we be so mean to a nice packet? it'll get
## through at whatever rate specified for low
 
for i in $LOWPORTS;  do
	$U32IN match ip sport ${i} 0xffff flowid 1:40
	$U32IN match ip dport ${i} 0xffff flowid 1:40
	$U32OUT match ip sport ${i} 0xffff flowid 1:40
	$U32OUT match ip dport ${i} 0xffff flowid 1:40
	echo ${i} added to bulk / low queue port list
done

for i in $LOWIPS;  do
	$U32IN match ip src ${i}/32 flowid 1:40
	$U32IN match ip dst ${i}/32 flowid 1:40
	$U32OUT match ip src ${i}/32 flowid 1:40
	$U32OUT match ip dst ${i}/32 flowid 1:40
	echo ${i} added to bulk / low queue IP list
done

#####################################
############ Default ################
#                                   #
# HTB handles classifying the 
# default for us, which goes to
# flowid 1:30 in ths case
#                                   #
########## End Default ##############
#####################################


