#!/bin/bash


array=SI
for file in cut_*Z
do 
echo $file
sac2xy $file $file'.xy'
cat $file.xy|awk '{print $2}' >>./V_$array.txt
cat $file.xy|awk '{print $1}' >>./T_$array.txt

done
