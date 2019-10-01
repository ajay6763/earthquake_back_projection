%%% script to calculate STF
 h=fspecial('average',[1 100]);

array='AU';
f=['stack_uncorr_0.05_2HZ_' array '.txt' ]; 
uncorr=load(f);
f=['stack_corr_0.05_2HZ_' array '.txt' ]; 
corr=load(f);
%{
array='AU';
f=['stack_uncorr_' array '.txt' ]; 
uncorr=load(f);
f=['stack_corr_' array '.txt' ]; 
corr=load(f);
array='AU';
f=['stack_uncorr_' array '.txt' ]; 
uncorr=load(f);
f=['stack_corr_' array '.txt' ]; 
corr=load(f); 
%}
%% plot
st=300;
ed=1500;
subplot(3,2,1)
    plot((st-st:1:ed-st)*0.05,corr(st:ed,:),'color', [0 0 0],'LineWidth',1)
    title('Alligned Z component (AU)','FontSize',15,'fontweight','bold','Fontname','Times')
    xlabel('time (s)','FontSize',15,'fontweight','bold','Fontname','Times')
    ylabel('Amplitude','FontSize',15,'fontweight','bold','Fontname','Times')
    %hold on
subplot(3,2,2)
    [m n]=size(corr);
    stf_AU=sum(corr(st:ed,:)').^2./max(sum(corr(st:ed,:)').^2);
    stf_AU=filter2(h,stf_AU);
    
    plot((st-st:1:ed-st)*0.05,stf_AU,'color', [0 0 0],'LineWidth',1)
    title('STF (AU)','FontSize',15,'fontweight','bold','Fontname','Times')
    xlabel('time (s)','FontSize',15,'fontweight','bold','Fontname','Times')
    ylabel('Amplitude','FontSize',15,'fontweight','bold','Fontname','Times')
    hold on
  array='JP';
f=['stack_uncorr_0.05_2HZ_' array '.txt' ]; 
uncorr=load(f);
f=['stack_corr_0.05_2HZ_' array '.txt' ]; 
corr=load(f);
subplot(3,2,3)
    plot((st-st:1:ed-st)*0.05,corr(st:ed,:),'color', [0 0 0],'LineWidth',1)
    title('Alligned Z component (JP)','FontSize',15,'fontweight','bold','Fontname','Times')
    xlabel('time (s)','FontSize',15,'fontweight','bold','Fontname','Times')
    ylabel('Amplitude','FontSize',15,'fontweight','bold','Fontname','Times')
subplot(3,2,4)
   [m n]=size(corr);
    stf_JP=sum(corr(st:ed,:)').^2./max(sum(corr(st:ed,:)').^2);
    stf_JP=filter2(h,stf_JP);

    plot((st-st:1:ed-st)*0.05,stf_JP,'color', [0 0 0],'LineWidth',1)
    title('STF (JP)','FontSize',15,'fontweight','bold','Fontname','Times')
    xlabel('time (s)','FontSize',15,'fontweight','bold','Fontname','Times')
    ylabel('Amplitude','FontSize',15,'fontweight','bold','Fontname','Times')
    hold on
array='MN';
f=['stack_uncorr_0.05_2HZ_' array '.txt' ]; 
uncorr=load(f);
f=['stack_corr_0.05_2HZ_' array '.txt' ]; 
corr=load(f);
subplot(3,2,5)
    plot((st-st:1:ed-st)*0.05,corr(st:ed,:),'color', [0 0 0],'LineWidth',1)
    title('Alligned Z component (MN)','FontSize',15,'fontweight','bold','Fontname','Times')
    xlabel('time (s)','FontSize',15,'fontweight','bold','Fontname','Times')
    ylabel('Amplitude','FontSize',15,'fontweight','bold','Fontname','Times')
subplot(3,2,6)
    [m n]=size(corr);
    stf_MN=sum(corr(st:ed,:)').^2./max(sum(corr(st:ed,:)').^2);
    stf_MN=filter2(h,stf_MN);

    plot((st-st:1:ed-st)*0.05,stf_MN,'color', [0 0 0],'LineWidth',1)
    title('STF (JP)','FontSize',15,'fontweight','bold','Fontname','Times')
    xlabel('time (s)','FontSize',15,'fontweight','bold','Fontname','Times')
    ylabel('Amplitude','FontSize',15,'fontweight','bold','Fontname','Times')
    hold on
    
    
    %% final stf
    stf=(stf_AU(:)+stf_JP(:)+stf_MN(:))
    %h=fspecial('average',[20 1]);
    %STF=filter2(h,stf);
  
   %% saving STF
     f_R_G=['stf_0.05_2HZ.txt'];
        fin=fopen(f_R_G,'w');
        for i=1:length(stf)
            fprintf(fin,'\n %f %f %f ',i*0.05,stf(i));
        end
    fclose(fin);

  