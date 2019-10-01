#!/bin/bash
rm -f file delta list
for file  in cut_*Z
do
sachead $file delta >>./delta
echo $file >> ./file
done


awk 'NR==FNR{a[NR]=$0 " "; next} {print a[FNR], $0 " "}' file  delta > list


### for decimation
for i in `cat list|awk '{if ($2 == 0.0250000) print $1}'`
do
echo $i
sac<<!
r $i
dec 2
w over
q
!
done

### for deleting data
for i in `cat list|awk '{if ($2 == 1.0000000) print $1}'`
do
echo $i
rm $i
done


