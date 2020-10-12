#!/bin/bash

ps xao pid,cmd | awk -e '$2 ~ "^\/sbin\/.*" {print $1}' > task2.out

exit
