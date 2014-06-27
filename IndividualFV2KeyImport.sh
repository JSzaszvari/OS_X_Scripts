#!/bin/sh

####################################################################################################
#
# DESCRIPTION
#   This script allows the end user of a machine to import their FileVault2 Recovory Key if the 
#	machine was encrypted before enrolled with the JSS.
#
#	This script displays a Message Box to the end user asking for their Individual FV2 Recovory Key.
#	Then creates the XML that will get uploaded to the JSS to set their FV2 key in the JSS.
#	This script was designed to be run through a Self Service Policy
#
#	You will need to create a FV2 config in the JSS and fill in the fv2id variable in this script. 
#
####################################################################################################
#
# HISTORY
#
#	Version 1.0
#  	Adapted by John Szaszvari, June 27th, 2014 
#
###################################################################################################

#ID of the FileVault2 Config in the JSS 
fv2id=1 

fullKey=$(osascript <<-EOF

tell application "Finder"
	set theText to display dialog "Please enter your FileVault2 Key provided by I.T" default answer ""
end tell

text returned of theText

EOF)


echo '<?xml version="1.0" encoding="UTF-8"?>' > /tmp/file_vault_2_id.xml
echo '<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">' >> /tmp/file_vault_2_id.xml

echo '<plist version="1.0">' >> /tmp/file_vault_2_id.xml
echo '<dict>' >> /tmp/file_vault_2_id.xml

echo '	<key>FV2_ID</key>' >> /tmp/file_vault_2_id.xml
echo '	<string>'"$fv2id"'</string>' >> /tmp/file_vault_2_id.xml

echo '</dict>' >> /tmp/file_vault_2_id.xml
echo '</plist>' >> /tmp/file_vault_2_id.xml


echo '<?xml version="1.0" encoding="UTF-8"?>' > /tmp/file_vault_2_recovery_key.xml
echo '<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">' >> /tmp/file_vault_2_recovery_key.xml

echo '<plist version="1.0">' >> /tmp/file_vault_2_recovery_key.xml
echo '<dict>' >> /tmp/file_vault_2_recovery_key.xml

echo '	<key>RecoveryKey</key>' >> /tmp/file_vault_2_recovery_key.xml
echo '	<string>'"$fullKey"'</string>' >> /tmp/file_vault_2_recovery_key.xml

echo '</dict>' >> /tmp/file_vault_2_recovery_key.xml
echo '</plist>' >> /tmp/file_vault_2_recovery_key.xml

/bin/mv /tmp/file_vault_2_* /Library/Application\ Support/JAMF/