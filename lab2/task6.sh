#!/bin/bash

awk '{if ($1=="VmRSS:") { print "PID="pid" "$2 } else if ($1=="Pid:") { pid=$2 }}' $(find /proc -maxdepth 2 -type f -name status | head -n -4) | sort -n -k2 | tail -1 | awk '{ print $1 }'

exit
