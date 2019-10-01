function [ topo ] = topography_3D( cat_)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
topo=[];
i=0;
j=0;
l=length(cat_)
for i=1:l
    if ( cat_(i,1) >= 84 && cat_(i,1) <= 87 && cat_(i,2) >= 27 && cat_(i,2) <= 29 )
        topo=[topo;cat_(i,:)];
    end
end

        
    

end