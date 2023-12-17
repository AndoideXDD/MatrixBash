#!/bin/bash
separador=$1

awk -F "$separador" 'FNR==NR {
    for(i=0; i<=NF; ++i) a[FNR,i]=$i; next} 
    {for(i=0; i<=NF; ++i) a[FNR,i]+=$i} 
    END {
        for(i=0; i<=NF; ++i) {line=a[i,1]
            for (x=2; x<=FNR; x++) {line=a[i,x]","line};print line; line=""
            } 
             }' matriu.txt matriu2.txt 
