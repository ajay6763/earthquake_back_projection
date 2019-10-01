function [ ] = movie_test(beam,x,y)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%cat=NE_IBCZ_seismicity(:,5:7);
fr=1;
cumu_energy=[];
for t=1:1:100
    cla;
    %b=sum(beam(:,t_s:t_e)')';
    beam=beam./max(max(beam')');
    b=beam(:,fr);
   % foo=fit([x,y],b(:,1), 'loess')
    cumu_energy(:,t)=b(:,1);
    f_R_G=['time_slice_abs_' num2str(fr) '.txt'];
        fin=fopen(f_R_G,'w');
        for i=1:length(x)
            fprintf(fin,' \n %f %f %f ',x(i),y(i),b(i,1));
        end
    fclose(fin);
    %cptcmap('GMT_hot', 'mapping', 'direct');
    %cptcmap('GMT_hot','ncol', 10) %produces a contour plot with four colors; 
    %subplot(2,1,1,'align')
    %plot(foo)
    %hold on
    %[r in]=max((beam(:,fr)));
    %plot(x(in),y(in),'*','MarkerSize',10,'MarkerEdgeColor','r','MarkerFaceColor','r')
    %hold off
    %axis([82 88 25 31])

   % shading interp
   % alpha(1)
   % view(0,90)
   % box off
   % colorbar
   % title(['Energy(0.5 - 2 Hz) at seconds = ' num2str(t)],'FontWeight','bold','FontSize',15,'FontName','Times');
   % xlabel('Long/degree','FontWeight','bold','FontSize',13,'FontName','Times');
   % ylabel('Lat/degree','FontWeight','bold','FontSize',13,'FontName','Times');
    %zlabel('Depth/km','FontWeight','bold','FontSize',13,'FontName','Times');        grid on 
   %subplot(2,1,2,'align') 
   
   % stf=sum(beam);
   % stf=stf./max(stf);
   % plot(stf)
   % xlabel('Time(seconds)','FontWeight','bold','FontSize',13,'FontName','Times');
   % ylabel('Relative Amplitude','FontWeight','bold','FontSize',13,'FontName','Times');
   % hold on
    
  %  plot(t,stf(t),'o','MarkerSize',5,'MarkerFaceColor','r')
  %  drawnow
  %  M(fr)  = getframe(gcf);
    fr=fr+1;
end
size(cumu_energy)
cumu=(sum(cumu_energy'))';
size(cumu)
cumu=cumu./(max(cumu));
f_R_G=['cumulative_energy_0.2_5Hz.txt'];
        fin=fopen(f_R_G,'w');
        for i=1:length(x)
            fprintf(fin,' \n %f %f %f ',x(i),y(i),cumu(i,1));
        end
    fclose(fin);
%saving movie
%movie2avi(M,'movie','compression','None','quality',90,'fps',5)
end



