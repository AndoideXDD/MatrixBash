#!/bin/bash
separador=$1
file1=$2
file2=$3
result=""
columns=$(tail -1 $file1 | awk  -F "$separador" '{print NF}')
rm out.txt
for ((colum=1;colum<=$columns; colum++ )) 
do
    awk  -F "$separador" 'FNR==NR  {a[FNR]=$'$colum'; next} {a[FNR]+=$'$colum'} 
    END {column=a[1] ; for (i=2; i<='$columns'; i++) {column=column","a[i]} print column}' $file1 $file2 >> out.txt


done
cat out.txt | rs -c',' -T | tr -s ' ' ',' > result.txt
rm out.txt