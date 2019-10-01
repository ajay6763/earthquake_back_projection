%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%cat=NE_IBCZ_seismicity(:,5:7);
fr=1;
load Topo.txt;
topo=topography_3D(Topo);
foo_=fit([topo(:,1),topo(:,2)],topo(:,3)/1000, 'cubicinterp')
cptcmap('GMT_coda', 'mapping', 'direct');

for t=0:1:1
    cla;
    foo=fit([e_long,e_lat],b(:,fr), 'cubicinter')
    %cptcmap('GMT_hot', 'mapping', 'direct');
    plot(foo_)
    shading interp 
    view(0,90)
    hold on
    %cptcmap('GMT_hot','ncol', 10) %produces a contour plot with four colors; 
    plot(foo)
    %hold on
    %[r in]=max((beam(:,fr)));
    %plot(x(in),y(in),'*','MarkerSize',10,'MarkerEdgeColor','r','MarkerFaceColor','r')
    %hold off
    %axis([82 88 25 31])

    shading interp
    alpha(0.2)
    view(0,90)
    box off
    %colorbar
    title(['Energy(0.05 - 0.2 Hz) at seconds = ' num2str(fr)],'FontWeight','bold','FontSize',15,'FontName','Times');
    xlabel('Long/degree','FontWeight','bold','FontSize',13,'FontName','Times');
    ylabel('Lat/degree','FontWeight','bold','FontSize',13,'FontName','Times');
    %zlabel('Depth/km','FontWeight','bold','FontSize',13,'FontName','Times');        grid on 
    drawnow
    M(fr)  = getframe(gcf);
    fr=fr+1;
end

%saving movie
%movie2avi(M,'movie','compression','None','quality',90,'fps',5)




