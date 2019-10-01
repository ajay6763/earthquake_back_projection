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


%% Setting grid
disp('Making source grid.......')
e_lat=[];
e_long=[];
for lat=21:0.5:25
    for long=92:0.5:96
        e_lat=[e_lat;lat];
        e_long=[e_long;long];
    end
end


%%normalising
V=[];
for i=1:length(stnlat)
    V(:,i)=v(:,i)./max(abs(v(:,i)));
end
 
clear v;
v=V;
clear V;

%% Cross Correlation on unfilered data
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

%%
bp_l=0.2;
bp_u=5;

[b,a]=butter(3,[bp_l(1,1)/10],'high');
v=filtfilt(b,a,v);
[b,a]=butter(3,[bp_u(1,1)/10],'low');
v=filtfilt(b,a,v);

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
% looping throught all potential source location 
for j=1:length(e_lat)
        %print('Working of elment:')
        % looping through all seismograms (stations)
        stack=[];
        for i=1:length(stnlat)
            T=tauptime('dep',evdp(1),'ph','P','sta',[stnlat(i,1) stnlong(i,1)],'evt',[e_lat(j,1) e_long(j,1)]);
            r=Corr_coeff_f(i); % picking cross-correlation coefiicent
            t_corr=Time_corr_f(i);   % picking time correction
            sign_f=Sign_f(i); % picking sign for radiation pattern correction
            stn_w=Cross_correlation(i,4); % picking station weight in the array
            tvl_t=T.time+t_corr; % correcting for 3D velocity variation in travel time from cross-correlation
            if ( abs(r) >= 0.6)
                 %alliging the seismograms
                %if ( tvl_t >= (P_time(i)+t_corr) )
                    [in sign]=amp_sign(tvl_t,v(:,i),t(:,i));
                          %Stack(j,dur)=amp;
                    stack(1:1000,i)=(cut_window( v(:,i),in,in+1000)*sign_f*abs(r))./(stn_w); %.*sign;
                    
                %else
                %    stack(1:1000,i)=0;
                %end
            else
                stack(1:1000,i)=0;
            end
            %else
            %    stack(1:2000,i)=0;
            %end
        end
        %disp('Source Number Working on:')
        %disp(j)
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

%% saving averaged beam
%fileID = fopen('beam_' bp_l '_' bp_u '_' array '.txt','w');
%fprintf(fileID,'%f %f %5d %5d\n',A)
%fclose(fileID);
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
