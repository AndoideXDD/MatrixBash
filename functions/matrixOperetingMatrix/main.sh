#!/bin/bash
separador=$1
file1=$2
file2=$3
columns=$(tail -1 $file1 | awk  -F "$separador" '{print NF}')
for ((colum=1;colum<=$columns; colum++ )) 
do
    awk  -F "$separador" 'FNR==NR {a[FNR]=$'$colum'; next} {a[FNR]+=$'$colum'} 
    END {for (i=1; i<=FNR; i++) {print a[i]}}' $file1 $file2
done