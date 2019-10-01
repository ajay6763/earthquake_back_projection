function [ out ] =cut_window( in,st,en )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
out=[];
for i=1:(en-st)
   out(i)=in(st+i);
end


end

