close all 
clear all
disp('Loading data ............')
%% Data loading part
array='SI';
f=['V_' array '.txt']; 
V=load(f);
f=['T_' array '.txt']; 
T=load(f);
f=['stnlat_' array ]; 
stnlat=load(f);
f=['stnlong_' array ]; 
stnlong=load(f);
%evlat=;
%evlong=;
evdp=119;
%%%
len=71980; % length of cut file 
no=length(V)/len; % to get toatal number of stations in the array

%% making matrix form data  
v=[];
t=[];
for i=1:1:no
    j=i-1;
    v(:,i)=V(1+(j*len):(j*len)+len);
    t(:,i)=T(1+(j*len):(j*len)+len);
    
end

disp('')
disp('loading done!')

%% filtering data
%{
bp_l=0.01;
bp_u=8;

[b,a]=butter(3,[bp_l(1,1)/10],'high');
v=filtfilt(b,a,v);
[b,a]=butter(3,[bp_u(1,1)/10],'low');
v=filtfilt(b,a,v);
%}

%% Cross-correlation
Sign_=[];
Time_corr=[];
Corr_coeff=[];
sign=[];
stn_weight=[];
% Calculating time correction and cross_corelation coefficient
for i=1:length(stnlat)
            [r, t_corr,sign]=crosscorr_allign(v(:,1),v(:,i));
            Time_corr=[Time_corr;t_corr];
            Corr_coeff=[Corr_coeff;r];
            Sign_=[Sign_;sign];
end

%%
% station weightage according to denstiy of station within 1 degree radius
for i=1:length(stnlat)
    count=0;
    for j=1:length(stnlat)
        dist=((stnlat(i)-stnlat(j)).^2 + (stnlong(i)-stnlong(j)).^2 ).^(0.2);
        if ( dist <= 1)
            count=count+1;
        else
            continue
        end
    end
    stn_weight(i,1)=count;
    
end
    
%% saving
f_R_G=['Cross_correlation_' array '.txt'];
        fin=fopen(f_R_G,'w');
        for i=1:length(stnlat)
            fprintf(fin,' %e %e %e %e\n ',Time_corr(i),Corr_coeff(i),Sign_(i),stn_weight(i));
        end
fclose(fin);

%saving broad-band data

%fileID = fopen('v_' array '.txt','w');
%fprintf(fileID,'%f %f %5d %5d\n',A)
%fclose(fileID);
save v.txt v -ascii
save t.txt t -ascii
        
