load v.txt
%load gcarc
load az
load baz
load dist
ff_=[]
for i=1:length(az)
    ff_(:,i)=abs(fft(v(550:1200,i)));
    ff(:,i)=ff_(:,i)*dist(i);
end

 sps=40;
 f=(0:length(ff_)/2-1)*sps(1,1)/length(ff_);
 f=f'; 
 