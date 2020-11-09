#!/bin/bash

checkTop() {
	echo "Top: $(top -b -n 1 | awk '$1 == '$p1' || $1 == '$p2' || $1 == '$p3' { print($1 " " $9) }' | sort -n)"
}

./task4_mul.sh 1 1 &
p1=$!

./task4_mul.sh 2 2 &
p2=$!

./task4_mul.sh 3 3 &
p3=$!

cpulimit -p $p1 -l 1 &

sleep 5s
checkTop

kill $p3

sleep 5s
checkTop

kill $p1
kill $p2
exit
