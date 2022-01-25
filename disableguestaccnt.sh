#!/bin/bash 
#-----------------DISABLE GUEST ACCNT---------------#
    echo "Disable Guest Account"
echo 
    read -p "Continue (y/n)? "
echo 
#If prompt is no >
if [[ $REPLY =~ n ]]; then
    exit 
fi
if [[ $REPLY =~ y ]]; then
#
#Setting Path to Dir.
#
    LIGHTDM_CONFIG = "/etc/lightdm/lightdm.conf"
    LIGHTDM_CONFIG_BACKUP = "/etc/lightdm/lightdm.conf.backup"

#If prompt is yes >
if [[ $REPLY =~ y ]]; then
    echo "Running Script..."
    echo "Backing up $LIGHTDM_CONFIG to $LIGHTDM_CONFIG_BACKUP"
    #
    #If file doesnr exist
    #
    if ! [[ -f "$LIGHTDM_CONFIG_BACKUP" ]]; then
		echo "Backing up $LIGHTDM_CONFIG to $LIGHTDM_CONFIG_BACKUP"
		cp $LIGHTDM_CONFIG $LIGHTDM_CONFIG_BACKUP
	fi
    #How2Restore
    echo "To restore: cp $LIGHTDM_CONFIG_BACKUP $LIGHTDM_CONFIG"
    #Modifying > 
	echo "Modifying $LIGHTDM_CONFIG"
	
    #SED actually edits the file, the ^ means beginning of the line, the $ means where the line ends, the g means globally edit the entire file, -i modifies
    #regex101.com

		sed -i 's/^allow-guest=true $/allow-guest=false/g' $LIGHTDM_CONFIG
		
	echo "Edited $LIGHTDM_CONFIG"

	echo "----Diff----"
	git diff --unified=0 --no-index $LIGHTDM_CONFIG_BACKUP $LIGHTDM_CONFIG