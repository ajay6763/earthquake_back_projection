function [ ] = peak_amp(beam,x,y)
%   Detailed explanation goes here
    load seismicity.txt;
    z(1:length(seismicity))=10;
    z=z';
    [m n]=size(beam);
    temp=[];
    for i=1:n
        [d in]=max(beam(:,i));
        temp(i,4)=d;
        temp(i,1)=i;
        temp(i,2)=x(in);
        temp(i,3)=y(in);
    end
    %temp(:,4)=temp(:,4)./max(temp(:,4));
    foo=fit([temp(:,2),temp(:,3)],temp(:,4), 'loess')
    cptcmap('GMT_hot', 'mapping', 'direct');
    %cptcmap('GMT_hot','ncol', 10) %produces a contour plot with four colors; 
    plot(foo)
    hold on
    plot3(84.700,28.100,10,'s','MarkerSize',20,'MarkerEdgeColor','k','MarkerFaceColor','r')
    hold on
    plot3(86.177,27.774,10,'s','MarkerSize',20,'MarkerEdgeColor','k','MarkerFaceColor','r')
    hold on
    plot3(seismicity(:,1),seismicity(:,2),z,'o','MarkerSize',5,'MarkerEdgeColor','k','MarkerFaceColor','g')
    hold off
    shading interp
    alpha(1)
    view(0,90)
    box off  
    axis([84 87 27 29])

    colorbar
%    title(['Peal Energy(0.5 - 3 Hz)'],FontWeight','bold','FontSize',15,'FontName','Times');
    xlabel('Long/degree','FontWeight','bold','FontSize',13,'FontName','Times');
    ylabel('Lat/degree','FontWeight','bold','FontSize',13,'FontName','Times');
    %zlabel('Depth/km','FontWeight','bold','FontSize',13,'FontName','Times');      
   
end



