#!/bin/bash
#### to convert outpur from matlab in individual files and  renaming the alligned files according to there event names so to keep track of them and convert them into sac format
## master list is in event_index
info=data_info.txt
data_corr=stack_corr_AU.txt
data_uncorr=stack_uncorr_AU.txt
l=`wc -l  $info|awk '{print $1}'`
seq 1 $l >t
for i in `cat t`
do
#echo $i
name=`cat $info|awk -v var=$i 'FNR==var{print $1}'`
DIST=`cat $info|awk -v var=$i 'FNR==var{print $2}'`
AZ=`cat $info|awk -v var=$i 'FNR==var{print $3}'`
GCARC=`cat $info|awk -v var=$i 'FNR==var{print $4}'`
echo $name
echo $DIST
echo $AZ
echo $GCARC

cat $data_corr|awk -v var=$i '{print $var}'>temp_corr
cat $data_uncorr|awk -v var=$i '{print $var}'>temp_uncorr

amp2sac  temp_corr temp_corr.sac 0.05
amp2sac  temp_uncorr temp_uncorr.sac 0.05
sac<<!
r temp_corr.sac temp_uncorr.sac
ch DIST ${DIST}
ch AZ ${AZ}
ch BAZ ${BAZ}
ch GCARC ${GCARC}
wh
q
!
mv temp_corr.sac 'corr_'$name
mv temp_uncorr.sac 'uncorr_'$name
done
