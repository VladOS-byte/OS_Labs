#!/bin/bash

tr '=' ' ' < task4.out | awk 'BEGIN {curppid=0}
	{
	if (curppid==$5) {
		count+=1;
		sum+=$8;
	} else {
		if (count!=0) {
			m=sum/count;
			print "Average_Sleeping_Children_of_ParentID=" curppid " is " m;
		}
		curppid=$5
		sum=$8;
		count=1;
	}	
	print $0
	}
	END {
	m=sum/count;
	print "Average_Sleeping_Children_of_ParentID=" curppid " is " m;
	}' | sed "s/ProcessID /ProcessID=/g" | sed "s/Time /Time=/g" > task5.out

exit
