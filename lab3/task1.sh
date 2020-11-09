#!/bin/bash

mkdir ~/test && {
echo "catalog test was created successfully" > ~/report
touch ~/test/$(date +"%d:%m:%Y_%T")
}

ping www.net_nikogo.ru || echo $(date +"%d:%m:%Y_%T")" ping failed" >> ~/report

exit
