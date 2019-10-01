for i in `seq 1 1 90`
do
ls $i'_0.2_5Hz.ps'
gs -sDEVICE=jpeg -dJPEGQ=100 -dNOPAUSE -dBATCH -dSAFER -r300 -sOutputFile=$i.jpg $i'_0.2_5Hz.ps'
mogrify -trim -resize 800x600 -rotate 90 $i.jpg 
done
