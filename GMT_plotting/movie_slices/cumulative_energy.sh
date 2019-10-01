cp time_slice_1.txt out;
for i in `seq 1 1 100`
do
#peak_energy=peak_energy_0.2_3Hz.txt
infile=time_slice_$i.txt 
out=cat |awk '{print $3}';

#stf=stf_0.2_5Hz_average_25_10.txt

