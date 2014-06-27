#!/bin/sh

loggedInUser=$( ls -l /dev/console | awk '{print $3}' )
Status=$( sudo -u $loggedInUser launchctl list | grep com.apple.RemoteDesktop.agent | awk '{ print $2 }' )
if [[ $Status = "-" ]] ; then
	    echo "<result>On</result>"
    else
	        echo "<result>Off</result>"
	fi
