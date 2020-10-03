#!/bin/bash

CURRENT_DIRECTORY=$(pwd)
echo "Current Directory: $CURRENT_DIRECTORY"

# reads lines from repos.list
while read line; do
	if [[ $line != "https://"* ]];
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
