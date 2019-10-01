function [ topo ] = topography( cat_ , par_ )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
topo=[];
i=0;
j=0;
l=length(cat_)
for i=1:l
    if ( cat_(i,2) >= (par_-0.05) && cat_(i,2) <= (par_+0.05))
        topo=[topo;cat_(i,:)];
    end
end

        
    

end