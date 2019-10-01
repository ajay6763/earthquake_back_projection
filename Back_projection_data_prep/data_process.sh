#!/bin/bash

## visual inspection
for file in *??Z
do
#name=`echo  $file|awk -FV '{print $1}'`
#fv=${name}'V.sac'
#fr=${name}'R.sac'
#ft=${name}'T.sac'
sac<<!
r $file
qdp off
ppk
wh
q
!
echo "Want to stack (y/n):"
read ans
if [ $ans == 'y' ]
then
echo "copying"
cp ./$file ./selected
else
echo "Rejecting"
fi
done


