#!/bin/bash

#pids=$(ps axo pid,cmd | tail -n +2 | head -n -6 | awk '{ print $1 }')

pids=$(ps axo pid,cmd | tail -n +2 | grep -v -E 'sudo|awk|tail|grep|ps|bash|./task7.sh' | awk '{ print $1 }')

touch 7.temp

for pid in $pids 
do 
	awk -v pid=$pid '$1=="read_bytes:" { print pid" "$2 }' /proc/$pid/io >> 7.temp
done

sleep 1m

pids=$(ps axo pid,cmd | tail -n +2 | grep -v -E 'sudo|awk|tail|grep|ps|bash|./task7.sh' | awk '{ print $1 }') 

for pid in $pids 
do 
	awk -v pid=$pid '$1=="read_bytes:" { print pid" "$2 }' /proc/$pid/io >> 7.temp
done

sort -n -k1 < 7.temp | awk 'BEGIN {curpid=-1; curvalue=-1} 
	{
	if (curpid==$1) {
		value=$2-curvalue
		if (value<0) {
			value*=-1
		}
		print curpid" "value
	} else {
		curpid=$1
		curvalue=$2
	}
	}' | sort -n -r -k2 | head -3 | awk '{getline cmd <("/proc/"$1"/cmdline"); print $1":"cmd":"$2}' 

rm 7.temp

exit
