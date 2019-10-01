function [ M] = peak_amp(beam,x,y,t_f)
%   Detailed explanation goes here
    %load seismicity.txt;
    %z(1:length(seismicity))=0.000001;
    %z=z';
    [m n]=size(beam);
    temp=[];
    for i=1:n
        [d in]=max(beam(:,i));
        temp(i,4)=d;
        temp(i,1)=i;
        temp(i,2)=x(in);
        temp(i,3)=y(in);
    end
    temp(:,4)=temp(:,4)/max(temp(:,4));
    f_R_G=['peak_energy.txt'];
        fin=fopen(f_R_G,'w');
        for i=1:n
            fprintf(fin,'%f %f %f %f \n ',i,temp(i,2),temp(i,3),temp(i,4));
        end
    fclose(fin);
    fr=1;
for t=1:1:t_f
    cla;
        
    plot(temp(fr,2),temp(fr,3),'o','MarkerSize',10,'MarkerFaceColor','r')
    view(0,90)
    hold on
    plot3(94.84,23.03 ,0,'s','MarkerSize',20,'MarkerEdgeColor','k','MarkerFaceColor','r')
    %hold on
    %plot3(86.177,27.774,10,'s','MarkerSize',20,'MarkerEdgeColor','k','MarkerFaceColor','r')
    %hold on
    %plot3(seismicity(:,1),seismicity(:,2),z,'o','MarkerSize',5,'MarkerEdgeColor','k','MarkerFaceColor','g')
   
    hold off
    %[r in]=max((beam(:,fr)));
    %plot(x(in),y(in),'*','MarkerSize',10,'MarkerEdgeColor','r','MarkerFaceColor','r')
    %hold off
   axis([92 97 20 26])

    shading interp
    %alpha(1)
    view(0,90)
    box on
    %colorbar
    title(['Enery(0.01 - 1 Hz) at seconds = ' num2str(fr)],'FontWeight','bold','FontSize',15,'FontName','Times');
    xlabel('Long/degree','FontWeight','bold','FontSize',13,'FontName','Times');
    ylabel('Lat/degree','FontWeight','bold','FontSize',13,'FontName','Times');
    %zlabel('Depth/km','FontWeight','bold','FontSize',13,'FontName','Times');        grid on 
    drawnow
    M(fr)  = getframe(gcf);
    fr=fr+1;
end     
   
    %plot3(88.136,27.718,10,'s','MarkerSize',20,'MarkerEdgeColor','k','MarkerFaceColor','r')
    %hold on
    %plot3(86.177,27.774,10,'s','MarkerSize',20,'MarkerEdgeColor','k','MarkerFaceColor','r')
    %hold on
    %plot3(seismicity(:,1),seismicity(:,2),z,'o','MarkerSize',5,'MarkerEdgeColor','k','MarkerFaceColor','g')
   view(0,90)
    hold off
end



