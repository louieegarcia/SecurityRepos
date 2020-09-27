#!/bin/bash

CURRENT_DIRECTORY=$(pwd)
echo "Current Directory: $CURRENT_DIRECTORY"

# reads lines from repos.list
while read line; do
	# will only skip AWESOME_CHEATS as this list is large and potentially not needed at the moment
	if [ $line != "AWESOME_CHEATS" ]
	then
		echo "Creating folder [$line]"
		# create a folder for WINDOWS, LINUX, etc titles found in repos.list
		if [ $CURRENT_DIRECTORY = $(pwd) ]
		then
			mkdir $line
			cd $line
		else
			mkdir ../$line
			cd ../$line
		fi
	else
		echo "Cloning $line"
		git clone $line
		echo ""
	fi
done < repos.list
