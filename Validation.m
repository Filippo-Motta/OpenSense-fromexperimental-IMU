clear all;
close all;
clc;
addpath('Functions');
%Optoelectronic system
HipAngle_L_OPTO= readmatrix('LHipFilo11');
KneeAngle_L_OPTO= readmatrix('LKneeFilo11');
HipAngle_R_OPTO= readmatrix('RHipFilo11');
KneeAngle_R_OPTO= readmatrix('RKneeFilo11');

%TINYTAG with OpenSense
Addu_TinyTag=readmatrix ('AdduzioneVALFilo11Tiny');
FlexHip_TinyTag=readmatrix ('FlexhipVALFilo11Tiny');
FlexKnee_TinyTag=readmatrix ('FlexkneeVALFilo11Tiny');
Squat_TinyTag=readmatrix ('SquatVALFilo11Tiny');

%XSENS with OpenSense
Addu_Xsens= readmatrix ('AddFilo11Xsens');
FlexHip_Xsens=readmatrix ('FlexhipFilo11Xsens');
FlexKnee_Xsens=readmatrix ('FlexkneeFilo11Xsens');
Squat_Xsens=readmatrix ('SquatFilo11Xsens');

%% Divido il sengale dell'OPTO per i vari movimenti

% SQUAT KNEE ANGLE (asse z) 5 colonna
figure
plot(KneeAngle_R_OPTO(:,3),'r');
hold on
plot(KneeAngle_R_OPTO(:,4),'b');
plot(KneeAngle_R_OPTO(:,5),'g');
hold on
plot(KneeAngle_L_OPTO(:,3),'r');
hold on
plot(KneeAngle_L_OPTO(:,4),'b');
plot(KneeAngle_L_OPTO(:,5),'g');
legend('3', '4', '5','3', '4', '5');
title('Scegli inizio_squat e fine_squat')
[coordinate_squat,~]=ginput(2);

% ADDU HIP ANGLE PARE ESSERE NELLA COLONNA 3 L'ADDUZIONE (asse x)
figure
plot(HipAngle_R_OPTO(:,3),'r');
hold on
plot(HipAngle_R_OPTO(:,4),'b');
plot(HipAngle_R_OPTO(:,5),'g');
legend('X', 'Y', 'Z');
title('scegli inizio_addu')
[inizio_addu,~]=ginput(1);

figure
plot(HipAngle_L_OPTO(:,3),'r');
hold on
plot(HipAngle_L_OPTO(:,4),'b');
plot(HipAngle_L_OPTO(:,5),'g');
legend('X', 'Y', 'Z');
title('scegli fine_addu')
[fine_addu,~]=ginput(1);

% PER FLEX/EXT HIP ANGLE (asse z) 5 colonna
figure
plot(HipAngle_R_OPTO(:,3),'r');
hold on
plot(HipAngle_R_OPTO(:,4),'b');
plot(HipAngle_R_OPTO(:,5),'g');
legend('X', 'Y', 'Z');
title('scegli inizio_flexhip')
[inizio_flexhip,~]=ginput(1);

figure
plot(HipAngle_L_OPTO(:,3),'r');
hold on
plot(HipAngle_L_OPTO(:,4),'b');
plot(HipAngle_L_OPTO(:,5),'g');
legend('X', 'Y', 'Z');
title('scegli fine_flexhip')
[fine_flexhip,~]=ginput(1);

% PER FLEX/EXT KNEE ANGLE (asse z) 5 colonna
figure
plot(KneeAngle_R_OPTO(:,3),'r');
hold on
plot(KneeAngle_R_OPTO(:,4),'b');
plot(KneeAngle_R_OPTO(:,5),'g');
legend('X', 'Y', 'Z');
title('scegli inizio_flexknee')
[inizio_flexknee,~]=ginput(1);

figure
plot(KneeAngle_L_OPTO(:,3),'r');
hold on
plot(KneeAngle_L_OPTO(:,4),'b');
plot(KneeAngle_L_OPTO(:,5),'g');
legend('X', 'Y', 'Z');
title('scegli fine_flexknee')
[fine_flexknee,~]=ginput(1);

close all;
%% taglio
inizio=coordinate_squat(1,1);
fine=coordinate_squat(end,1);
%per lo SQUAT sembra esser la 5 colonna che è coerente con gli altri due
%segnali (valori negativi)
RightOPTO_squat=KneeAngle_R_OPTO(inizio:fine,5);
LeftOPTO_squat= KneeAngle_L_OPTO(inizio:fine,5);
%Per l'ADDUZIONE (La sinistra la prendo con il meno perchè per gli altri due dispositivi prende sempre l'angolo relativo che è negativo)
RightOPTO_add=HipAngle_R_OPTO(inizio_addu:fine_addu,3);
LeftOPTO_add=HipAngle_L_OPTO(inizio_addu:fine_addu,3);
%Per hip felxion
RightOPTO_flexhip=HipAngle_R_OPTO(inizio_flexhip:fine_flexhip,5);
LeftOPTO_flexhip=HipAngle_L_OPTO(inizio_flexhip:fine_flexhip,5);
%Per knee flexion
RightOPTO_flexknee=KneeAngle_R_OPTO(inizio_flexknee:fine_flexknee,5);
LeftOPTO_flexknee=KneeAngle_L_OPTO(inizio_flexknee:fine_flexknee,5);

% Tolgo il primo valore
RightOPTO_squat=RightOPTO_squat-RightOPTO_squat(1,1);
LeftOPTO_squat=LeftOPTO_squat - LeftOPTO_squat(1,1);
RightOPTO_add=RightOPTO_add-RightOPTO_add(1,1);
LeftOPTO_add=LeftOPTO_add - LeftOPTO_add(1,1);
RightOPTO_flexhip=RightOPTO_flexhip-RightOPTO_flexhip(1,1);
LeftOPTO_flexhip=LeftOPTO_flexhip - LeftOPTO_flexhip(1,1);
RightOPTO_flexknee=RightOPTO_flexknee-RightOPTO_flexknee(1,1);
LeftOPTO_flexknee=LeftOPTO_flexknee - LeftOPTO_flexknee(1,1);


%% Estrango i movimenti Xsens e TinyTag calcolati da OpenSense
RightTT_squat=Squat_TinyTag(:,3);
LeftTT_squat=Squat_TinyTag(:,4);
RightX_squat=Squat_Xsens(:,3);
LeftX_squat=Squat_Xsens(:,4);

RightTT_add=Addu_TinyTag(:,3);
LeftTT_add=Addu_TinyTag(:,4);
RightX_add=Addu_Xsens(:,3);
LeftX_add=Addu_Xsens(:,4);

RightTT_flexhip=FlexHip_TinyTag(:,3);
LeftTT_flexhip=FlexHip_TinyTag(:,4);
RightX_flexhip=FlexHip_Xsens(:,3);
LeftX_flexhip=FlexHip_Xsens(:,4);

RightTT_flexknee=FlexKnee_TinyTag(:,3);
LeftTT_flexknee=FlexKnee_TinyTag(:,4);
RightX_flexknee=FlexKnee_Xsens(:,3);
LeftX_flexknee=FlexKnee_Xsens(:,4);

%% SQUAT
%sincro
RightOPTO_squat=-RightOPTO_squat;
RightTT_squat=-RightTT_squat;
%%
[RightX_Squat,RightTT_Squat,RightOPTO_Squat]=Sincronizzazione(RightX_squat,RightTT_squat,RightOPTO_squat);
title('Right leg Squat')
legend('Xsens','TinyTag','OPTO');
ylabel('KneeAngle [°]');
xlabel('Time [s]');

%% Eventuale shift
[~,LOCS]=findpeaks(-RightTT_Squat,'MaxPeakWidth',85,'MinPeakDistance',300);
[~,LOCS2]=findpeaks(-RightOPTO_Squat,'MaxPeakWidth',85,'MinPeakDistance',300);
Delay=LOCS2(1)-LOCS(1);
Delay=-37;
if Delay<0
    zeri=zeros(abs(Delay),1);
    RightTT_squat=RightTT_squat(-Delay:end);
    RightTT_squat=[RightTT_squat; zeri];
else 
    zeri=zeros(Delay,1);
    RightTT_Squat=[zeri; RightTT_Squat];
    RightTT_Squat=RightTT_Squat(1:(length(RightTT_Squat)-Delay));
end

% Check
figure
plot(RightX_Squat);
hold on;
plot(RightTT_Squat);
plot(RightOPTO_Squat);
title('Right Squat');
legend('Xsens','TinyTag','OPTO');
ylabel('KneeAngle [°]');
xlabel('Time [s]');

%%

LeftX_squat=-LeftX_squat;
%%
[LeftX_Squat,LeftTT_Squat,LeftOPTO_Squat]=Sincronizzazione(LeftX_squat,LeftTT_squat,LeftOPTO_squat);
title('Left leg Squat')
legend('Xsens','TinyTag','OPTO');
ylabel('KneeAngle [°]');
xlabel('Time [s]');

%% Eventuale shift
[~,LOCS]=findpeaks(-LeftTT_Squat,'MaxPeakWidth',85,'MinPeakDistance',300);
[~,LOCS2]=findpeaks(-LeftOPTO_Squat,'MaxPeakWidth',85,'MinPeakDistance',300);
Delay=LOCS2(1)-LOCS(1);
Delay=-27;

if Delay<0
    zeri=zeros(abs(Delay),1);
    LeftTT_Squat=LeftTT_Squat(-Delay:end);
    LeftTT_Squat=[LeftTT_Squat; zeri];
else 
    zeri=zeros(Delay,1);
    LeftTT_Squat=[zeri; LeftTT_Squat];
    LeftTT_Squat=LeftTT_squat(1:(length(LeftTT_Squat)-Delay));
end

% Check
figure
plot(LeftX_Squat);
hold on;
plot(LeftTT_Squat);
plot(LeftOPTO_Squat);
title('Left leg Squat');
legend('Xsens','TinyTag','OPTO');
ylabel('KneeAngle [°]');
xlabel('Time [s]');

%% ABSOLUTE VALIDITY

% OPTO E XSENS
tit='Bland Altman plot-Squat R';
label={'Optoelectronic system','Xsens'};
gnames='Measurements';
[~, ~, statstruct_SquatDX_Opto_X]=BlandAltman(RightOPTO_Squat, RightX_Squat,label,tit,gnames,'corrInfo', {'eq';'r2';'RMSE';'p'},'baInfo','SD');
% ICC
M= [RightOPTO_Squat RightX_Squat];
alpha = 1.96*statstruct_SquatDX_Opto_X.differenceSTD;
[ICC_SquatDX_Opto_X, ~, ~, ~, ~, ~, ~] = ICC(M, 'A-1', alpha);
%Coefficiant of Variation Difference
meanOPTO= mean(RightOPTO_Squat);
meanX=mean(RightX_Squat);
stdOPTO= std(RightOPTO_Squat);
stdX=std(RightX_Squat);
CVOPTO=stdOPTO/meanOPTO;
CVX=stdX/meanX;
CVD_SquatDX_Opto_X=(CVOPTO-CVX)*100;

tit='Bland Altman plot-Squat L';
label={'Optoelectronic system','Xsens'};
gnames='Measurements';
[~, ~, statstruct_SquatSX_Opto_X]=BlandAltman(LeftOPTO_Squat, LeftX_Squat,label,tit,gnames,'corrInfo', {'eq';'r2';'RMSE'},'baInfo','SD','axesLimits','tight');
M= [LeftOPTO_Squat LeftX_Squat];
alpha = 1.96*statstruct_SquatSX_Opto_X.differenceSTD;
[ICC_SquatSX_Opto_X, ~, ~, ~, ~, ~, ~] = ICC(M, 'A-1', alpha);
meanOPTO=mean(LeftOPTO_Squat);
meanX=mean(LeftX_Squat);
stdOPTO=std(LeftOPTO_Squat);
stdX=std(LeftX_Squat);
CVOPTO=stdOPTO/meanOPTO;
CVX=stdX/meanX;
CVD_SquatSX_Opto_X=(CVOPTO-CVX)*100;

% OPTO E TINYTAG
tit='Bland Altman plot-Squat R';
label={'Optoelectronic system','TinyTag'};
gnames='Measurements';
[~, ~, statstruct_SquatDX_Opto_TT]=BlandAltman(RightOPTO_Squat, RightTT_Squat,label,tit,gnames,'corrInfo', {'eq';'r2';'RMSE'},'baInfo','SD');
M= [RightOPTO_Squat RightTT_Squat];
alpha = 1.96*statstruct_SquatDX_Opto_TT.differenceSTD;
[ICC_SquatDX_Opto_TT, ~, ~, ~, ~, ~, ~] = ICC(M, 'A-1', alpha);
meanOPTO=mean(RightOPTO_Squat);
meanTT=mean(RightTT_Squat);
stdOPTO=std(RightOPTO_Squat);
stdTT=std(RightTT_Squat);
CVOPTO=stdOPTO/meanOPTO;
CVTT=stdTT/meanTT;
CVD_SquatDX_Opto_TT=(CVOPTO-CVTT)*100;

tit='Bland Altman plot-Squat L';
label={'Optoelectronic system','TinyTag'};
gnames='Measurements';
[~, ~, statstruct_SquatSX_Opto_TT]=BlandAltman(LeftOPTO_Squat, LeftTT_Squat,label,tit,gnames,'corrInfo', {'eq';'r2';'RMSE'},'baInfo','SD','axesLimits','tight');
M= [LeftOPTO_Squat LeftTT_Squat];
alpha = 1.96*statstruct_SquatSX_Opto_TT.differenceSTD;
[ICC_SquatSX_Opto_TT, ~, ~, ~, ~, ~, ~] = ICC(M, 'A-1', alpha);
meanOPTO=mean(LeftOPTO_Squat);
meanTT=mean(LeftTT_Squat);
stdOPTO=std(LeftOPTO_Squat);
stdTT=std(LeftTT_Squat);
CVOPTO=stdOPTO/meanOPTO;
CVTT=stdTT/meanTT;
CVD_SquatSX_Opto_TT=(CVOPTO-CVTT)*100;

% TINYTAG E XSENS
tit='Bland Altman plot-Squat R';
label={'Xsens','TinyTag'};
gnames='Measurements';
[~, ~, statstruct_SquatDX_X_TT]=BlandAltman(RightX_Squat, RightTT_Squat,label,tit,gnames,'corrInfo', {'eq';'r2';'RMSE'},'baInfo','SD');
M= [RightX_Squat RightTT_Squat];
alpha = 1.96*statstruct_SquatDX_X_TT.differenceSTD;
[ICC_SquatDX_X_TT, ~, ~, ~, ~, ~, ~] = ICC(M, 'A-1', alpha);
meanX=mean(RightX_Squat);
meanTT=mean(RightTT_Squat);
stdX=std(RightX_Squat);
stdTT=std(RightTT_Squat);
CVX=stdX/meanX;
CVTT=stdTT/meanTT;
CVD_SquatDX_X_TT=(CVX-CVTT)*100;

tit='Bland Altman plot-Squat L';
label={'Xsens','TinyTag'};
gnames='Measurements';
[~, ~, statstruct_SquatSX_X_TT]=BlandAltman(LeftX_Squat, LeftTT_Squat,label,tit,gnames,'corrInfo', {'eq';'r2';'RMSE'},'baInfo','SD','axesLimits','tight');
M= [LeftX_Squat LeftTT_Squat];
alpha = 1.96*statstruct_SquatSX_X_TT.differenceSTD;
[ICC_SquatSX_X_TT, ~, ~, ~, ~, ~, ~] = ICC(M, 'A-1', alpha);
meanX=mean(LeftX_Squat);
meanTT=mean(LeftTT_Squat);
stdX=std(LeftX_Squat);
stdTT=std(LeftTT_Squat);
CVX=stdX/meanX;
CVTT=stdTT/meanTT;
CVD_SquatSX_X_TT=(CVX-CVTT)*100;

%% Adduction

[RightX_Add,RightTT_Add,RightOPTO_Add]=Sincronizzazione(RightX_add,RightTT_add,RightOPTO_add);
title('Right Hip Adduction');
legend('Xsens','TinyTag','OPTO');
ylabel('HipAngle [°]');
xlabel('Time [s]');

%% Eventuale shift
[~,LOCS]=findpeaks(-RightTT_Add,'MaxPeakWidth',85,'MinPeakDistance',300);
[~,LOCS2]=findpeaks(-RightOPTO_Add,'MaxPeakWidth',85,'MinPeakDistance',300);
Delay=LOCS2(1)-LOCS(1);
Delay=-52;
if Delay<0
    zeri=zeros(abs(Delay),1);
    RightTT_Add=RightTT_Add(-Delay:end);
    RightTT_Add=[RightTT_Add; zeri];
else 
    zeri=zeros(Delay,1);
    RightTT_Add=[zeri; RightTT_Add];
    RightTT_Add=RightTT_Add(1:(length(RightTT_Add)-Delay));
end

% Check
figure
plot(RightX_Add);
hold on;
plot(RightTT_Add);
plot(RightOPTO_Add);
title('Right Hip Adduction');
legend('Xsens','TinyTag','OPTO');
ylabel('HipAngle [°]');
xlabel('Time [s]');

%% The left side of Optoelectronic system must be inverted
LeftOPTO_add=-LeftOPTO_add;
%%
[LeftX_Add,LeftTT_Add,LeftOPTO_Add]=Sincronizzazione(LeftX_add,LeftTT_add,LeftOPTO_add);
title('Left Hip Adduction')
legend('Xsens','TinyTag','OPTO');
ylabel('HipAngle [°]');
xlabel('Time [s]');

%% Eventuale shift
[~,LOCS]=findpeaks(-LeftX_Add,'MaxPeakWidth',85,'MinPeakDistance',300);
[~,LOCS2]=findpeaks(-LeftTT_Add,'MaxPeakWidth',85,'MinPeakDistance',300);
Delay=LOCS2(1)-LOCS(1);
Delay=-43;
if Delay<0
    zeri=zeros(abs(Delay),1);
    LeftTT_add=LeftTT_add(-Delay:end);
    LeftTT_add=[LeftTT_add; zeri];
else 
    zeri=zeros(Delay,1);
    LeftTT_Add=[zeri; LeftTT_Add];
    LeftTT_Add=LeftTT_Add(1:(length(LeftTT_Add)-Delay));
end

% Check
figure
plot(LeftX_Add);
hold on;
plot(LeftTT_Add);
plot(LeftOPTO_Add);
title('Left Hip Adduction');
legend('Xsens','TinyTag','OPTO');
ylabel('HipAngle [°]');
xlabel('Time [s]');

%% Statistical analysis
% OPTO E XSENS
tit='Bland Altman plot-Adduction R';
label={'Optoelectronic system','Xsens'};
gnames='Measurements';
[~, ~, statstruct_AddDX_Opto_X]=BlandAltman(RightOPTO_Add, RightX_Add,label,tit,gnames,'corrInfo', {'eq';'r2';'RMSE';'p'},'baInfo','SD');
% ICC
M= [RightOPTO_Add RightX_Add];
alpha = 1.96*statstruct_AddDX_Opto_X.differenceSTD;
[ICC_AddDX_Opto_X, ~, ~, ~, ~, ~, ~] = ICC(M, 'A-1', alpha);
%Coefficiant of Variation Difference
meanOPTO= mean(RightOPTO_Add);
meanX=mean(RightX_Add);
stdOPTO= std(RightOPTO_Add);
stdX=std(RightX_Add);
CVOPTO=stdOPTO/meanOPTO;
CVX=stdX/meanX;
CVD_AddDX_Opto_X=(CVOPTO-CVX)*100;

tit='Bland Altman plot-Adduction L';
label={'Optoelectronic system','Xsens'};
gnames='Measurements';
[~, ~, statstruct_AddSX_Opto_X]=BlandAltman(LeftOPTO_Add, LeftX_Add,label,tit,gnames,'corrInfo', {'eq';'r2';'RMSE'},'baInfo','SD','axesLimits','tight');
M= [LeftOPTO_Add LeftX_Add];
alpha = 1.96*statstruct_AddSX_Opto_X.differenceSTD;
[ICC_AddSX_Opto_X, ~, ~, ~, ~, ~, ~] = ICC(M, 'A-1', alpha);
meanOPTO=mean(LeftOPTO_Add);
meanX=mean(LeftX_Add);
stdOPTO=std(LeftOPTO_Add);
stdX=std(LeftX_Add);
CVOPTO=stdOPTO/meanOPTO;
CVX=stdX/meanX;
CVD_AddSX_Opto_X=(CVOPTO-CVX)*100;

% OPTO E TINYTAG
tit='Bland Altman plot-Adduction R';
label={'Optoelectronic system','TinyTag'};
gnames='Measurements';
[~, ~, statstruct_AddDX_Opto_TT]=BlandAltman(RightOPTO_Add, RightTT_Add,label,tit,gnames,'corrInfo', {'eq';'r2';'RMSE'},'baInfo','SD');
M= [RightOPTO_Add RightTT_Add];
alpha = 1.96*statstruct_AddDX_Opto_TT.differenceSTD;
[ICC_AddDX_Opto_TT, ~, ~, ~, ~, ~, ~] = ICC(M, 'A-1', alpha);
meanOPTO=mean(RightOPTO_Add);
meanTT=mean(RightTT_Add);
stdOPTO=std(RightOPTO_Add);
stdTT=std(RightTT_Add);
CVOPTO=stdOPTO/meanOPTO;
CVTT=stdTT/meanTT;
CVD_AddDX_Opto_TT=(CVOPTO-CVTT)*100;

tit='Bland Altman plot-Adduction L';
label={'Optoelectronic system','TinyTag'};
gnames='Measurements';
[~, ~, statstruct_AddSX_Opto_TT]=BlandAltman(LeftOPTO_Add, LeftTT_Add,label,tit,gnames,'corrInfo', {'eq';'r2';'RMSE'},'baInfo','SD','axesLimits','tight');
M= [LeftOPTO_Add LeftTT_Add];
alpha = 1.96*statstruct_AddSX_Opto_TT.differenceSTD;
[ICC_AddSX_Opto_TT, ~, ~, ~, ~, ~, ~] = ICC(M, 'A-1', alpha);
meanOPTO=mean(LeftOPTO_Add);
meanTT=mean(LeftTT_Add);
stdOPTO=std(LeftOPTO_Add);
stdTT=std(LeftTT_Add);
CVOPTO=stdOPTO/meanOPTO;
CVTT=stdTT/meanTT;
CVD_AddSX_Opto_TT=(CVOPTO-CVTT)*100;

% TINYTAG E XSENS
tit='Bland Altman plot-Adduction R';
label={'Xsens','TinyTag'};
gnames='Measurements';
[~, ~, statstruct_AddDX_X_TT]=BlandAltman(RightX_Add, RightTT_Add,label,tit,gnames,'corrInfo', {'eq';'r2';'RMSE'},'baInfo','SD');
M= [RightX_Add RightTT_Add];
alpha = 1.96*statstruct_AddDX_X_TT.differenceSTD;
[ICC_AddDX_X_TT, ~, ~, ~, ~, ~, ~] = ICC(M, 'A-1', alpha);
meanX=mean(RightX_Add);
meanTT=mean(RightTT_Add);
stdX=std(RightX_Add);
stdTT=std(RightTT_Add);
CVX=stdX/meanX;
CVTT=stdTT/meanTT;
CVD_AddDX_X_TT=(CVX-CVTT)*100;

tit='Bland Altman plot-Adduction L';
label={'Xsens','TinyTag'};
gnames='Measurements';
[~, ~, statstruct_AddSX_X_TT]=BlandAltman(LeftX_Add, LeftTT_Add,label,tit,gnames,'corrInfo', {'eq';'r2';'RMSE'},'baInfo','SD','axesLimits','tight');
M= [LeftX_Add LeftTT_Add];
alpha = 1.96*statstruct_AddSX_X_TT.differenceSTD;
[ICC_AddSX_X_TT, ~, ~, ~, ~, ~, ~] = ICC(M, 'A-1', alpha);
meanX=mean(LeftX_Add);
meanTT=mean(LeftTT_Add);
stdX=std(LeftX_Add);
stdTT=std(LeftTT_Add);
CVX=stdX/meanX;
CVTT=stdTT/meanTT;
CVD_AddSX_X_TT=(CVX-CVTT)*100;

%% FLEXHIP
RightOPTO_flexhip=-RightOPTO_flexhip;
%%
[RightX_HF,RightTT_HF,RightOPTO_HF]=Sincronizzazione(RightX_flexhip,RightTT_flexhip,RightOPTO_flexhip);
title('Right Hip Flexion')
legend('Xsens','TinyTag','OPTO');
ylabel('HipAngle [°]');
xlabel('Time [s]');

%% Eventuale shift
[~,LOCS]=findpeaks(-RightTT_HF,'MaxPeakWidth',85,'MinPeakDistance',300);
[~,LOCS2]=findpeaks(-RightX_HF,'MaxPeakWidth',85,'MinPeakDistance',300);
Delay=LOCS2(1)-LOCS(1);
Delay=-111;
if Delay<0
    zeri=zeros(abs(Delay),1);
    RightTT_HF=RightTT_HF(-Delay:end);
    RightTT_HF=[RightTT_HF; zeri];
else 
    zeri=zeros(Delay,1);
    RightTT_HF=[zeri; RightTT_HF];
    RightTT_HF=RightTT_HF(1:(length(RightTT_HF)-Delay));
end

% Check
figure
plot(RightX_HF);
hold on;
plot(RightTT_HF);
plot(RightOPTO_HF);
title('Right Hip Flexion');
legend('Xsens','TinyTag','OPTO');
ylabel('HipAngle [°]');
xlabel('Time [s]');

%%
LeftOPTO_flexhip=-LeftOPTO_flexhip;
%%
[LeftX_HF,LeftTT_HF,LeftOPTO_HF]=Sincronizzazione(LeftX_flexhip,LeftTT_flexhip,LeftOPTO_flexhip);
title('Left Hip Flexion')
legend('Xsens','TinyTag','OPTO');
ylabel('HipAngle [°]');
xlabel('Time [s]');

%% Eventuale shift
[~,LOCS]=findpeaks(-LeftTT_HF,'MaxPeakWidth',85,'MinPeakDistance',300);
[~,LOCS2]=findpeaks(-LeftOPTO_HF,'MaxPeakWidth',85,'MinPeakDistance',300);
Delay=LOCS2(1)-LOCS(1);
Delay=-70;
if Delay<0
    zeri=zeros(abs(Delay),1);
    LeftTT_HF=LeftTT_HF(-Delay:end);
    LeftTT_HF=[LeftTT_HF; zeri];
else 
    zeri=zeros(Delay,1);
    LeftTT_HF=[zeri; LeftTT_HF];
   LeftTT_HF=LeftTT_HF(1:(length(LeftTT_HF)-Delay));
end

% Check
figure
plot(LeftX_HF);
hold on;
plot(LeftTT_HF);
plot(LeftOPTO_HF);
title('Left Hip Flexion');
legend('Xsens','TinyTag','OPTO');
ylabel('HipAngle [°]');
xlabel('Time [s]');

%% Statistical analysis
% OPTO E XSENS
 tit='Bland Altman plot-Hip Flexion R';
label={'Optoelectronic system','Xsens'};
gnames='Measurements';
[~, ~, statstruct_HFDX_Opto_X]=BlandAltman(RightOPTO_HF, RightX_HF,label,tit,gnames,'corrInfo', {'eq';'r2';'RMSE';'p'},'baInfo','SD');
% ICC
M= [RightOPTO_HF RightX_HF];
alpha = 1.96*statstruct_HFDX_Opto_X.differenceSTD;
[ICC_HFDX_Opto_X, ~, ~, ~, ~, ~, ~] = ICC(M, 'A-1', alpha);
%Coefficiant of Variation Difference
meanOPTO= mean(RightOPTO_HF);
meanX=mean(RightX_HF);
stdOPTO= std(RightOPTO_HF);
stdX=std(RightX_HF);
CVOPTO=stdOPTO/meanOPTO;
CVX=stdX/meanX;
CVD_HFDX_Opto_X=(CVOPTO-CVX)*100;

tit='Bland Altman plot-Hip Flexion L';
label={'Optoelectronic system','Xsens'};
gnames='Measurements';
[~, ~, statstruct_HFSX_Opto_X]=BlandAltman(LeftOPTO_HF, LeftX_HF,label,tit,gnames,'corrInfo', {'eq';'r2';'RMSE'},'baInfo','SD','axesLimits','tight');
M= [LeftOPTO_HF LeftX_HF];
alpha = 1.96*statstruct_HFSX_Opto_X.differenceSTD;
[ICC_HFSX_Opto_X, ~, ~, ~, ~, ~, ~] = ICC(M, 'A-1', alpha);
meanOPTO=mean(LeftOPTO_HF);
meanX=mean(LeftX_HF);
stdOPTO=std(LeftOPTO_HF);
stdX=std(LeftX_HF);
CVOPTO=stdOPTO/meanOPTO;
CVX=stdX/meanX;
CVD_HFSX_Opto_X=(CVOPTO-CVX)*100;

% OPTO E TINYTAG
tit='Bland Altman plot-Hip Flexion R';
label={'Optoelectronic system','TinyTag'};
gnames='Measurements';
[~, ~, statstruct_HFDX_Opto_TT]=BlandAltman(RightOPTO_HF, RightTT_HF,label,tit,gnames,'corrInfo', {'eq';'r2';'RMSE'},'baInfo','SD');
M= [RightOPTO_HF RightTT_HF];
alpha = 1.96*statstruct_HFDX_Opto_TT.differenceSTD;
[ICC_HFDX_Opto_TT, ~, ~, ~, ~, ~, ~] = ICC(M, 'A-1', alpha);
meanOPTO=mean(RightOPTO_HF);
meanTT=mean(RightTT_HF);
stdOPTO=std(RightOPTO_HF);
stdTT=std(RightTT_HF);
CVOPTO=stdOPTO/meanOPTO;
CVTT=stdTT/meanTT;
CVD_HFDX_Opto_TT=(CVOPTO-CVTT)*100;

tit='Bland Altman plot-Hip Flexion L';
label={'Optoelectronic system','TinyTag'};
gnames='Measurements';
[~, ~, statstruct_HFSX_Opto_TT]=BlandAltman(LeftOPTO_HF, LeftTT_HF,label,tit,gnames,'corrInfo', {'eq';'r2';'RMSE'},'baInfo','SD','axesLimits','tight');
M= [LeftOPTO_HF LeftTT_HF];
alpha = 1.96*statstruct_HFSX_Opto_TT.differenceSTD;
[ICC_HFSX_Opto_TT, ~, ~, ~, ~, ~, ~] = ICC(M, 'A-1', alpha);
meanOPTO=mean(LeftOPTO_HF);
meanTT=mean(LeftTT_HF);
stdOPTO=std(LeftOPTO_HF);
stdTT=std(LeftTT_HF);
CVOPTO=stdOPTO/meanOPTO;
CVTT=stdTT/meanTT;
CVD_HFSX_Opto_TT=(CVOPTO-CVTT)*100;

% TINYTAG E XSENS
tit='Bland Altman plot-Hip Flexion R';
label={'Xsens','TinyTag'};
gnames='Measurements';
[~, ~, statstruct_HFDX_X_TT]=BlandAltman(RightX_HF, RightTT_HF,label,tit,gnames,'corrInfo', {'eq';'r2';'RMSE'},'baInfo','SD');
M= [RightX_HF RightTT_HF];
alpha = 1.96*statstruct_HFDX_X_TT.differenceSTD;
[ICC_HFDX_X_TT, ~, ~, ~, ~, ~, ~] = ICC(M, 'A-1', alpha);
meanX=mean(RightX_HF);
meanTT=mean(RightTT_HF);
stdX=std(RightX_HF);
stdTT=std(RightTT_HF);
CVX=stdX/meanX;
CVTT=stdTT/meanTT;
CVD_HFDX_X_TT=(CVX-CVTT)*100;

tit='Bland Altman plot-Hip Flexion L';
label={'Xsens','TinyTag'};
gnames='Measurements';
[~, ~, statstruct_HFSX_X_TT]=BlandAltman(LeftX_HF, LeftTT_HF,label,tit,gnames,'corrInfo', {'eq';'r2';'RMSE'},'baInfo','SD','axesLimits','tight');
M= [LeftX_HF LeftTT_HF];
alpha = 1.96*statstruct_HFSX_X_TT.differenceSTD;
[ICC_HFSX_X_TT, ~, ~, ~, ~, ~, ~] = ICC(M, 'A-1', alpha);
meanX=mean(LeftX_HF);
meanTT=mean(LeftTT_HF);
stdX=std(LeftX_HF);
stdTT=std(LeftTT_HF);
CVX=stdX/meanX;
CVTT=stdTT/meanTT;
CVD_HFSX_X_TT=(CVX-CVTT)*100;

%% FLEXKNEE

RightOPTO_flexknee=-RightOPTO_flexknee;
%%
[RightX_KF,RightTT_KF,RightOPTO_KF]=Sincronizzazione(RightX_flexknee,RightTT_flexknee,RightOPTO_flexknee);
title('Right Knee Flexion')
legend('Xsens','TinyTag','OPTO');
ylabel('KneeAngle [°]');
xlabel('Time [s]');

%% Eventuale shift
[~,LOCS]=findpeaks(-RightX_KF,'MinPeakWidth',60,'MinPeakDistance',200);
[~,LOCS2]=findpeaks(-RightOPTO_KF,'MinPeakWidth',60,'MinPeakDistance',200);
Delay=LOCS2(1)-LOCS(1);
Delay=-15;
if Delay<0
    zeri=zeros(abs(Delay),1);
    RightTT_KF=RightTT_KF(-Delay:end);
    RightTT_KF=[RightTT_KF; zeri];
else 
    zeri=zeros(Delay,1);
    RightTT_KF=[zeri; RightTT_KF];
    RightTT_KF=RightTT_KF(1:(length(RightTT_KF)-Delay));
end

% Check
figure
plot(RightX_KF);
hold on;
plot(RightTT_KF);
plot(RightOPTO_KF);
title('Right knee flexion');
legend('Xsens','TinyTag','OPTO');
ylabel('KneeAngle [°]');
xlabel('Time [s]');

%%
LeftOPTO_flexknee=-LeftOPTO_flexknee;
%%
[LeftX_KF,LeftTT_KF,LeftOPTO_KF]=Sincronizzazione(LeftX_flexknee,LeftTT_flexknee,LeftOPTO_flexknee);
title('Left Knee Flexion')
legend('Xsens','TinyTag','OPTO');
ylabel('KneeAngle [°]');
xlabel('Time [s]');

%% Eventuale shift
[PKS,LOCS]=findpeaks(-LeftX_KF,'MaxPeakWidth',85,'MinPeakDistance',300);
[PKS2,LOCS2]=findpeaks(-LeftOPTO_KF,'MaxPeakWidth',85,'MinPeakDistance',300);
Delay=LOCS2(1)-LOCS(1);
Delay=-18;
if Delay<0
    zeri=zeros(abs(Delay),1);
    LeftTT_KF=LeftTT_KF(-Delay:end);
    LeftTT_KF=[LeftTT_KF; zeri];
else 
    zeri=zeros(Delay,1);
    LeftTT_KF=[zeri; LeftTT_KF];
    LeftTT_KF=LeftTT_KF(1:(length(LeftTT_KF)-Delay));
end

% Check
figure()
plot(LeftX_KF);
hold on;
plot(LeftTT_KF);
plot(LeftOPTO_KF);
title('Left Knee flexion');
legend('Xsens','TinyTag','OPTO');
ylabel('KneeAngle [°]');
xlabel('Time [s]');

%% Statistical analysis
% OPTO E XSENS
tit='Bland Altman plot-Knee Flexion R';
label={'Optoelectronic system','Xsens'};
gnames='Measurements';
[~, ~, statstruct_KFDX_Opto_X]=BlandAltman(RightOPTO_KF, RightX_KF,label,tit,gnames,'corrInfo', {'eq';'r2';'RMSE';'p'},'baInfo','SD');
% ICC
M= [RightOPTO_KF RightX_KF];
alpha = 1.96*statstruct_KFDX_Opto_X.differenceSTD;
[ICC_KFDX_Opto_X, ~, ~, ~, ~, ~, ~] = ICC(M, 'A-1', alpha);
%Coefficiant of Variation Difference
meanOPTO= mean(RightOPTO_KF);
meanX=mean(RightX_KF);
stdOPTO= std(RightOPTO_KF);
stdX=std(RightX_KF);
CVOPTO=stdOPTO/meanOPTO;
CVX=stdX/meanX;
CVD_KFDX_Opto_X=(CVOPTO-CVX)*100;

tit='Bland Altman plot-Knee Flexion L';
label={'Optoelectronic system','Xsens'};
gnames='Measurements';
[~, ~, statstruct_KFSX_Opto_X]=BlandAltman(LeftOPTO_KF, LeftX_KF,label,tit,gnames,'corrInfo', {'eq';'r2';'RMSE'},'baInfo','SD','axesLimits','tight');
M= [LeftOPTO_KF LeftX_KF];
alpha = 1.96*statstruct_KFSX_Opto_X.differenceSTD;
[ICC_KFSX_Opto_X, ~, ~, ~, ~, ~, ~] = ICC(M, 'A-1', alpha);
meanOPTO=mean(LeftOPTO_KF);
meanX=mean(LeftX_KF);
stdOPTO=std(LeftOPTO_KF);
stdX=std(LeftX_KF);
CVOPTO=stdOPTO/meanOPTO;
CVX=stdX/meanX;
CVD_KFSX_Opto_X=(CVOPTO-CVX)*100;

% OPTO E TINYTAG
tit='Bland Altman plot-Knee Flexion R';
label={'Optoelectronic system','TinyTag'};
gnames='Measurements';
[~, ~, statstruct_KFDX_Opto_TT]=BlandAltman(RightOPTO_KF, RightTT_KF,label,tit,gnames,'corrInfo', {'eq';'r2';'RMSE'},'baInfo','SD');
M= [RightOPTO_KF RightTT_KF];
alpha = 1.96*statstruct_KFDX_Opto_TT.differenceSTD;
[ICC_KFDX_Opto_TT, ~, ~, ~, ~, ~, ~] = ICC(M, 'A-1', alpha);
meanOPTO=mean(RightOPTO_KF);
meanTT=mean(RightTT_KF);
stdOPTO=std(RightOPTO_KF);
stdTT=std(RightTT_KF);
CVOPTO=stdOPTO/meanOPTO;
CVTT=stdTT/meanTT;
CVD_KFDX_Opto_TT=(CVOPTO-CVTT)*100;

tit='Bland Altman plot-Knee Flexion L';
label={'Optoelectronic system','TinyTag'};
gnames='Measurements';
[~, ~, statstruct_KFSX_Opto_TT]=BlandAltman(LeftOPTO_KF, LeftTT_KF,label,tit,gnames,'corrInfo', {'eq';'r2';'RMSE'},'baInfo','SD','axesLimits','tight');
M= [LeftOPTO_KF LeftTT_KF];
alpha = 1.96*statstruct_KFSX_Opto_TT.differenceSTD;
[ICC_KFSX_Opto_TT, ~, ~, ~, ~, ~, ~] = ICC(M, 'A-1', alpha);
meanOPTO=mean(LeftOPTO_KF);
meanTT=mean(LeftTT_KF);
stdOPTO=std(LeftOPTO_KF);
stdTT=std(LeftTT_KF);
CVOPTO=stdOPTO/meanOPTO;
CVTT=stdTT/meanTT;
CVD_KFSX_Opto_TT=(CVOPTO-CVTT)*100;

% TINYTAG E XSENS
tit='Bland Altman plot-Knee Flexion R';
label={'Xsens','TinyTag'};
gnames='Measurements';
[~, ~, statstruct_KFDX_X_TT]=BlandAltman(RightX_KF, RightTT_KF,label,tit,gnames,'corrInfo', {'eq';'r2';'RMSE'},'baInfo','SD');
M= [RightX_KF RightTT_KF];
alpha = 1.96*statstruct_KFDX_X_TT.differenceSTD;
[ICC_KFDX_X_TT, ~, ~, ~, ~, ~, ~] = ICC(M, 'A-1', alpha);
meanX=mean(RightX_KF);
meanTT=mean(RightTT_KF);
stdX=std(RightX_KF);
stdTT=std(RightTT_KF);
CVX=stdX/meanX;
CVTT=stdTT/meanTT;
CVD_KFDX_X_TT=(CVX-CVTT)*100;

tit='Bland Altman plot-Knee Flexion L';
label={'Xsens','TinyTag'};
gnames='Measurements';
[~, ~, statstruct_KFSX_X_TT]=BlandAltman(LeftX_KF, LeftTT_KF,label,tit,gnames,'corrInfo', {'eq';'r2';'RMSE'},'baInfo','SD','axesLimits','tight');
M= [LeftX_KF LeftTT_KF];
alpha = 1.96*statstruct_KFSX_X_TT.differenceSTD;
[ICC_KFSX_X_TT, ~, ~, ~, ~, ~, ~] = ICC(M, 'A-1', alpha);
meanX=mean(LeftX_KF);
meanTT=mean(LeftTT_KF);
stdX=std(LeftX_KF);
stdTT=std(LeftTT_KF);
CVX=stdX/meanX;
CVTT=stdTT/meanTT;
CVD_KFSX_X_TT=(CVX-CVTT)*100;