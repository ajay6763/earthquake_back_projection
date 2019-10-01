function [  ] = cumulative_plot(beam,x,y,t_s,t_e)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here 
    %load seismicity.txt;
    %z(1:length(seismicity))=1;
    %z=z';
    b=[];
    b=sum(beam(:,t_s:t_e)')';
    b=b./max(max(b')');
    f_R_G=['cumulative_energy.txt'];
        fin=fopen(f_R_G,'w');
        for i=1:length(x)
            fprintf(fin,' %f %f %f \n ',x(i),y(i),b(i));
        end
    fclose(fin);
    foo=fit([x,y],b, 'loess')
    %cptcmap('GMT_hot', 'mapping', 'direct');
    %cptcmap('GMT_hot','ncol', 200) %produces a contour plot with four colors; 
    plot(foo)
    hold on
    plot3(94.9,23.133 ,20,'s','MarkerSize',20,'MarkerEdgeColor','k','MarkerFaceColor','k')
    hold on
    %hold on
    plot3(94.709,23.03,20,'s','MarkerSize',20,'MarkerEdgeColor','b','MarkerFaceColor','b')
    hold on
    %plot3(seismicity(:,1),seismicity(:,2),z,'o','MarkerSize',5,'MarkerEdgeColor','k','MarkerFaceColor','g')
    shading interp
    alpha(1)
    view(0,90)
    box off
    colorbar
    title(['Cumu Energy(0.05 - 0.2 Hz) at seconds = ' num2str(t_s )],'FontWeight','bold','FontSize',15,'FontName','Times');
    xlabel('Long/degree','FontWeight','bold','FontSize',13,'FontName','Times');
    ylabel('Lat/degree','FontWeight','bold','FontSize',13,'FontName','Times');
    %zlabel('Depth/km','FontWeight','bold','FontSize',13,'FontName','Times');      
   
end

