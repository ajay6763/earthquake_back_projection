function [ out ] = slide_Avg( in,win,sps)
%UNTITLED3 Summary of this function goes here
%   This function returns a array with sliding window average where length
%   of window in win and  sps is sampling per second
sld=win/sps;
out=[];
pad=mean(in (length(in)-sld:end) );
for i=1:length(in)
    
    if (i <= (length(in)-sld))
        out(i)=mean(in(i:i+sld));
    else       
        out(i)=pad;
    end
end

