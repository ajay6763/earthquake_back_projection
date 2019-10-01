function [ index ] = epicenter_index( e_lat_d,e_lat_u,e_long_d,e_long_u,s_lat,s_long,grd_size )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
e_lat=[];
e_long=[];
for lat=e_lat_d:grd_size:e_lat_u
    for long=e_long_d:grd_size:e_long_u
        e_lat=[e_lat;lat];
        e_long=[e_long;long];
    end
end
%plot(e_lat,e_long,'*')
y_s=length(e_lat_d:grd_size:e_lat_u);
x_s=length(e_long_d:grd_size:e_long_u);

y_n=length(e_lat_d:grd_size:s_lat-grd_size);
x_n=length(e_long_d:grd_size:s_long);

index=(x_s*y_n)+x_n;
end

