function [index,tmp_]=max_index( A, str,end_)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%index=0;
tmp=A(str:end_,1);
tmp_=max(abs(tmp));
for i=1:length(A)
    %disp(A(i,1))
    if (tmp_ == abs(A(i,1)))
        index=i;
    end
end

end

