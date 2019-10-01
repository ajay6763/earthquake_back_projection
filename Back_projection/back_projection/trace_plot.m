close all
clear all
array='SI';

f=['stack_uncorr_0.2_2HZ_' array '.txt' ]; 
uncorr=load(f);
f=['stack_corr_0.2_2HZ_' array '.txt' ]; 
corr=load(f);

f=['info_matlab_' array '.txt' ]; 
info_matlab=load(f);
[m n]=size(corr);

%% sort traces according to some parameter and store the index for reference
[val in]=sort(info_matlab(:,1));
%% Plotting
st=1;
ed=80;
for i=1:n
    subplot(1,3,1)
    plot(val)
    grid on
    %hold on
    subplot(1,3,2)
    %plot((st:1:ed)*0.05,corr(st:ed,in(i))+i,'k')
    %hold on 
    plot((st:1:ed)*0.05,uncorr(st:ed,in(i))+i,'color', [0 0 0],'LineWidth',1)
    title('Alligned Z component (AU)','FontSize',15,'fontweight','bold','Fontname','Times')
    xlabel('time (s)','FontSize',15,'fontweight','bold','Fontname','Times')
    ylabel('Trace Number','FontSize',15,'fontweight','bold','Fontname','Times')
    hold on
    grid on
    subplot(1,3,3)
    %plot((st:1:ed)*0.05,corr(st:ed,in(i))+i,'k')
    %hold on 
    plot((st:1:ed)*0.05,corr(st:ed,in(i))+i,'color', [0 0 0],'LineWidth',1)
    title('Alligned Z component (AU)','FontSize',15,'fontweight','bold','Fontname','Times')
    xlabel('time (s)','FontSize',15,'fontweight','bold','Fontname','Times')
    ylabel('Trace Number','FontSize',15,'fontweight','bold','Fontname','Times')
    hold on
    grid on
    
end
    %subplot(2,2,1)
    %plot((st:1:ed)*0.05,uncorr(st:ed,:))
    %subplot(2,2,2)
    %plot((st:1:ed)*0.05,corr(st:ed,:))
