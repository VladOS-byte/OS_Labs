#!/bin/bash

./task5_hold.sh &
mkfifo mychannel || true

while true
do
	read line
	if [[ "$line" != "+" && "$line" != "*" && (! "$line" =~ ^[[:digit:]]+$) ]]
	then
		exit 1
	fi
	echo "$line" > mychannel
	if [[ "$line" == "QUIT" ]]
	then
		exit 0
	fi
done

exit
