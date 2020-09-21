#!/bin/bash
stringBuilder=""
while read line
do
if [ $line = "q" ]
then 
break
fi
stringBuilder="$stringBuilder$line"
done
echo $stringBuilder
exit