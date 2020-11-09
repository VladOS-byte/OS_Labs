#!/bin/bash

hold=$(cat .pid)

while true
do
	read line;
	case $line in
		"+" )
			kill -USR1 $hold;;
		"*" )
			kill -USR2 $hold;;
		"TERM" )
			kill -SIGTERM $hold
			exit 0;;
	esac
done

exit
