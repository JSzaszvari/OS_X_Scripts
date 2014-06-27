#!/bin/bash

server=`echo nickmavserver.local`

# Make sure we're root
sudotest=`whoami | grep root`
if [ "$sudotest" == "root" ]
then

	# See if we can connect to the server, then throw away the output
	if ping -c 1 $server 1>/dev/null 2>/dev/null
	then
		# Resolve the hostname to it's IP with ping, then prepend the address with bsdp://, because netboot doesn't play nice with hostnames
		resolvenetboot=`ping -c 1 $server | awk -v server="$server" 'match($0, server) {print $3 ; exit}' | sed 's/(/bsdp:\/\//' | sed 's/)://'`
		echo $server resolved to $resolvenetboot, blessing system
		sleep 1
		# Tell the system to boot from the server
		bless --netboot --server $resolvenetboot
		echo Attempting to netboot to $server...
		sleep 3
		# Pray
		reboot
	else
		echo Unable to connect to $server, exiting.
	fi

else
	echo This script must be run as a superuser.
fi
