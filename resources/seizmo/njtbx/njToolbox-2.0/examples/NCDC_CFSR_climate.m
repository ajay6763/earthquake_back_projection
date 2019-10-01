% NCDC_CFSR_CLIMATE
% Script to get NCDC CFSR (Climate Forecast System Reanalysis) data

% Author: rsignell@usgs.gov

% Step 1. Browse the data at http://nomads.ncdc.noaa.gov/thredds, find the
% dataset you want, click it, then under "Access", click the "OPENDAP" link.
% This brings up the OpenDAP "Dataset Access Form".
% Copy (ctrl+A) the "Data URL" and paste it into a string in Matlab.
url='http://nomads.ncdc.noaa.gov/thredds/dodsC/cfsr1hr/197901/tmp2m.gdas.197901.grb2';

% Open the URL with njTBX (http://njtbx.sourceforge.net)
nc=mDataset(url)
getVars(nc)
%t=nc{'Temperature'}(end,1,:,:); % can use matlab indexing to get data
%g=nc{'Temperature'}(end,1,:,:).grid; % get lon/lat/time/depth of data
var='Temperature';
nc{var}
klevel=1;  %there is only 1 vertical level

% get time values for variable Temperature
jd=nj_time(nc,var);

% print start and end times
datestr(jd([1 end]))

% We want to subset a lon/lat range of interest
bbox=[-15 15 40 60]; % france & uk
[lon,lat]=nj_lonlat(nc,var);

% find indices in range of lon/lat
ii=find(lon>=bbox(1) & lon<=bbox(2));
jj=find(lat>=bbox(3) & lat<=bbox(4));

% Just for demonstration, want to subset on time as well
itime=date_index(jd,[1979 1 10 0 0 0],[1979 1 11 0 0 0]);

% Extract data
t=nc{var}(itime,klevel,jj,ii);
% Extract corresponding Grid (lon,lat,z,time)
g=nc{var}(itime,klevel,jj,ii).grid;

% plot 10th time step from returned data
figure(1);
pcolorjw(g.lon,g.lat,double(squeeze(t(10,:,:))));
colorbar;
title(sprintf('CFSR %s (%s) on %s at %3.0f m',var,nc{var}.units,datestr(g.time(10)),g.z));
dasp(50);  % set aspect ratio
%coast=load('c:\downloads\ukcoast.dat');
%line(coast(:,1),coast(:,2));
%%
% Oops! By inspecting the plot, it's clear we only have data >0, not <0.
% This is because the longitude value in this dataset
% go from 0-360 instead of the -180 to 180 we expected.  Now we need to
% get the other piece of data
ii2=find(lon>=bbox(1)+360 & lon<=bbox(2)+360);
% Extract 2nd piece of data
t2=nc{var}(itime,klevel,jj,ii2);
% Extract corresponding Grid (lon,lat,z,time)
g2=nc{var}(itime,klevel,jj,ii2).grid;

% plot 10th time step from returned data
figure(2);
pcolorjw(g2.lon,g2.lat,double(squeeze(t2(10,:,:))));
colorbar;
title(sprintf('CFSR %s (%s) on %s at %3.0f m',var,nc{var}.units,datestr(g.time(10)),g.z));
dasp(50);  % set aspect ratio

% put the two pieces together. '[A B]' joins across the 2nd
% dimension, but we want to join across the 3rd (lon) dimension
% so we use shiftdim to shift lon to 2nd dimension, then shift the result
% back
t_both=shiftdim([shiftdim(t2,1) shiftdim(t,1)],2);
lon_both=[lon(ii2)-360; lon(ii)];
lat_both=g.lat;
% plot 10th time step from returned data
figure(3);
pcolorjw(lon_both,lat_both,double(squeeze(t_both(10,:,:))));
colorbar;
title(sprintf('CFSR %s (%s) on %s at %3.0f m',var,nc{var}.units,datestr(g.time(10)),g.z));
dasp(50);  % set aspect ratio
set(gcf,'color','white')
set(gca,'tickdir','out');
xlabel('Longitude');
ylabel('Latitude');
% Download coastline from http://coastline.ngdc.noaa.gov/
%coast=load('c:\downloads\ukcoast.dat');
%line(coast(:,1),coast(:,2),'color','black');

%Close dataset when finished (important when URL is a local file name)
close(nc)