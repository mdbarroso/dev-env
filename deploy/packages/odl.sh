#!/bin/bash

# TODO: set git config

# update the update the maven settings 
SETTINGS_FILE=~/.m2/settings.xml

# check if we need to update the settings file ...
if [ ! -f  $SETTINGS_FILE ]; then 
	echo "Updating settings file:" 
	cp -n ~/.m2/settings.xml{,.orig} ; \
		wget -q -O - https://raw.githubusercontent.com/opendaylight/odlparent/master/settings.xml > \
		~/.m2/settings.xml
fi

# check if we need to clone the repo, or just point at it
if [ ! -d ~/odl]; then
	mkdir ~/odl
	cd ~/odl/

	git clone https://github.com/opendaylight/sfc

	cd sfc
fi

# TODO: set ODL username -> https://wiki.opendaylight.org/view/GettingStarted:Pulling,_Hacking,_and_Pushing_All_the_Code_from_the_CLI#Make_sure_you_have_an_account



# install ODL 
mvn clean install

