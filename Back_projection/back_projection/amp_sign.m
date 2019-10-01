function [index sign]=amp_sign(tvl_t,v,t)
%UNTITLED Summary of this function goes here
%   this gives the amplitude value at time given s input and it's polarity for data in variable data 
amp=[];
sign=[];   
index_=find(t(:,1) >= tvl_t); % getting the index of time corresponding to the P wave arrival time
if (index_  > 0)
    index=index_(1,1);
    amp=v(index,1);
    
    if (amp < 0)
        sign=-1;
    else
        sign=1;
    end
else
    amp=0;
    sign=0;
    index=1;
end

end
