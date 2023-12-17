#!/bin/bash
rm result
file=$1
value=$2
#echo "How you separete the data (',',':',....) ?"
#read separador
separador=$3
operation=$4
outputFile=$5
columns=$(head -1 $file | sed "s/[^$separador]//g" | wc -c) # Calculeiting num of columns 
dataOut=""'$'"1$operation$value" #Define the tipe of operation
for (( i=2; i<=$columns; i++ ))
do
    dataOut="$dataOut,"'$'"$i$operation$value" # Generaiting the sum command for awk with his sintaxys 
done
 
echo "awk -F "$separador" '{print $(echo $dataOut | sed 's/,/","/g')}' $file  > $outputFile" > comand.sh # creating awk comand
bash comand.sh
rm comand.sh
