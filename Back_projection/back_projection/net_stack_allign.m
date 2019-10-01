%% allign net stacks
%% net stack visualisation
%AU_net=( sum(AU) ./ max(sum(AU))) ; 
%JP_net=(sum(JP)./max(sum(JP)));
%NI_net=(sum(MN)./max(sum(MN)));
%%KR_net=(sum(KR)./max(sum(KR)));
%AU=importdata('beam_0.2_5Hz_AU_full.txt');
%MN=importdata('beam_0.2_5Hz_NI_full.txt');
%JP=importdata('beam_0.2_5Hz_JP_full.txt');
close all
clear all
%AU=importdata('beam_0.2_5Hz_AU_fine_grd_avg.txt');
%MN=importdata('beam_0.2_5Hz_NI_fine_grd_avg.txt');
%JP=importdata('beam_0.2_5Hz_JP_fine_grd_avg.txt'); 
AU=importdata('beam_0.2_5HZ_AU.txt');
MN=importdata('beam_0.2_5HZ_MN.txt');
JP=importdata('beam_0.2_5HZ_JP.txt'); 
%AF=importdata('beam_0.2_5Hz_AF.txt'); 
index=1318;
%sld_win=100;
win=5;
Sign=[];
corr=[];
dt=[];
[R t]=crosscorr(AU(index,1:win)'./max(AU(index,1:win))',MN(index,1:win)'./max(MN(index,1:win))');
[r in]=max(abs(R));
t=R(in);
if (t < 0)
        sign=-1;
    else
        sign=1;
end
Sign(1,1)=sign;       
corr(1,1)=r;
dt(1,1)=in;

[R t]=crosscorr(AU(index,1:win)'./max(AU(index,1:win))',JP(index,1:win)'./max(JP(index,1:win))');
[r in]=max(abs(R));
t=R(in);
if (t < 0)
        sign=-1;
    else
        sign=1;
end
Sign(2,1)=sign; 
corr(2,1)=r;
dt(2,1)=in;

%[R t]=crosscorr(AU(index,1:win)'./max(AU(index,1:win))',AF(index,1:win)'./max(AF(index,1:win))');
%[r in]=max(abs(R));
%t=R(in);
%if (t < 0)
%        sign=-1;
%    else
%        sign=1;
%end
%Sign(3,1)=sign; 
%corr(3,1)=r;
%dt(3,1)=in;



[m n]=size(AU);
n=n-5;
for i=1:1:m
    AU_corr(i,1:n)=(cut_window( AU(i,:),1,1+n)*1); % %./(stn_w); %.*sign;
    JP_corr(i,1:n)=(cut_window( JP(i,:),dt(1,1),dt(1,1)+n)*Sign(1,1)); %.*sign
    MN_corr(i,1:n)=(cut_window( MN(i,:),dt(1,1),dt(1,1)+n)*Sign(1,1)); %.*sign
    %AF_corr(i,1:n)=(cut_window( AF(i,:),dt(3,1),dt(3,1)+n)*Sign(3,1)); %.*sign
end

    

%[R t]=crosscorr(AU(index,1:5),KR(index,1:5));
%r(3,1)=R(1,1);
%dt(3,1)=t(1,1);


%% net stack visualisation
subplot(2,1,1)
plot( AU_corr(index,:)./max( AU_corr(index,:) ),'b','LineWidth',2);
hold on
plot( JP_corr(index,:)./max( JP_corr(index,:)),'r','LineWidth',2);
hold on
plot(MN_corr(index,:)./max(MN_corr(index,:)),'k','LineWidth',2);
hold on
%plot(AF_corr(index,:)./max(AF_corr(index,:)),'k','LineWidth',2);
subplot(2,1,2)
plot( AU(index,:)./max( AU(index,:) ),'b','LineWidth',2);
hold on
plot( JP(index,:)./max( JP(index,:)),'r','LineWidth',2);
hold on
plot(MN(index,:)./max(MN(index,:)),'k','LineWidth',2);
hold on
%plot(AF(index,:)./max(AF(index,:)),'k','LineWidth',2);

%plot(KR,'c','LineWidth',2);

legend('AU','MN','JP')

xlabel('Time(seconds)','FontWeight','bold','FontSize',13,'FontName','Times');
ylabel('Relative Amplitude','FontWeight','bold','FontSize',13,'FontName','Times');
    title(['STF from differet netwroks'],'FontWeight','bold','FontSize',15,'FontName','Times');
    
  e_lat=[];
e_long=[];
for lat=21:0.05:25
    for long=92:0.05:96
        e_lat=[e_lat;lat];
        e_long=[e_long;long];
    end
end  
beam_sum_corr= (AU_corr.^2)+(MN_corr.^2)+(JP_corr.^2);
h=fspecial('average',[10 10]);
b_corr=filter2(h,beam_sum_corr);

beam_sum_uncorr= (AU.^2)+(MN.^2)+(JP.^2);
h=fspecial('average',[10 10]);
b_uncorr=filter2(h,beam_sum_uncorr);


