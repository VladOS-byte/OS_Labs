#!/bin/bash

rfile=$PWD"/"$1
trash=$HOME"/trash"
rlast=$trash"/rlast"
logfile=$HOME"/trash.log"
num=0

if [[ ! -f $rfile ]]
then
	echo "File $1 doesn't exist"
	exit
fi

if [[ ! -d $trash ]] 
then
	mkdir $trash
	touch $rlast
else
	read num < $rlast
fi

num=$(($num + 1))

ln $rfile "$trash/$num"
rm $rfile

echo $num > $rlast

if [[ ! -f $logfile ]]
then
	touch $logfile
fi

echo $rfile">"$num >> $logfile

exit
