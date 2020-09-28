#!/bin/bash
a=$1
b=$2
a=$(bc <<< "$a+$b")
b=$(bc <<< "$a-$b")
a=$(bc <<< "$a-$b")
echo $a $b
exit
