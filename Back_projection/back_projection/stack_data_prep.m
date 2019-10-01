close all 
clear all
load V.txt
%load R.txt
%load T.txt
v=[];
%r=[];
%t=[];
%len=2401;
%no=272;
len=2801;
no=28;

for i=1:1:no
    j=i-1;
    v(:,j+1)=V(1+(j*len):(j*len)+len);
    %r(:,j+1)=R(1+(j*len):(j*len)+len);
    %t(:,j+1)=T(1+(j*len):(j*len)+len);
end

clear V %R T;
%close all
%clear all
%load Data.txt
v_2_stack=[];
%r_2_stack=[];
%t_2_stack=[];
ind=0;
for i=1:1:no
    %tmp=v(:,i);
    [ind , amp]=max_index(v,400,1200);
    %if (ind >= 1000)
    %    ind=300;
    %end
    %polarity check
    if ( v(ind,i) < 0.0 )
        v_2_stack(:,i)=v(ind-800:ind+1200,i);
        %r_2_stack(:,i)=r(ind-200:ind+800,i).*(-1);
        %t_2_stack(:,i)=t(ind-200:ind+800,i).*(-1);
    else
        v_2_stack(:,i)=v(ind-800:ind+1200,i);
%        r_2_stack(:,i)=r(ind-200:ind+800,i);
%        t_2_stack(:,i)=t(ind-200:ind+800,i);
    end
    % normalising with respect to the vertical component max amplitude
    %enrg_v= v_2_stack(:,i).^2;
    %enrg_r= r_2_stack(:,i).^2;
    %enrg_t= t_2_stack(:,i).^2;
    %enrg_total= enrg_v() + enrg_r + enrg_t; 
    % enrgy normalisation
    %v_2_stack(:,i)=v_2_stack(:,i)./enrg_total(ind,1);
    %r_2_stack(:,i)=r_2_stack(:,i)./enrg_total(ind,1);
    %t_2_stack(:,i)=t_2_stack(:,i)./enrg_total(ind,1);
    %max(v_2_stack(:,i))
    %v_2_stack(:,i)=v_2_stack(:,i)./max(v_2_stack(:,i));
    %r_2_stack(:,i)=r_2_stack(:,i)./max(r_2_stack(:,i));
    %t_2_stack(:,i)=t_2_stack(:,i)./max(t_2_stack(:,i));
    %v_2_stack(:,i)=v_2_stack(:,i)./max(v_2_stack(160:240,i));
    %r_2_stack(:,i)=r_2_stack(:,i)./max(r_2_stack(160:240,i));
    %t_2_stack(:,i)=t_2_stack(:,i)./max(t_2_stack(160:240,i));
    
    clear tmp ind enrg_v %enrg_r enrg_t enrg_total;
end
%save v_2_stack.txt v_2_stack -ascii 
%save r_2_stack.txt r_2_stack -ascii 
%save t_2_stack.txt t_2_stack -ascii 
%subplot(3,1,1)
plot(v_2_stack)
%subplot(3,1,2)
%plot(r_2_stack)
%subplot(3,1,3)
%plot(t_2_stack)

