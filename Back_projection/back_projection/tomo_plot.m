close all
clear all
load Topo.txt;
%load Q_result.txt
load NE_IBCZ_seismicity.txt
cat=NE_IBCZ_seismicity(:,5:7);
load 01_output.txt
tomo=X01_output;
%tomo=Q_result;
[x,y,z] = meshgrid(min(tomo(:,1)):0.2:max(tomo(:,1)),min(tomo(:,2)):0.2:max(tomo(:,2)),-(min(tomo(:,3)):2:max(tomo(:,3))));
[m n p]=size(x);
Z=[];
count=0;
for i =1:m
    for j=1:n
        for k=1:p
            count=count+1;
            %count
            %Z(i,j,k)=tomo(count,4)-150; %mean(tomo(:,4))-tomo(count,4);
            Z(i,j,k)=tomo(count,4);
        end
    end
end
xslice=[] %[max(tomo(:,1)) ] %[(max(tomo(:,1))+min(tomo(:,1)))/2 ]  %[max(tomo(:,1)) max(tomo(:,1)) ]  %[86.8 89.2] %[(max(tomo(:,1))+min(tomo(:,1)))/2 ]% (min(tomo(:,1))+max(tomo(:,1)))/2;
yslice=[23] %[max(tomo(:,2)) ]%[(max(tomo(:,2))+min(tomo(:,2)))/2 ] %[max(tomo(:,2)) max(tomo(:,2))] %[(max(tomo(:,2))+min(tomo(:,2)))/2] %(min(tomo(:,2))+max(tomo(:,2)))/2;
zslice=[] % [-54 -((max(tomo(:,3))+min(tomo(:,3)))/2) ] %[-54 -80] %[-min(tomo(:,3)) -min(tomo(:,3)) ]%[-(min(tomo(:,3))+max(tomo(:,3)))/2];
%%%%%%%%%%%%% for inclined plane
% need to think about this more
%[xs,ys]=meshgrid(min(tomo(:,1)):0.5:max(tomo(:,1)),min(tomo(:,2)):0.5:max(tomo(:,2)));
%zs=-xs-ys;
%slice(x,y,z,Z,xs,ys,zs)
%figure
% loading seismicity
seis=seismicity(cat,yslice);
% loading topography
%topo=topography(Topo,yslice);
topo=topography_3D(Topo);
%plotting
%subplot(2,1,1)
%subplot 211
foo=fit([topo(:,1),topo(:,2)],topo(:,3)/100, 'cubicinterp')
cptcmap('GMT_coda', 'mapping', 'direct');
%plot(foo)
%hold on
%plot3(topo(:,1),topo(:,2),topo(:,3))
%axis([89 95 20 29 -0.5 6])
%axis tight
%colorbar
%shading interp
%box off
%grid on
%view(-90,0) %for long
%view(3)
%title(['3D CODA Q Tomo Lat = ' num2str(yslice)],'FontWeight','bold','FontSize',15,'FontName','Times');
%xlabel('Long/degree','FontWeight','bold','FontSize',13,'FontName','Times');
%ylabel('Lat/degree','FontWeight','bold','FontSize',13,'FontName','Times');
%zlabel('Elevation/m','FontWeight','bold','FontSize',13,'FontName','Times');
%cptcmap('GMT_coda', 'mapping', 'scaled');

%subplot 212
%contourslice(x,y,z,Z,xslice,yslice,zslice,300)
plot(foo)
shading interp
axis([88 95 22.8 29 0 20])

hold on
slice(x,y,z,Z,xslice,yslice,zslice);
shading interp
%view(-90,0) %for long
view(3)
box off
axis([88 95 22.8 29 -400 100])
%axis tight
colorbar
title(['3D CODA Q Tomo lat = ' num2str(yslice)],'FontWeight','bold','FontSize',15,'FontName','Times');
xlabel('Long/degree','FontWeight','bold','FontSize',13,'FontName','Times');
ylabel('Lat/degree','FontWeight','bold','FontSize',13,'FontName','Times');
zlabel('Depth/km','FontWeight','bold','FontSize',13,'FontName','Times');
%hold off
hold on
plot3(seis(:,2),seis(:,1),-seis(:,3),'p','MarkerSize',1.5,'MarkerEdgeColor','k','MarkerFaceColor','k')

hold off


%cptcmap('GMT_coda', 'mapping', 'direct');
%slice(x,y,z,Z,xslice,yslice,zslice);
%axis([88.5 95.5 21.5 28.5 -400 0])
%contourslice(x,y,z,Z,[],[24],[],50)
%isosurface(x,y,z,Z,110)
%isosurface(x,y,z,Z,120)
%isosurface(x,y,z,Z,130)
%isosurface(x,y,z,Z,150)
%isosurface(x,y,z,Z,180)
%isosurface(x,y,z,Z,200)
%isosurface(x,y,z,Z,220)
%isosurface(x,y,z,Z,240)
%isosurface(x,y,z,Z,250)
%isosurface(x,y,z,Z,260)
%isosurface(x,y,z,Z,270)
%isosurface(x,y,z,Z,280)
%isosurface(x,y,z,Z,290)
%isosurface(x,y,z,Z,300)
%isosurface(x,y,z,Z,320)
%h=patch(isosurface(x,y,z,Z,200))
%set(h,'FaceColor','g','EdgeColor','none')
%view(3)
%light
%camproj perspective
%lighting gouraud
%alpha(0.75) % transparency

%%%%%% Gradient of the data
%[u,v,w]=gradient(Z);
%%% grabbing slice
%hslice=slice(x,y,z,Z,[92],[25],[]);
%set(hslice,'EdgeColor','none','FaceColor','interp')
%%% grabing iso surface
iso=isosurface(x,y,z,Z,150);
%p=patch(iso);
%set(p,'FaceColor','flat','EdgeColor','none');

%%%% stream slices
%stream_=streamslice(x,y,z,u,v,w,[92],[25],[])
%set(stream_,'Color','r')
%%% adding stream tude
%htubes=streamtube(x,y,z,u,v,w,[92],[24],[])

%grid on
%box on
%colorbar
%shading interp
%colorbarhold on
%load eq_to_plt.txt %sikkim_eq_him_paper.txt
%eq=sikkim_eq_him_paper;
%eq=eq_to_plt;
%plot3(eq(:,2),eq(:,1),-eq(:,3),'p','MarkerSize',5,'MarkerEdgeColor','r','MarkerFaceColor','r')
%axis tight
%title('3D CODA Q Tomo','FontWeight','bold','FontSize',15,'FontName','Times');
%xlabel('Long/degree','FontWeight','bold','FontSize',13,'FontName','Times');
%ylabel('Lat/degree','FontWeight','bold','FontSize',13,'FontName','Times');
%zlabel('Depth/km','FontWeight','bold','FontSize',13,'FontName','Times');
%box on
%h.FaceColor = 'interp';
%h.EdgeColor = 'none';
%h.DiffuseStrength = 0.8;