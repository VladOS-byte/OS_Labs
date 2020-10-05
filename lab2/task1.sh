#!/bin/bash
com=$(ps -u $USER | awk '{print $1 "\t" $4}' | tail -n +2)
echo "$com"|wc -l > task1.out
echo "PID	CMD" >> task1.out
echo "$com" >> task1.out
exit
