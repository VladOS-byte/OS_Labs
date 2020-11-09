#!/bin/bash

mode=""
res=1

(tail -f mychannel) |
while true
do
	read line;
	if [[ $line == "QUIT" ]]; then
		killall tail
		exit 0
	elif [[ $line == "+" ]] || [[ $line == "*" ]]; then
		mode=$line
	else
		case $mode in
			"+" ) res=$((res + line));;
			"*" ) res=$((res * line));;
		esac;
		echo "Current result: $res"
	fi
done
