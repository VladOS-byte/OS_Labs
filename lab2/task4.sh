#!/bin/bash

pids=$(ps -axo pid,start_time --sort=start_time | tail -n +2 |  awk '{ print $1 }')

echo -n > task4.out
echo -n > 4.temp

for pid in $pids
do
	ppid=$(find $(find /proc -maxdepth 1 -type d -name $pid) -name "status" -exec awk -e '$1 ~ "PPid" { print $2 }' {} \;)
	sum_exec_runtime=$(find $(find /proc -maxdepth 1 -type d -name $pid) -name "sched" -exec awk -e '$1 ~ "sum_exec_runtime" { print $3 }' {} \;)
	nr_switches=$(find $(find /proc -maxdepth 1 -type d -name $pid) -name "sched" -exec awk -e '$1 ~ "nr_switches" { print $3 }' {} \;)
	
	if [[ $ppid != "" ]] && [[ $sum_exec_runtime != "" ]] && [[ $nr_switches != "" ]] 
	then
		ART=$(echo "$sum_exec_runtime / $nr_switches" | bc -l | sed "s/\./0\./g")
		echo $pid $ppid $ART >> 4.temp
	fi
done

sort -n -k2 4.temp | awk '{ print "ProcessID=" $1 " : Parent_ProcessID=" $2 " : Average_Running_Time=" $3}' > task4.out

rm 4.temp
exit
