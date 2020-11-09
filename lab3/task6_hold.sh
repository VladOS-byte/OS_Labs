#!/bin/bash
echo $$ > .pid
res=1

add() {
	res=$((res + 2))
	echo $res
}

mul() {
	res=$((res * 2))
	echo $res
}

term() {
	echo "Terminated"
	exit 0
}

trap add USR1
trap mul USR2
trap term SIGTERM

while true
do
	sleep 1s
done

exit
