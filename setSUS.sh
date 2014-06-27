#!/bin/sh
#># Purpose: Set the Software Update Server for root and all users to the OS-appropriate catalog
#># Original Author: Jared F. Nichols
#># With additions from Chad Brewer post on JamfNation

#Adapted by Bram Cohen 2/20/13
#Updated 6/13/2014 by Bram Cohen

#Define your Snow Leopard Branch 10.6
SLSUS="http://applesus.domain.com/content/catalogs/others/index-leopard-snowleopard.merged-1.sucatalog"
#Define your Lion Branch 10.7
LSUS="http://servername/content/catalogs/others/index-lion-snowleopard-leopard.merged-1_Prod.sucatalog"
#Define your Mountian Lion Branch 10.8
MLSUS="http://servername/content/catalogs/others/index-mountainlion-lion-snowleopard-leopard.merged-1_Prod.sucatalog"
#Define your MavericksBranch 10.9
MVSUS="http://servername/content/catalogs/others/index-10.9-mountainlion-lion-snowleopard-leopard.merged-1_Prod.sucatalog"

#Define the Name of your Server for the log output
NAME="SERVERNAME"

#System Variable - Don't Modify
OSversion=`sw_vers | grep ProductVersion`


#Sets System-Level com.apple.SoftwareUpdate.plist
case $OSversion in
  
*10.6*)
	defaults write /var/root/Library/Preferences/com.apple.softwareupdate CatalogURL $SLSUS
	defaults write /Library/Preferences/com.apple.softwareupdate CatalogURL $SLSUS
	echo "Setting SUS to $NAME Lion Branch for User $d"
	;;
*10.7*)
	defaults write /var/root/Library/Preferences/com.apple.softwareupdate CatalogURL $LSUS
	defaults write /Library/Preferences/com.apple.softwareupdate CatalogURL $LSUS
	echo "Setting System SUS to $NAME Lion Branch."
	;;
*10.8*)
	defaults write /var/root/Library/Preferences/com.apple.softwareupdate CatalogURL $MLSUS
	defaults write /Library/Preferences/com.apple.softwareupdate CatalogURL $MLSUS
	echo "Setting Sytem SUS to $NAME Mountain Lion Branch."
	;;
*10.9*)
	defaults write /var/root/Library/Preferences/com.apple.softwareupdate CatalogURL $MVSUS
	defaults write /Library/Preferences/com.apple.softwareupdate CatalogURL $MVSUS
	defaults read /Library/Preferences/com.apple.softwareupdate CatalogURL
	echo "Setting Sytem SUS to $NAME Mavericks Branch."
	;;
esac


#Sets User-Level com.apple.SoftwareUpdate.plist for all users who have it
for d in /Users/*
do
    if [ -e "$d/Library/Preferences/com.apple.Softwareupdate.plist" ]
    then
    
case $OSversion in

*10.6*)
	defaults write $d/Library/Preferences/com.apple.softwareupdate CatalogURL $SLSUS
	echo "Setting SUS to $NAME Snow Leopard Branch for User $d"
	;;
*10.7*)
	defaults write $d/Library/Preferences/com.apple.softwareupdate CatalogURL $LSUS
	echo "Setting SUS to $NAME Lion Branch for User $d"
	;;
*10.8*)
	defaults write $d/Library/Preferences/com.apple.softwareupdate CatalogURL $MLSUS
	echo "Setting SUS to $NAME Mountian Lion Branch for User $d"
	;;
*10.9*)
	defaults write $d/Library/Preferences/com.apple.softwareupdate CatalogURL $MVSUS
	defaults read $d/Library/Preferences/com.apple.softwareupdate CatalogURL
	echo "Setting SUS to $NAME Mavericks Branch for User $d"
	;;
esac

    else
        if [ -e "$d/Library/Preferences/.GlobalPreferences.plist" ];then
        	cp /Library/Preferences/com.apple.softwareupdate.plsit $d/Library/Preferences/com.apple.softwareupdate.plist
        	echo "Setting SUS to $NAME for User $d"
        else
        	echo "The file was not found under $d skipping 
        fi
    fi
done
