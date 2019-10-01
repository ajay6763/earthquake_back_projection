function [ out ] = beam_avg( in,st,en )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
out=[];
out=mean(in(:,st:en)')';



end

