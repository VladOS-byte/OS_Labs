#!/bin/bash

pids=$(ps -axo pid,start_time --sort=start_time | head -n -6 | tail -n +2 |  awk '{ print $1 }')

echo -n > task4.out
echo -n > 4.temp

for pid in $pids
do
	ppid=$(awk -e '$1 ~ "PPid" { print $2 }' < /proc/$pid/status)
	sum_exec_runtime=$(awk -e '$1 ~ "sum_exec_runtime" { print $3 }' < /proc/$pid/sched)
	nr_switches=$(awk -e '$1 ~ "nr_switches" { print $3 }' < /proc/$pid/sched)
	ART=$(echo "$sum_exec_runtime / $nr_switches" | bc -l | sed "s/\./0\./g")
	echo $pid $ppid $ART >> 4.temp
done

sort -n -k2 4.temp | awk '{ print "ProcessID=" $1 " : Parent_ProcessID=" $2 " : Average_Running_Time=" $3}' > task4.out

rm 4.temp
exit
