#!/bin/bash

currentDate=$(date +"%Y-%m-%d")
report=$HOME"/backup-report"

backupDirectory="/"
for filename in $(ls $HOME | grep "Backup-")
do
	if [[ $filename > "Backup-"$(date -d "now -7 days" +"%Y-%m-%d") ]] 
	then
		backupDirectory="/"$filename
	fi
done

if [[ $backupDirectory == "/" ]] 
then
	backupDirectory="/Backup-"$currentDate
	mkdir $HOME$backupDirectory
	echo "["$currentDate"]: "$HOME$backupDirectory" was created" >> $report
	for file in $(ls $HOME"/source")
	do
		cp $HOME"/source/"$file $HOME$backupDirectory
		echo "[$currentDate]: $file was backed up from $HOME/source/" >> $report
	done
else
	for file in $(ls $HOME"/source")
	do
		if [[ ! -f $HOME$backupDirectory"/"$file ]]
		then
			cp $HOME"/source/$file" $HOME$backupDirectory
			echo "[$currentDate]: $file was backed up from $HOME/source/" >> $report
		else
			if [[ $(wc -c $HOME$backupDirectory"/"$file | awk '{ print $1 }') != $(wc -c $HOME"/source/"$file | awk '{ print $1 }') ]]
			then
				mv $HOME$backupDirectory"/"$file $HOME$backupDirectory"/"$file.$currentDate
				cp $HOME"/source/"$file $HOME$backupDirectory
				echo "[$currentDate]: $file was backed up from $HOME/source/" >> $report
				echo "[$currentDate]: last version of $file was renamed to $file.$currentDate" >> $report
			fi
		fi
	done
fi

exit
