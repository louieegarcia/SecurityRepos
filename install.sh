#!/bin/bash

CURRENT_DIRECTORY=$(pwd)
echo -e "Current Directory: $CURRENT_DIRECTORY\x0A"

while read line; do
	if [ $line = "WINDOWS" ] || [ $line = "LINUX" ] || [ $line = "WEBAPP" ] || [ $line = "WORDLISTS" ]
	then
		echo "Creating folder [$line]"
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
