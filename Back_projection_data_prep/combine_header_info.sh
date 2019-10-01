#!/bin/bash

################
### Script to convert ISC form catalog to the catlog form used in obspy (as Christian's programms )
###################
array=SI;
rm -f fish1 fish2 fish3 


awk 'NR==FNR{a[NR]=$0 " "; next} {print a[FNR], $0 " "}' file_name_$array gcarc_$array  > fish1
awk 'NR==FNR{a[NR]=$0 " "; next} {print a[FNR], $0 " "}' fish1  az_$array > fish2
#awk 'NR==FNR{a[NR]=$0 " "; next} {print a[FNR], $0 " "}' fish2  delta_$array > fish3
awk 'NR==FNR{a[NR]=$0 " "; next} {print a[FNR], $0 " "}' fish2 baz_$array  > 'data_info_'$array'.txt'

rm -f fish1 fish2 fish3 


 
