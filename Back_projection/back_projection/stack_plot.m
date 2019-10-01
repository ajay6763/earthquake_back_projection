close all
clear all

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

%load Cross_correlation.txt
  %v=bp_v;

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
            [r, t_corr,sign]=crosscorr_allign(v(:,60),v(:,i));
            Time_corr_f=[Time_corr_f;t_corr];
            Corr_coeff_f=[Corr_coeff_f;r];
            Sign_f=[Sign_f;sign];
end

%%
bp_l=0.2;
bp_u=2;

[b,a]=butter(3,[bp_l(1,1)/10],'high');
v=filtfilt(b,a,v);
[b,a]=butter(3,[bp_u(1,1)/10],'low');
v=filtfilt(b,a,v);
%%
stack_uncorr=[];
  stack_corr=[]
        for i=1:length(stnlat)
            t_corr=Time_corr_f(i);
            sign_f=Sign_f(i);
            p_corr=P_time(i)+t_corr;
            [in]=amp_sign(p_corr,v(:,i),t(:,i));
            stack_corr(1:2000,i)=(cut_window(v(:,i),in-300,in+1700)).*sign_f;
            [in]=amp_sign(P_time(i),v(:,i),t(:,i));
            stack_uncorr(1:2000,i)=cut_window(v(:,i),in-300,in+1700);
            
            
        end
        
 save stack_uncorr_0.2_2HZ_AU.txt stack_uncorr -ascii
  save stack_corr_0.2_2HZ_AU.txt stack_corr -ascii      
        
        
       