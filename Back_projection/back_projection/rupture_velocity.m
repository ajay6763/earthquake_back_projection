% script tomplot rupture velocity
close all
clear all
load  peak_energy_0.2_5Hz.txt
peak=peak_energy_0_2_5Hz;
dist=[];
t=[];
v=[];
d=[];
%dist(1,1)=1;
%dist(1,2)=0;
for j=2:1:length(peak)-1
    i=j;
    dist(i,1)=i;
    t=[t;i];
    % with respect to initial point
    %dist(i,2)=(( ( peak(i,2)-peak(1,2) ).^2 +  ( peak(i,3)-peak(1,3) ).^2 ) .^0.5 )*111;
    
    % cumalative distance
    dist(i,2)=(( ( peak(i,2)-peak(i-1,2) ).^2 +  ( peak(i,3)-peak(i-1,3) ).^2 ) .^0.5 )*111;

    d=[d;dist(i,2)];
    dist(i,3)=dist(i,2)/i;
    v=[v;dist(i,3)];
    %Dist(i,1)=sum(dist(1:i,2));
end


%%%
%{
for i=1:1:80
    Dist(i,1)=i;
    Dist(i,2)=sum(dist(1:i,2));
end
%}
 plot(d,t,'o','MarkerSize',10,'MarkerEdgeColor','k','MarkerFaceColor','b')
 title('Wavefront Velocity ','FontSize',15,'fontweight','bold','Fontname','Times')
 xlabel('Distance (km)','FontSize',15,'fontweight','bold','Fontname','Times')
 ylabel('time (s))','FontSize',15,'fontweight','bold','Fontname','Times')
 grid on
 hold on
 plot(2*(1:90),1:1:90,'b')
 hold on
 plot(2.5*(1:90),1:1:90,'g')
 hold on
 plot(3*(1:90),1:1:90,'k')
 hold on
 plot(3.5*(1:90),1:1:90,'c')
 hold on
 plot(4*(1:90),1:1:90,'r')
 legend('data','2 km/s','2.5 km/s','3 km/s','3.5 km/s', '4 km/s')
%{ 
[x,y] = meshgrid(t,Dist) ;
[m n]=size(x);
Z=[];
count=0;
for i =1:m
    for j=1:n
        count=count+1;
       Z(i,j)=peak(count,3);
    end
end
%}
 f_R_G=['rupture_vel.txt'];
        fin=fopen(f_R_G,'w');
        for i=1:length(t)
            fprintf(fin,'\n %f %f %f %f ',t(i),d(i),v(i),peak(i,4));
        end
    fclose(fin);
 