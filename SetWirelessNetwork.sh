#!/bin/sh
#Sets the Wi-Fi network for a OS X machine via script.
#Can be deployed to update a wireless password or change the SSID they are connected to.

#Set These Variables inside the quotes
ssid='Network SSID'
password='Network Password' 


#Make variable for Wi-Fi to use in networksetup commands

hdware=`/usr/sbin/networksetup -listallhardwareports | grep -A 1 Wi-Fi | awk '/Device/{ print $2 }'`

result=`/usr/sbin/networksetup -getairportnetwork $hdware | sed 's/Current Wi-Fi Network: //g'`


#Turn the Wireless Card off
networksetup -setairportpower $hdware off

#Remove the current entry for the network.
networksetup -removepreferredwirelessnetwork $hdware "$ssid"

#Re set the prefered network. 
networksetup -addpreferredwirelessnetworkatindex $hdware "$ssid" 0 WPA2 "$password"

#Note: We use WPA2 Personal but you can chose your own security in place of it above

#Turn Wireless back on to force a re-joining
networksetup -setairportpower $hdware on
