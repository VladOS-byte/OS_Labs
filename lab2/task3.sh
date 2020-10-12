#!/bin/bash

ps -axo pid,start_time,ppid,cmd --sort=start_time | awk -v curpid=$$ '$1!=curpid && $3!=curpid {print $1}' | tail -1

exit
