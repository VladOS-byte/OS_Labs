#!/bin/bash

ps xao pid,cmd | awk -e '$2 ~ /^\/sbin\// {printf $1 " "}' > task2.out

exit
