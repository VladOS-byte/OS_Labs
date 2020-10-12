#!/bin/bash

ps -axo pid,start_time,command --sort=start_time | grep -v -E 'awk|tail|grep|ps|bash|./task3.sh' | tail -1 | awk '{ print $1 " " $3 }'

#ps -axo pid,start_time,command --sort=start_time | tail -6 | head -1 | awk '{ print $1 " " $3 }'

exit
