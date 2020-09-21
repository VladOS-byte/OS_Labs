#!/bin/bash
grep "(WW)" /var/log/anaconda/X.log | sed 's/(WW)/Warning:/g' > full.log
grep "(II)" /var/log/anaconda/X.log | sed 's/(II)/Information:/g' >> full.log
exit
