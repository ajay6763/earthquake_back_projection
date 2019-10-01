function [r  shift sign] = crosscorr_allign(x,y)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
sign=0;

[R dt]=crosscorr(x(500:600,1),y(500:600,1));
[r in]=max(abs(R));
shift=dt(in)*0.05;
t=0;
t=R(in);

if (t < 0)
        sign=-1;
    else
        sign=1;
    end

end

