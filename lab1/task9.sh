#!/bin/bash

wc -l $(find /var/log -maxdepth 1 -type f -name "*.log") | tail -1 | awk '{print $1}'

exit