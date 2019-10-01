for file in 2*Z
do
#name=`echo  $file|awk -FV '{print $1}'`
#fv=${name}'V.sac'
#fr=${name}'R.sac'
#ft=${name}'T.sac'
sac<<!
r $file
qdp off
cut T1 -30 +150
r
rmean
rtr
w prepend cut_
cut off
q
!
done



