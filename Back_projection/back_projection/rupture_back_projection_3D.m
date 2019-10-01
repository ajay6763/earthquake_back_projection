close all 
clear all
disp('Loading data ............')
%% Data loading part
array='AU';
f=['v_' array '.txt']; 
v=load(f);
f=['t_' array '.txt']; 
t=load(f);
f=['stnlat_' array ]; 
stnlat=load(f);
f=['stnlong_' array ]; 
stnlong=load(f);
f=['P_time_' array ]; 
P_time=load(f);

f=['Cross_correlation_' array '.txt']; 
Cross_correlation=load(f);
%evlat=;
%evlong=;
evdp=119;
% for arrya rerponse
%for l=1:76
%    V(:,l)=v(:,23);
%end
%clear v
%v=V;

%% filtering data
bp_l=0.05;
bp_u=0.2;

[b,a]=butter(3,[bp_l(1,1)/10],'high');
v=filtfilt(b,a,v);
[b,a]=butter(3,[bp_u(1,1)/10],'low');
v=filtfilt(b,a,v);

disp('')
disp('loading done!')
%% Setting grid
disp('Making source grid.......')
e_lat=[];
e_long=[];
dp=[];
for long=93:0.5:96
    for lat=23:1:26
        for d=110:10:160
            e_lat=[e_lat;lat];
            e_long=[e_long;long];
            dp=[dp;d];
        end
    end
end


%% Cross Correlation on filered data
Sign_f=[];
Time_corr_f=[];
Time_corr=[];
Corr_coeff_f=[];
Corr_coeff=[];
sign=[];
for i=1:length(stnlat)
            [r, t_corr,sign]=crosscorr_allign(v(:,2),v(:,i));
            Time_corr_f=[Time_corr_f;t_corr];
            Corr_coeff_f=[Corr_coeff_f;r];
            Sign_f=[Sign_f;sign];
end
%e_lat=[27:0.5:28]';
%e_long=[86:0.5:89]';
disp('Source grid making done!')

%%  Normalising
V=[];
for i=1:length(stnlat)
    V(:,i)=v(:,i)./max(v(:,i));
end
 
clear v;
v=V;
clear V;

%% back projection
% for back projection I have to swtch to the seizmo or whatever tool where
% in  I can use taup tool * need to figure this later set path or something
%.
disp('')
disp('Back projection starts here..........')
beam=[];
amp=[];
sign=[];
T_corr=[];            
% looping throught all source elements
for j=1:length(e_lat)
        %print('Working of elment:')
        % looping through all seismograms (stations)
        stack=[];
        for i=1:length(stnlat)
            T=tauptime('dep',dp(j,1),'ph','P','sta',[stnlat(i,1) stnlong(i,1)],'evt',[e_lat(j,1) e_long(j,1)]);
            r=Cross_correlation(i,2);
            t_corr=Time_corr_f(i);   %Cross_correlation(i,1);
            sign_f=Sign_f(i);
            stn_w=Cross_correlation(i,4);
            tvl_t=T.time+t_corr;
            [in sign]=amp_sign(tvl_t,v(:,i),t(:,i));
            stack(1:1000,i)=(cut_window( v(:,i),in,in+1000)*sign_f)./(stn_w); %.*sign;
        end
        disp('Source Number Working on:')
        disp(j)
        temp=(sum(stack')');
        %f_V_G=['source_no' num2str(j) '_.txt' ]; 
        %fin=fopen(f_V_G,'w');
        %for k=1:length(stack)
        %    fprintf(fin,' %e %e \n',k*0.05,temp(k,1));
        %end
        %fclose(fin);
        %temp=temp./max(temp);
        beam(j,:)=temp(:,1);
        clear temp;
    end
    
    
 temp=[];
for l=1:50
    temp(:,l)=beam_avg(beam(:,(l/0.05)-19:l/0.05),1,20);
end

%temp_avg=[];

%for l=1:1:90
%    if (l == 1)
%        temp_avg(:,l)=beam_avg(beam(:,l:5),1,5);
%    else
%       temp_avg(:,l)=beam_avg(beam(:,l:l+5),1,5); 
%    end
%end

%temp=[];    
%for i=1:12
%    f=['source_no' num2str(i) '_.txt'];
%    temp=importdata(f);
%    beam(i,:)=temp(:,2);
%    clear temp;
%end
    
    
 % beam(j,dur)=stack;
    %end
%beam(:,dur)=beam(:,dur)./max(beam(:,dur));    
%end
%
%[m n]=size(beam);
%temp=[];
%for i=1:m
%    d=max(beam(:,i));
%    temp(:,i)=beam(:,i)./d;
%end
    
    %% Plotting part not final yet
%[m n]=size(beam);
%    temp=[];
%    for i=1:n
%        [d in]=max(beam(:,i));
%        temp(i,4)=d;
%        temp(i,1)=i;
%        temp(i,2)=x(in);
%        temp(i,3)=y(in);
%    end
