#!/bin/bash

trash=$HOME"/trash"
logfile=$HOME"/trash.log"

if [[ ! -d $trash ]] 
then
	echo "Trash directory doesn't exist"
	exit
fi

if [[ ! -f $logfile ]] 
then
	echo "File trash.log doesn't exist"
	exit
fi

for line in $(grep "/$1>" $logfile)
do
	realname=$(echo $line | cut -d ">" -f1)
	trashname=$(echo $line | cut -d ">" -f2)

	cmd=""
	while [[ ! $cmd == "Y" && ! $cmd == "N" ]]
	do
		echo "Do you want untrash $realname? Type [Y|N]"
		read cmd
	done

	if [[ $cmd == "Y" ]]
	then
		directory=$(dirname $realname)
		if [[ ! -d $directory && ! $directory == "" ]]
		then
			echo "Directory $directory doesn't exist. New path $realname: $HOME/$1"
			directory=$HOME
		fi
		
		realname=$1
		while [[ -f $directory"/"$realname ]] 
		do
			echo "$realname alredy exists in directory $directory. Type another name."
			read realname
		done
		
		ln $trash"/"$trashname $directory"/"$realname
		rm $trash"/"$trashname
		break
	fi
done

exit
