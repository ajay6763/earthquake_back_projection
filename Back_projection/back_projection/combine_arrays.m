%% to plot back projection from the arrays combined 

bp_l=0.2;
bp_u=5;
f=[ 'beam_0.05_2HZ_AU.txt' ]; 
AU=load(f);
f=[ 'beam_0.05_2HZ_MN.txt' ]; 
MN=load(f);
f=[ 'beam_0.05_2HZ_JP.txt' ]; 
JP=load(f);

bp_l=0.2;
bp_u=5;
f=[ 'beam_0.2_5HZ_AU_avg119dp.txt' ]; 
AU=load(f);
f=[ 'beam_0.2_5HZ_MN_avg119dp.txt' ]; 
MN=load(f);
f=[ 'beam_0.2_5HZ_JP_avg119dp.txt' ]; 
JP=load(f);
%f=[ 'beam_0.5_2Hz_JP_1.txt' ]; 
%JP=load(f);

%normalise the net stacks
AU=(AU)./max(max(abs(AU)));
JP=(JP)./max(max(abs(JP)));
MN=(MN)./max(max(abs(MN)));
%KR=(AU.^2)./max(max(KR.^2));

beam_sum=(AU)+(NI);
beam_sum=(AU)+(MN)+(JP);
beam_mult=(AU.^2).*(KR.^2).*(JP.^2).*(NI.^2);
beam_mult=(AU).*(KR).*(JP).*(NI);
%% net stack visualisation
plot(sum(AU)./max(sum(AU)),'b');
hold on
plot(sum(JP)./max(sum(JP)),'r');
hold on
plot(sum(MN)./max(sum(MN)),'k');
hold on
plot(sum(KR)./max(sum(KR)),'c');
% netwrok weightage
AU=AU./76;
JP=JP./20;
KR=KR./40;
NI=NI./26;

e_lat=[];
e_long=[];
for lat=22:0.05:25
    for long=93:0.05:96
        e_lat=[e_lat;lat];
        e_long=[e_long;long];
    end
end


b=[];
[m n]=size(beam_mult);
for i=1:m
    b(m,:)=beam_mult(m,:)./max(beam_mult(m,:));
end
 

% spatial smoothening 
h=fspecial('average',[20 5]);
b=filter2(h,beam_sum);



% save stf 

stf=(sum(beam_sum_uncorr))';
%stf=(sum(b))';
stf=stf./max(stf);
 f_R_G=['stf_0.05_2Hz.txt'];
        fin=fopen(f_R_G,'w');
        for i=1:length(stf)
            fprintf(fin,'\n %f %f %f ',i,stf(i));
        end
    fclose(fin);



