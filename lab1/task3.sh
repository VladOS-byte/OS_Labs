#!/bin/bash
echo "text menu"
echo
echo "1 nano"
echo "2 vi"
echo "3 links"
echo "4 exit"
echo
echo "press number [1 - 3] to start program"
while read number
do
	case $number in
	1)
		nano
		;;
	2)
		vi
		;;
	3)
		links
		;;
	4)
		exit
		;;
	esac
done
exit