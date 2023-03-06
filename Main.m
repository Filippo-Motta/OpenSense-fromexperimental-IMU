%% Start of script

addpath('Functions')     
close all;                          
clear;                              
clc;       

%% Import and plot sensor data    

Basic=load('D01.txt');
RT=load('D04.txt');
RS=load('D06.txt');
RF=load('M200101065132.txt');
LT=load('S080110223638.txt');
LS=load('D090110223440.txt');
LF=load('M140101065047.txt');

%% sincro
figure
plot(Basic(:,5),'r');
hold on
plot(Basic(:,6),'b');
plot(Basic(:,7),'g');
legend('X', 'Y', 'Z');
title('Basic')
[inizio_Basic,~]=ginput(1);

figure
plot(RT(:,5),'r');
hold on
plot(RT(:,6),'b');
plot(RT(:,7),'g');
legend('X', 'Y', 'Z');
title('RT')
[inizio_RT,~]=ginput(1);

figure
plot(RS(:,5),'r');
hold on
plot(RS(:,6),'b');
plot(RS(:,7),'g');
legend('X', 'Y', 'Z');
title('RS')
[inizio_RS,~]=ginput(1);

figure
plot(RF(:,5),'r');
hold on
plot(RF(:,6),'b');
plot(RF(:,7),'g');
legend('X', 'Y', 'Z');
title('RF')
[inizio_RF,~]=ginput(1);

figure
plot(LT(:,5),'r');
hold on
plot(LT(:,6),'b');
plot(LT(:,7),'g');
legend('X', 'Y', 'Z');
title('LT')
[inizio_LT,~]=ginput(1);

figure
plot(LS(:,5),'r');
hold on
plot(LS(:,6),'b');
plot(LS(:,7),'g');
legend('X', 'Y', 'Z');
title('LS')
[inizio_LS,~]=ginput(1);

figure
plot(LF(:,5),'r');
hold on
plot(LF(:,6),'b');
plot(LF(:,7),'g');
legend('X', 'Y', 'Z');
title('LF')
[inizio_LF,~]=ginput(1);

%% Taglio inizio 
close all
[~,sincro]=max(Basic(1:inizio_Basic,7));
Basic=Basic(sincro:end,:);
[~,sincro]=max(RT(1:inizio_RT,7));
RT=RT(sincro:end,:);
[~,sincro]=max(RS(1:inizio_RS,7));
RS=RS(sincro:end,:);
[~,sincro]=max(RF(1:inizio_RF,7));
RF=RF(sincro:end,:);
[~,sincro]=max(LT(1:inizio_LT,7));
LT=LT(sincro:end,:);
[~,sincro]=max(LS(1:inizio_LS,7));
LS=LS(sincro:end,:);
[~,sincro]=max(LF(1:inizio_LF,7));
LF=LF(sincro:end,:);
%% Calibrazione gyroscopio

BiasGyro=[-0.610524091293398	-0.415705832628861	0.330087912087953;...
    %-0.262307692307710	-0.416177619290200	0.393272202411244;...
    0.324682274247546	0.432794786038916	-0.033130949318243;...
    0.230604107933938	0.145974627466777	-0.011494160289972;...    
    -0.450047957030485	-0.149656627661598	-0.577233838480808;...
    -0.137331970355215	-0.721061419201024	-0.048542465286657;...
    0.439517412509603	-0.345448789253050	0.293447420210544;...    
    -0.197749481788546	0.526776838044382	0.536156351791578];

%Basic
biasx=BiasGyro(1,1);
biasy=BiasGyro(1,2);
biasz=BiasGyro(1,3);
Basic(:,8)=Basic(:,8)-biasx;
Basic(:,9)=Basic(:,9)-biasy;
Basic(:,10)=Basic(:,10)-biasz;

%RT
biasx=BiasGyro(2,1);
biasy=BiasGyro(2,2);
biasz=BiasGyro(2,3);
RT(:,8)=RT(:,8)-biasx;
RT(:,9)=RT(:,9)-biasy;
RT(:,10)=RT(:,10)-biasz;

%RS
biasx=BiasGyro(3,1);
biasy=BiasGyro(3,2);
biasz=BiasGyro(3,3);
RS(:,8)=RS(:,8)-biasx;
RS(:,9)=RS(:,9)-biasy;
RS(:,10)=RS(:,10)-biasz;

%RF
biasx=BiasGyro(4,1);
biasy=BiasGyro(4,2);
biasz=BiasGyro(4,3);
RF(:,8)=RF(:,8)-biasx;
RF(:,9)=RF(:,9)-biasy;
RF(:,10)=RF(:,10)-biasz;

%LT
biasx=BiasGyro(5,1);
biasy=BiasGyro(5,2);
biasz=BiasGyro(5,3);
LT(:,8)=LT(:,8)-biasx;
LT(:,9)=LT(:,9)-biasy;
LT(:,10)=LT(:,10)-biasz;

%LS
biasx=BiasGyro(6,1);
biasy=BiasGyro(6,2);
biasz=BiasGyro(6,3);
LS(:,8)=LS(:,8)-biasx;
LS(:,9)=LS(:,9)-biasy;
LS(:,10)=LS(:,10)-biasz;

%LF
biasx=BiasGyro(7,1);
biasy=BiasGyro(7,2);
biasz=BiasGyro(7,3);
LF(:,8)=LF(:,8)-biasx;
LF(:,9)=LF(:,9)-biasy;
LF(:,10)=LF(:,10)-biasz;

%% Calibrazione Accelerometro

BiasMat=[-0.2150	-0.2209	0.2780	0.1207	-0.1007	0.2015;...
    %-0.2117	-0.2181	0.3337	0.3754	-0.0342	-0.005;...
    -0.8990	-0.9951	-0.2783	0.3042	0.7412	0.8979;...
    -0.3752	-0.5342	0.5450	0.5602	0.0721	0.2452;...
    0.6376	0.6723	0.1805	0.0367	-0.1528	0.0483;...
    0.1786	-0.1002	0.0055	-0.0694	-0.3695	-0.2533;...
    0.2915	0.2440	-0.1238	0.2325	-0.4085	-0.3069;...    
    -1.7211	1.4488	0.6329	0.4367	-0.7580	0.5493];

%Basic
biasxpos = BiasMat(1,1);
biasxneg = BiasMat(1,2);
biasypos = BiasMat(1,3);
biasyneg = BiasMat(1,4);
biaszpos = BiasMat(1,5);
biaszneg = BiasMat(1,6);
for i=1:length(Basic)
    if Basic(i,5)>0
        Basic(i,5)=Basic(i,5)+biasxpos;
    else
        Basic(i,5)=Basic(i,5)+biasxneg;
    end
end
for i=1:length(Basic)
    if Basic(i,6)>0
        Basic(i,6)=Basic(i,6)+biasypos;
    else
        Basic(i,6)=Basic(i,6)+biasyneg;
    end
end
for i=1:length(Basic)
    if Basic(i,7)>0
        Basic(i,7)=Basic(i,7)+biaszpos;
    else
        Basic(i,7)=Basic(i,7)+biaszneg;
    end
end

%RT
biasxpos = BiasMat(2,1);
biasxneg = BiasMat(2,2);
biasypos = BiasMat(2,3);
biasyneg = BiasMat(2,4);
biaszpos = BiasMat(2,5);
biaszneg = BiasMat(2,6);
for i=1:length(RT)
    if RT(i,5)>0
        RT(i,5)=RT(i,5)+biasxpos;
    else
        RT(i,5)=RT(i,5)+biasxneg;
    end
end
for i=1:length(RT)
    if RT(i,6)>0
        RT(i,6)=RT(i,6)+biasypos;
    else
        RT(i,6)=RT(i,6)+biasyneg;
    end
end
for i=1:length(RT)
    if RT(i,7)>0
        RT(i,7)=RT(i,7)+biaszpos;
    else
        RT(i,7)=RT(i,7)+biaszneg;
    end
end

%RS
biasxpos = BiasMat(3,1);
biasxneg = BiasMat(3,2);
biasypos = BiasMat(3,3);
biasyneg = BiasMat(3,4);
biaszpos = BiasMat(3,5);
biaszneg = BiasMat(3,6);
for i=1:length(RS)
    if RS(i,5)>0
        RS(i,5)=RS(i,5)+biasxpos;
    else
        RS(i,5)=RS(i,5)+biasxneg;
    end
end
for i=1:length(RS)
    if RS(i,6)>0
        RS(i,6)=RS(i,6)+biasypos;
    else
        RS(i,6)=RS(i,6)+biasyneg;
    end
end
for i=1:length(RS)
    if RS(i,7)>0
        RS(i,7)=RS(i,7)+biaszpos;
    else
        RS(i,7)=RS(i,7)+biaszneg;
    end
end
%RF
biasxpos = BiasMat(4,1);
biasxneg = BiasMat(4,2);
biasypos = BiasMat(4,3);
biasyneg = BiasMat(4,4);
biaszpos = BiasMat(4,5);
biaszneg = BiasMat(4,6);
for i=1:length(RF)
    if RF(i,5)>0
        RF(i,5)=RF(i,5)+biasxpos;
    else
        RF(i,5)=RF(i,5)+biasxneg;
    end
end
for i=1:length(RF)
    if RF(i,6)>0
        RF(i,6)=RF(i,6)+biasypos;
    else
        RF(i,6)=RF(i,6)+biasyneg;
    end
end
for i=1:length(RF)
    if RF(i,7)>0
        RF(i,7)=RF(i,7)+biaszpos;
    else
        RF(i,7)=RF(i,7)+biaszneg;
    end
end

%LT
biasxpos = BiasMat(5,1);
biasxneg = BiasMat(5,2);
biasypos = BiasMat(5,3);
biasyneg = BiasMat(5,4);
biaszpos = BiasMat(5,5);
biaszneg = BiasMat(5,6);
for i=1:length(LT)
    if LT(i,5)>0
        LT(i,5)=LT(i,5)+biasxpos;
    else
        LT(i,5)=LT(i,5)+biasxneg;
    end
end
for i=1:length(LT)
    if LT(i,6)>0
        LT(i,6)=LT(i,6)+biasypos;
    else
        LT(i,6)=LT(i,6)+biasyneg;
    end
end
for i=1:length(LT)
    if LT(i,7)>0
        LT(i,7)=LT(i,7)+biaszpos;
    else
        LT(i,7)=LT(i,7)+biaszneg;
    end
end

%LS
biasxpos = BiasMat(6,1);
biasxneg = BiasMat(6,2);
biasypos = BiasMat(6,3);
biasyneg = BiasMat(6,4);
biaszpos = BiasMat(6,5);
biaszneg = BiasMat(6,6);
for i=1:length(LS)
    if LS(i,5)>0
        LS(i,5)=LS(i,5)+biasxpos;
    else
        LS(i,5)=LS(i,5)+biasxneg;
    end
end
for i=1:length(LS)
    if LS(i,6)>0
        LS(i,6)=LS(i,6)+biasypos;
    else
        LS(i,6)=LS(i,6)+biasyneg;
    end
end
for i=1:length(LS)
    if LS(i,7)>0
        LS(i,7)=LS(i,7)+biaszpos;
    else
        LS(i,7)=LS(i,7)+biaszneg;
    end
end

%LF
biasxpos = BiasMat(7,1);
biasxneg = BiasMat(7,2);
biasypos = BiasMat(7,3);
biasyneg = BiasMat(7,4);
biaszpos = BiasMat(7,5);
biaszneg = BiasMat(7,6);
for i=1:length(LF)
    if LF(i,5)>0
        LF(i,5)=LF(i,5)+biasxpos;
    else
        LF(i,5)=LF(i,5)+biasxneg;
    end
end
for i=1:length(LF)
    if LF(i,6)>0
        LF(i,6)=LF(i,6)+biasypos;
    else
        LF(i,6)=LF(i,6)+biasyneg;
    end
end
for i=1:length(LF)
    if LF(i,7)>0
        LF(i,7)=LF(i,7)+biaszpos;
    else
        LF(i,7)=LF(i,7)+biaszneg;
    end
end
%% Calibrazione Magnetometro
[A,b,~]  = magcal(Basic(:,11:13));
xCorrected = (Basic(:,11:13)-b)*A;
Basic(:,11:13)=xCorrected;

[A,b,~]  = magcal(RT(:,11:13));
xCorrected = (RT(:,11:13)-b)*A;
RT(:,11:13)=xCorrected;

[A,b,~]  = magcal(RS(:,11:13));
xCorrected = (RS(:,11:13)-b)*A;
RS(:,11:13)=xCorrected;

[A,b,~]  = magcal(RF(:,11:13));
xCorrected = (RF(:,11:13)-b)*A;
RF(:,11:13)=xCorrected;

[A,b,~]  = magcal(LT(:,11:13));
xCorrected = (LT(:,11:13)-b)*A;
LT(:,11:13)=xCorrected;

[A,b,~]  = magcal(LS(:,11:13));
xCorrected = (LS(:,11:13)-b)*A;
LS(:,11:13)=xCorrected;

[A,b,~]  = magcal(LF(:,11:13));
xCorrected = (LF(:,11:13)-b)*A;
LF(:,11:13)=xCorrected;

%%  filtro Savitzky-Golay 
[Basic]=Filtro(Basic);
[RT]=Filtro(RT);
[RS]=Filtro(RS);
[RF]=Filtro(RF);
[LT]=Filtro(LT);
[LS]=Filtro(LS);
[LF]=Filtro(LF);
%% movimenti utili:
% PER SQUAT GUARDA BASIC
figure
plot(Basic(:,5),'r');
hold on
plot(Basic(:,6),'b');
plot(Basic(:,7),'g');
legend('X', 'Y', 'Z');
title('Scegli inizio_squat e fine_squat')
[coordinate_squat,~]=ginput(2);

% movimenti utili: PER ADDU/ABD GUARDA RT e LT
figure
plot(RT(:,5),'r');
hold on
plot(RT(:,6),'b');
plot(RT(:,7),'g');
legend('X', 'Y', 'Z');
title('scegli inizio_addu')
[inizio_addu,~]=ginput(1);

figure
plot(LT(:,5),'r');
hold on
plot(LT(:,6),'b');
plot(LT(:,7),'g');
legend('X', 'Y', 'Z');
title('scegli fine_addu')
[fine_addu,~]=ginput(1);

% PER FLEX/EXT HIP GUARDA RT e LT
figure
plot(RT(:,5),'r');
hold on
plot(RT(:,6),'b');
plot(RT(:,7),'g');
legend('X', 'Y', 'Z');
title('scegli inizio_flexhip')
[inizio_flexhip,~]=ginput(1);

figure
plot(LT(:,5),'r');
hold on
plot(LT(:,6),'b');
plot(LT(:,7),'g');
legend('X', 'Y', 'Z');
title('scegli fine_flexhip')
[fine_flexhip,~]=ginput(1);

% PER FLEX/EXT KNEE GUARDA RS E LS
figure
plot(RS(:,5),'r');
hold on
plot(RS(:,6),'b');
plot(RS(:,7),'g');
legend('X', 'Y', 'Z');
title('scegli inizio_flexknee')
[inizio_flexknee,~]=ginput(1);

figure
plot(LS(:,5),'r');
hold on
plot(LS(:,6),'b');
plot(LS(:,7),'g');
legend('X', 'Y', 'Z');
title('scegli fine_flexknee')
[fine_flexknee,~]=ginput(1);

%% Taglio SQUAT
inizio=coordinate_squat(1,1);
fine=coordinate_squat(end,1);
squat_Basic=Basic(inizio:fine,:);
squat_RT=RT(inizio:fine,:);
squat_RS=RS(inizio:fine,:);
squat_RF=RF(inizio:fine,:);
squat_LT=LT(inizio:fine,:);
squat_LS=LS(inizio:fine,:);
squat_LF=LF(inizio:fine,:);
%% Taglio ADD/ABD
inizio=inizio_addu;
fine=fine_addu;
addu_Basic=Basic(inizio:fine,:);
addu_RT=RT(inizio:fine,:);
addu_RS=RS(inizio:fine,:);
addu_RF=RF(inizio:fine,:);
addu_LT=LT(inizio:fine,:);
addu_LS=LS(inizio:fine,:);
addu_LF=LF(inizio:fine,:);
%% Taglio FLEX/EXT HIP
inizio=inizio_flexhip;
fine=fine_flexhip;
flexhip_Basic=Basic(inizio:fine,:);
flexhip_RT=RT(inizio:fine,:);
flexhip_RS=RS(inizio:fine,:);
flexhip_RF=RF(inizio:fine,:);
flexhip_LT=LT(inizio:fine,:);
flexhip_LS=LS(inizio:fine,:);
flexhip_LF=LF(inizio:fine,:);
%% Taglio FLEX/EXT KNEE
inizio=inizio_flexknee;
fine=fine_flexknee;
flexknee_Basic=Basic(inizio:fine,:);
flexknee_RT=RT(inizio:fine,:);
flexknee_RS=RS(inizio:fine,:);
flexknee_RF=RF(inizio:fine,:);
flexknee_LT=LT(inizio:fine,:);
flexknee_LS=LS(inizio:fine,:);
flexknee_LF=LF(inizio:fine,:);
%% Isolo le ripetizioni
%Squat
figure
plot(squat_RT(:,7),'g');
hold on
plot(squat_LT(:,7),'r');
hold off
legend('DX', 'SX');
title('prendi la fine delle ripe di squat')
[ripe_squat,~]=ginput(4);

%ADDU
figure
plot(addu_RF(:,7),'g');
hold on
plot(addu_LF(:,7),'r');
hold off
legend('DX', 'SX');
legend('X');
title('prendi la fine delle ripe di addu')
[ripe_addu,~]=ginput(9);

% FLEX/EXT HIP 
figure
plot(flexhip_RT(:,7),'g');
hold on
plot(flexhip_LT(:,7),'r');
hold off
legend('DX', 'SX');
title('prendi la fine delle ripe di flexhip')
[ripe_flexhip,~]=ginput(9);

% FLEX/EXT KNEE
figure
plot(flexknee_RF(:,5),'g');
hold on
plot(flexknee_LF(:,5),'r');
hold off
legend('DX', 'SX');
title('prendi la fine delle ripe di flexknee')
[ripe_flexknee,~]=ginput(9);

%% Taglio
%squat
fine1=ripe_squat(1,1);
[squat_Basic1,squat_RT1,squat_RS1,squat_RF1,squat_LT1,squat_LS1,squat_LF1]=Taglio(squat_Basic,squat_RT,squat_RS,squat_RF,squat_LT,squat_LS,squat_LF,1,fine1);
fine2=ripe_squat(2,1);
[squat_Basic2,squat_RT2,squat_RS2,squat_RF2,squat_LT2,squat_LS2,squat_LF2]=Taglio(squat_Basic,squat_RT,squat_RS,squat_RF,squat_LT,squat_LS,squat_LF,fine1,fine2);
fine3=ripe_squat(3,1);
[squat_Basic3,squat_RT3,squat_RS3,squat_RF3,squat_LT3,squat_LS3,squat_LF3]=Taglio(squat_Basic,squat_RT,squat_RS,squat_RF,squat_LT,squat_LS,squat_LF,fine2,fine3);
fine4=ripe_squat(4,1);
[squat_Basic4,squat_RT4,squat_RS4,squat_RF4,squat_LT4,squat_LS4,squat_LF4]=Taglio(squat_Basic,squat_RT,squat_RS,squat_RF,squat_LT,squat_LS,squat_LF,fine3,fine4);
[squat_Basic5,squat_RT5,squat_RS5,squat_RF5,squat_LT5,squat_LS5,squat_LF5]=Taglio(squat_Basic,squat_RT,squat_RS,squat_RF,squat_LT,squat_LS,squat_LF,fine4,size(squat_Basic(:,1),1));
%Flex hip
fine1=ripe_flexhip(1,1);
[flexhip_Basic1,flexhip_RT1,flexhip_RS1,flexhip_RF1,flexhip_LT1,flexhip_LS1,flexhip_LF1]=Taglio(flexhip_Basic,flexhip_RT,flexhip_RS,flexhip_RF,flexhip_LT,flexhip_LS,flexhip_LF,1,fine1);
fine2=ripe_flexhip(2,1);
[flexhip_Basic2,flexhip_RT2,flexhip_RS2,flexhip_RF2,flexhip_LT2,flexhip_LS2,flexhip_LF2]=Taglio(flexhip_Basic,flexhip_RT,flexhip_RS,flexhip_RF,flexhip_LT,flexhip_LS,flexhip_LF,fine1,fine2);
fine3=ripe_flexhip(3,1);
[flexhip_Basic3,flexhip_RT3,flexhip_RS3,flexhip_RF3,flexhip_LT3,flexhip_LS3,flexhip_LF3]=Taglio(flexhip_Basic,flexhip_RT,flexhip_RS,flexhip_RF,flexhip_LT,flexhip_LS,flexhip_LF,fine2,fine3);
fine4=ripe_flexhip(4,1);
[flexhip_Basic4,flexhip_RT4,flexhip_RS4,flexhip_RF4,flexhip_LT4,flexhip_LS4,flexhip_LF4]=Taglio(flexhip_Basic,flexhip_RT,flexhip_RS,flexhip_RF,flexhip_LT,flexhip_LS,flexhip_LF,fine3,fine4);
fine5=ripe_flexhip(5,1);
[flexhip_Basic5,flexhip_RT5,flexhip_RS5,flexhip_RF5,flexhip_LT5,flexhip_LS5,flexhip_LF5]=Taglio(flexhip_Basic,flexhip_RT,flexhip_RS,flexhip_RF,flexhip_LT,flexhip_LS,flexhip_LF,fine4,fine5);
fine6=ripe_flexhip(6,1);
[flexhip_Basic6,flexhip_RT6,flexhip_RS6,flexhip_RF6,flexhip_LT6,flexhip_LS6,flexhip_LF6]=Taglio(flexhip_Basic,flexhip_RT,flexhip_RS,flexhip_RF,flexhip_LT,flexhip_LS,flexhip_LF,fine5,fine6);
fine7=ripe_flexhip(7,1);
[flexhip_Basic7,flexhip_RT7,flexhip_RS7,flexhip_RF7,flexhip_LT7,flexhip_LS7,flexhip_LF7]=Taglio(flexhip_Basic,flexhip_RT,flexhip_RS,flexhip_RF,flexhip_LT,flexhip_LS,flexhip_LF,fine6,fine7);
fine8=ripe_flexhip(8,1);
[flexhip_Basic8,flexhip_RT8,flexhip_RS8,flexhip_RF8,flexhip_LT8,flexhip_LS8,flexhip_LF8]=Taglio(flexhip_Basic,flexhip_RT,flexhip_RS,flexhip_RF,flexhip_LT,flexhip_LS,flexhip_LF,fine7,fine8);
fine9=ripe_flexhip(9,1);
[flexhip_Basic9,flexhip_RT9,flexhip_RS9,flexhip_RF9,flexhip_LT9,flexhip_LS9,flexhip_LF9]=Taglio(flexhip_Basic,flexhip_RT,flexhip_RS,flexhip_RF,flexhip_LT,flexhip_LS,flexhip_LF,fine8,fine9);
[flexhip_Basic10,flexhip_RT10,flexhip_RS10,flexhip_RF10,flexhip_LT10,flexhip_LS10,flexhip_LF10]=Taglio(flexhip_Basic,flexhip_RT,flexhip_RS,flexhip_RF,flexhip_LT,flexhip_LS,flexhip_LF,fine9,size(flexhip_Basic(:,1),1));
%Flex knee
fine1=ripe_flexknee(1,1);
[flexknee_Basic1,flexknee_RT1,flexknee_RS1,flexknee_RF1,flexknee_LT1,flexknee_LS1,flexknee_LF1]=Taglio(flexknee_Basic,flexknee_RT,flexknee_RS,flexknee_RF,flexknee_LT,flexknee_LS,flexknee_LF,1,fine1);
fine2=ripe_flexknee(2,1);
[flexknee_Basic2,flexknee_RT2,flexknee_RS2,flexknee_RF2,flexknee_LT2,flexknee_LS2,flexknee_LF2]=Taglio(flexknee_Basic,flexknee_RT,flexknee_RS,flexknee_RF,flexknee_LT,flexknee_LS,flexknee_LF,fine1,fine2);
fine3=ripe_flexknee(3,1);
[flexknee_Basic3,flexknee_RT3,flexknee_RS3,flexknee_RF3,flexknee_LT3,flexknee_LS3,flexknee_LF3]=Taglio(flexknee_Basic,flexknee_RT,flexknee_RS,flexknee_RF,flexknee_LT,flexknee_LS,flexknee_LF,fine2,fine3);
fine4=ripe_flexknee(4,1);
[flexknee_Basic4,flexknee_RT4,flexknee_RS4,flexknee_RF4,flexknee_LT4,flexknee_LS4,flexknee_LF4]=Taglio(flexknee_Basic,flexknee_RT,flexknee_RS,flexknee_RF,flexknee_LT,flexknee_LS,flexknee_LF,fine3,fine4);
fine5=ripe_flexknee(5,1);
[flexknee_Basic5,flexknee_RT5,flexknee_RS5,flexknee_RF5,flexknee_LT5,flexknee_LS5,flexknee_LF5]=Taglio(flexknee_Basic,flexknee_RT,flexknee_RS,flexknee_RF,flexknee_LT,flexknee_LS,flexknee_LF,fine4,fine5);
fine6=ripe_flexknee(6,1);
[flexknee_Basic6,flexknee_RT6,flexknee_RS6,flexknee_RF6,flexknee_LT6,flexknee_LS6,flexknee_LF6]=Taglio(flexknee_Basic,flexknee_RT,flexknee_RS,flexknee_RF,flexknee_LT,flexknee_LS,flexknee_LF,fine5,fine6);
fine7=ripe_flexknee(7,1);
[flexknee_Basic7,flexknee_RT7,flexknee_RS7,flexknee_RF7,flexknee_LT7,flexknee_LS7,flexknee_LF7]=Taglio(flexknee_Basic,flexknee_RT,flexknee_RS,flexknee_RF,flexknee_LT,flexknee_LS,flexknee_LF,fine6,fine7);
fine8=ripe_flexknee(8,1);
[flexknee_Basic8,flexknee_RT8,flexknee_RS8,flexknee_RF8,flexknee_LT8,flexknee_LS8,flexknee_LF8]=Taglio(flexknee_Basic,flexknee_RT,flexknee_RS,flexknee_RF,flexknee_LT,flexknee_LS,flexknee_LF,fine7,fine8);
fine9=ripe_flexknee(9,1);
[flexknee_Basic9,flexknee_RT9,flexknee_RS9,flexknee_RF9,flexknee_LT9,flexknee_LS9,flexknee_LF9]=Taglio(flexknee_Basic,flexknee_RT,flexknee_RS,flexknee_RF,flexknee_LT,flexknee_LS,flexknee_LF,fine8,fine9);
[flexknee_Basic10,flexknee_RT10,flexknee_RS10,flexknee_RF10,flexknee_LT10,flexknee_LS10,flexknee_LF10]=Taglio(flexknee_Basic,flexknee_RT,flexknee_RS,flexknee_RF,flexknee_LT,flexknee_LS,flexknee_LF,fine9,size(flexknee_Basic(:,1),1));
%Addu
fine1=ripe_addu(1,1);
[addu_Basic1,addu_RT1,addu_RS1,addu_RF1,addu_LT1,addu_LS1,addu_LF1]=Taglio(addu_Basic,addu_RT,addu_RS,addu_RF,addu_LT,addu_LS,addu_LF,1,fine1);
fine2=ripe_addu(2,1);
[addu_Basic2,addu_RT2,addu_RS2,addu_RF2,addu_LT2,addu_LS2,addu_LF2]=Taglio(addu_Basic,addu_RT,addu_RS,addu_RF,addu_LT,addu_LS,addu_LF,fine1,fine2);
fine3=ripe_addu(3,1);
[addu_Basic3,addu_RT3,addu_RS3,addu_RF3,addu_LT3,addu_LS3,addu_LF3]=Taglio(addu_Basic,addu_RT,addu_RS,addu_RF,addu_LT,addu_LS,addu_LF,fine2,fine3);
fine4=ripe_addu(4,1);
[addu_Basic4,addu_RT4,addu_RS4,addu_RF4,addu_LT4,addu_LS4,addu_LF4]=Taglio(addu_Basic,addu_RT,addu_RS,addu_RF,addu_LT,addu_LS,addu_LF,fine3,fine4);
fine5=ripe_addu(5,1);
[addu_Basic5,addu_RT5,addu_RS5,addu_RF5,addu_LT5,addu_LS5,addu_LF5]=Taglio(addu_Basic,addu_RT,addu_RS,addu_RF,addu_LT,addu_LS,addu_LF,fine4,fine5);
fine6=ripe_addu(6,1);
[addu_Basic6,addu_RT6,addu_RS6,addu_RF6,addu_LT6,addu_LS6,addu_LF6]=Taglio(addu_Basic,addu_RT,addu_RS,addu_RF,addu_LT,addu_LS,addu_LF,fine5,fine6);
fine7=ripe_addu(7,1);
[addu_Basic7,addu_RT7,addu_RS7,addu_RF7,addu_LT7,addu_LS7,addu_LF7]=Taglio(addu_Basic,addu_RT,addu_RS,addu_RF,addu_LT,addu_LS,addu_LF,fine6,fine7);
fine8=ripe_addu(8,1);
[addu_Basic8,addu_RT8,addu_RS8,addu_RF8,addu_LT8,addu_LS8,addu_LF8]=Taglio(addu_Basic,addu_RT,addu_RS,addu_RF,addu_LT,addu_LS,addu_LF,fine7,fine8);
fine9=ripe_addu(9,1);
[addu_Basic9,addu_RT9,addu_RS9,addu_RF9,addu_LT9,addu_LS9,addu_LF9]=Taglio(addu_Basic,addu_RT,addu_RS,addu_RF,addu_LT,addu_LS,addu_LF,fine8,fine9);
[addu_Basic10,addu_RT10,addu_RS10,addu_RF10,addu_LT10,addu_LS10,addu_LF10]=Taglio(addu_Basic,addu_RT,addu_RS,addu_RF,addu_LT,addu_LS,addu_LF,fine9,size(addu_Basic(:,1),1));

% Process sensor data through algorithm

%Squat
[quaternion_squat_Basic]=FusionSquat5rip(squat_Basic1,squat_Basic2,squat_Basic3,squat_Basic4,squat_Basic5);
[quaternion_squat_LT]=FusionSquat5rip(squat_LT1,squat_LT2,squat_LT3,squat_LT4,squat_LT5);
[quaternion_squat_LS]=FusionSquat5rip(squat_LS1,squat_LS2,squat_LS3,squat_LS4,squat_LS5);
[quaternion_squat_LF]=FusionSquat5rip(squat_LF1,squat_LF2,squat_LF3,squat_LF4,squat_LF5);
[quaternion_squat_RT]=FusionSquat5rip(squat_RT1,squat_RT2,squat_RT3,squat_RT4,squat_RT5);
[quaternion_squat_RS]=FusionSquat5rip(squat_RS1,squat_RS2,squat_RS3,squat_RS4,squat_RS5);
[quaternion_squat_RF]=FusionSquat5rip(squat_RF1,squat_RF2,squat_RF3,squat_RF4,squat_RF5);

%Flexknee
[quaternion_flexknee_Basic]=Fusion5rip(flexknee_Basic1,flexknee_Basic2,flexknee_Basic3,flexknee_Basic4,flexknee_Basic5,flexknee_Basic6,flexknee_Basic7,flexknee_Basic8,flexknee_Basic9,flexknee_Basic10);
[quaternion_flexknee_LT]=Fusion5rip(flexknee_LT1,flexknee_LT2,flexknee_LT3,flexknee_LT4,flexknee_LT5,flexknee_LT6,flexknee_LT7,flexknee_LT8,flexknee_LT9,flexknee_LT10);
[quaternion_flexknee_LS]=Fusion5rip(flexknee_LS1,flexknee_LS2,flexknee_LS3,flexknee_LS4,flexknee_LS5,flexknee_LS6,flexknee_LS7,flexknee_LS8,flexknee_LS9,flexknee_LS10);
[quaternion_flexknee_LF]=Fusion5rip(flexknee_LF1,flexknee_LF2,flexknee_LF3,flexknee_LF4,flexknee_LF5,flexknee_LF6,flexknee_LF7,flexknee_LF8,flexknee_LF9,flexknee_LF10);
[quaternion_flexknee_RT]=Fusion5rip(flexknee_RT1,flexknee_RT2,flexknee_RT3,flexknee_RT4,flexknee_RT5,flexknee_RT6,flexknee_RT7,flexknee_RT8,flexknee_RT9,flexknee_RT10);
[quaternion_flexknee_RS]=Fusion5rip(flexknee_RS1,flexknee_RS2,flexknee_RS3,flexknee_RS4,flexknee_RS5,flexknee_RS6,flexknee_RS7,flexknee_RS8,flexknee_RS9,flexknee_RS10);
[quaternion_flexknee_RF]=Fusion5rip(flexknee_RF1,flexknee_RF2,flexknee_RF3,flexknee_RF4,flexknee_RF5,flexknee_RF6,flexknee_RF7,flexknee_RF8,flexknee_RF9,flexknee_RF10);

%Flexhip
[quaternion_flexhip_Basic]=Fusion5rip(flexhip_Basic1,flexhip_Basic2,flexhip_Basic3,flexhip_Basic4,flexhip_Basic5,flexhip_Basic6,flexhip_Basic7,flexhip_Basic8,flexhip_Basic9,flexhip_Basic10);
[quaternion_flexhip_LT]=Fusion5rip(flexhip_LT1,flexhip_LT2,flexhip_LT3,flexhip_LT4,flexhip_LT5,flexhip_LT6,flexhip_LT7,flexhip_LT8,flexhip_LT9,flexhip_LT10);
[quaternion_flexhip_LS]=Fusion5rip(flexhip_LS1,flexhip_LS2,flexhip_LS3,flexhip_LS4,flexhip_LS5,flexhip_LS6,flexhip_LS7,flexhip_LS8,flexhip_LS9,flexhip_LS10);
[quaternion_flexhip_LF]=Fusion5rip(flexhip_LF1,flexhip_LF2,flexhip_LF3,flexhip_LF4,flexhip_LF5,flexhip_LF6,flexhip_LF7,flexhip_LF8,flexhip_LF9,flexhip_LF10);
[quaternion_flexhip_RT]=Fusion5rip(flexhip_RT1,flexhip_RT2,flexhip_RT3,flexhip_RT4,flexhip_RT5,flexhip_RT6,flexhip_RT7,flexhip_RT8,flexhip_RT9,flexhip_RT10);
[quaternion_flexhip_RS]=Fusion5rip(flexhip_RS1,flexhip_RS2,flexhip_RS3,flexhip_RS4,flexhip_RS5,flexhip_RS6,flexhip_RS7,flexhip_RS8,flexhip_RS9,flexhip_RS10);
[quaternion_flexhip_RF]=Fusion5rip(flexhip_RF1,flexhip_RF2,flexhip_RF3,flexhip_RF4,flexhip_RF5,flexhip_RF6,flexhip_RF7,flexhip_RF8,flexhip_RF9,flexhip_RF10);

%addu
[quaternion_addu_Basic]=Fusion5rip(addu_Basic1,addu_Basic2,addu_Basic3,addu_Basic4,addu_Basic5,addu_Basic6,addu_Basic7,addu_Basic8,addu_Basic9,addu_Basic10);
[quaternion_addu_LT]=Fusion5rip(addu_LT1,addu_LT2,addu_LT3,addu_LT4,addu_LT5,addu_LT6,addu_LT7,addu_LT8,addu_LT9,addu_LT10);
[quaternion_addu_LS]=Fusion5rip(addu_LS1,addu_LS2,addu_LS3,addu_LS4,addu_LS5,addu_LS6,addu_LS7,addu_LS8,addu_LS9,addu_LS10);
[quaternion_addu_LF]=Fusion5rip(addu_LF1,addu_LF2,addu_LF3,addu_LF4,addu_LF5,addu_LF6,addu_LF7,addu_LF8,addu_LF9,addu_LF10);
[quaternion_addu_RT]=Fusion5rip(addu_RT1,addu_RT2,addu_RT3,addu_RT4,addu_RT5,addu_RT6,addu_RT7,addu_RT8,addu_RT9,addu_RT10);
[quaternion_addu_RS]=Fusion5rip(addu_RS1,addu_RS2,addu_RS3,addu_RS4,addu_RS5,addu_RS6,addu_RS7,addu_RS8,addu_RS9,addu_RS10);
[quaternion_addu_RF]=Fusion5rip(addu_RF1,addu_RF2,addu_RF3,addu_RF4,addu_RF5,addu_RF6,addu_RF7,addu_RF8,addu_RF9,addu_RF10);

%% Faccio la tabella 
[Squat]=Table(quaternion_squat_Basic,quaternion_squat_RT,quaternion_squat_RS,quaternion_squat_RF,quaternion_squat_LT,quaternion_squat_LS,quaternion_squat_LF);
[Adduzione]=Table(quaternion_addu_Basic,quaternion_addu_RT,quaternion_addu_RS,quaternion_addu_RF,quaternion_addu_LT,quaternion_addu_LS,quaternion_addu_LF);
[Flexhip]=Table(quaternion_flexhip_Basic,quaternion_flexhip_RT,quaternion_flexhip_RS,quaternion_flexhip_RF,quaternion_flexhip_LT,quaternion_flexhip_LS,quaternion_flexhip_LF);
[Flexknee]=Table(quaternion_flexknee_Basic,quaternion_flexknee_RT,quaternion_flexknee_RS,quaternion_flexknee_RF,quaternion_flexknee_LT,quaternion_flexknee_LS,quaternion_flexknee_LF);

%% SALVA
 writetable( Squat,'SquatFilo5.csv','Delimiter',',','Encoding', 'UTF-8');
 writetable( Adduzione,'AdduzioneFilo5.csv','Delimiter',',','Encoding', 'UTF-8');
 writetable( Flexhip,'FlexhipFilo5.csv','Delimiter',',','Encoding', 'UTF-8');
 writetable( Flexknee,'FlexkneeFilo5.csv','Delimiter',',','Encoding', 'UTF-8');


