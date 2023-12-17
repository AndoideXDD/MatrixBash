#!/bin/bash 
value=2
#cat text.txt | awk '{ $1 += $value } END {print $1 }'
#awk -F "," '{ $0 += $1 } END { print $0 }' text.txt
awk -F "," '{print $0+1}' text.txt