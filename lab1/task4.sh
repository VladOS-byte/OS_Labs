#!/bin/bash
if [ $PWD == $HOME ]
then
	echo "$PWD"
	exit 1
else
	echo "Error"
	exit 0
fi
exit