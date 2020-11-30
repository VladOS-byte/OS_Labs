#!/bin/bash

currentdate="Backup-0000-01-01"

for filename in $(ls $HOME | grep "Backup-")
do	
	if [[ $filename > $currentdate ]]
	then
		currentdate=$filename
	fi
done

if [[ $currentdate == "Backup-0000-01-01" ]] 
then
	echo "No backup available"
	exit
else
	if [[ ! -d $HOME"/restore" ]]
	then
		mkdir $HOME"/restore"
	fi
	for file in $(ls $HOME"/"$currentdate)
	do
		if [[ ! $file =~ ".*\.[0-9]{4}-[0-9]{2}-[0-9]{2}" ]]
		then
			cp $HOME"/"$currentdate"/"$file $HOME"/restore"
		fi
	done
fi
exit
