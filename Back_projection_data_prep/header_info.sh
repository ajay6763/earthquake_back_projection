#!/bin/bash

# script to list a header values as an array
# for teleseismic array
array=AU
rm P_time_$array stnlat_$array stnlong_$array  az_$array baz_$array gcarc_$array file_name_$array 
for file in cut*?HZ
do
sachead $file T1 >> P_time_$array
sachead $file STLA >> stnlat_$array
sachead $file STLO >> stnlong_$array
sachead $file AZ >> az_$array
sachead $file BAZ >> baz_$array
sachead $file dist >> gcarc_$array
echo $file >> file_name_$array
done
