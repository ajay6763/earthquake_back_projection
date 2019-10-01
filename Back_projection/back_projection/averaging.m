%Moving Avergae 2-D filter
%X contains values to be filtered, HL is  
%horizontal while VL is vertical limit.
%HL adds columns and VL adds rows to padded matrix
function [y]=m2_filter(x,hl,vl) 
if nargin<2
    hl=1;
    vl=1;
end    
if (vl<0)|(hl<0)
    error('limits must be positive')
end

x=im2double(x);
[row col space]=size(x);    %Checking size of input
y=0*x;     %output of same size and type as input

for s=1:space   %For computation across all layers
    x_pad=zeros(row+2*vl,col+2*hl); %Padded Matrix (hl increase col)
    x_pad(1+vl:row+vl,1+hl:col+hl)=x(:,:,s);  
        for i=1+vl:row+vl     %Going through rows
            for j=1+hl:col+hl     %Going through values one by one
                y(i-vl,j-hl,s)=sum(x_pad(i,j-hl:j+hl))+sum(x_pad(i-vl:i+vl,j));
                 %Summing Values around current entry according 2 vl and hl
                y(i-vl,j-hl,s)=y(i-vl,j-hl,s)-x_pad(i,j);%Current Values gets added
                %twice. Once in row and once in Col
                
            end
    end
    
end
y=y/(2*hl+2*vl+1);
y=im2uint8(y);


