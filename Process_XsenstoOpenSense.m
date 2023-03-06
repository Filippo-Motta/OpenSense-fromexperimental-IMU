%%
addpath('Functions');   
close all;                          
clear all;                              
clc;       

% Import Data 
SegmentOrientationQuat= readtable(['Cristina-012.xlsx'],'Sheet','Sensor Orientation - Quat');

Basic1=SegmentOrientationQuat.PelvisQ0;
Basic2=SegmentOrientationQuat.PelvisQ1;
Basic3=SegmentOrientationQuat.PelvisQ2;
Basic4=SegmentOrientationQuat.PelvisQ3;
Basic=[Basic1 Basic2 Basic3 Basic4];
RT1=SegmentOrientationQuat.RightUpperLegQ0;
RT2=SegmentOrientationQuat.RightUpperLegQ1;
RT3=SegmentOrientationQuat.RightUpperLegQ2;
RT4=SegmentOrientationQuat.RightUpperLegQ3;
RT=[RT1 RT2 RT3 RT4];
RS1=SegmentOrientationQuat.RightLowerLegQ0;
RS2=SegmentOrientationQuat.RightLowerLegQ1;
RS3=SegmentOrientationQuat.RightLowerLegQ2;
RS4=SegmentOrientationQuat.RightLowerLegQ3;
RS=[RS1 RS2 RS3 RS4];
RF1=SegmentOrientationQuat.RightFootQ0;
RF2=SegmentOrientationQuat.RightFootQ1;
RF3=SegmentOrientationQuat.RightFootQ2;
RF4=SegmentOrientationQuat.RightFootQ3;
RF=[RF1 RF2 RF3 RF4];
LT1=SegmentOrientationQuat.LeftUpperLegQ0;
LT2=SegmentOrientationQuat.LeftUpperLegQ1;
LT3=SegmentOrientationQuat.LeftUpperLegQ2;
LT4=SegmentOrientationQuat.LeftUpperLegQ3;
LT=[LT1 LT2 LT3 LT4];
LS1=SegmentOrientationQuat.LeftLowerLegQ0;
LS2=SegmentOrientationQuat.LeftLowerLegQ1;
LS3=SegmentOrientationQuat.LeftLowerLegQ2;
LS4=SegmentOrientationQuat.LeftLowerLegQ3;
LS=[LS1 LS2 LS3 LS4];
LF1=SegmentOrientationQuat.LeftFootQ0;
LF2=SegmentOrientationQuat.LeftFootQ1;
LF3=SegmentOrientationQuat.LeftFootQ2;
LF4=SegmentOrientationQuat.LeftFootQ3;
LF=[LF1 LF2 LF3 LF4];
%% movimenti utili:
% PER SQUAT 
figure
plot(RT(:,1),'r');
hold on
plot(RT(:,2),'b');
plot(RT(:,3),'g');
legend('X', 'Y', 'Z');
title('Scegli inizio_squat e fine_squat')
[coordinate_squat,~]=ginput(2);

% movimenti utili: PER ADDU/ABD 
figure
plot(RF(:,1),'r');
hold on
plot(RF(:,2),'b');
plot(RF(:,3),'g');
legend('X', 'Y', 'Z');
title('scegli inizio_addu')
[inizio_addu,~]=ginput(1);

figure
plot(LF(:,1),'r');
hold on
plot(LF(:,2),'b');
plot(LF(:,3),'g');
legend('X', 'Y', 'Z');
title('scegli fine_addu')
[fine_addu,~]=ginput(1);

% PER FLEX/EXT HIP 
figure
plot(RF(:,1),'r');
hold on
plot(RF(:,2),'b');
plot(RF(:,3),'g');
legend('X', 'Y', 'Z');
title('scegli inizio_flexhip')
[inizio_flexhip,~]=ginput(1);

figure
plot(LF(:,1),'r');
hold on
plot(LF(:,2),'b');
plot(LF(:,3),'g');
legend('X', 'Y', 'Z');
title('scegli fine_flexhip')
[fine_flexhip,~]=ginput(1);

% PER FLEX/EXT KNEE 
figure
plot(RF(:,1),'r');
hold on
plot(RF(:,2),'b');
plot(RF(:,3),'g');
legend('X', 'Y', 'Z');
title('scegli inizio_flexknee')
[inizio_flexknee,~]=ginput(1);

figure
plot(LF(:,1),'r');
hold on
plot(LF(:,2),'b');
plot(LF(:,3),'g');
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
% Taglio ADD/ABD
inizio=inizio_addu;
fine=fine_addu;
addu_Basic=Basic(inizio:fine,:);
addu_RT=RT(inizio:fine,:);
addu_RS=RS(inizio:fine,:);
addu_RF=RF(inizio:fine,:);
addu_LT=LT(inizio:fine,:);
addu_LS=LS(inizio:fine,:);
addu_LF=LF(inizio:fine,:);
% Taglio FLEX/EXT HIP
inizio=inizio_flexhip;
fine=fine_flexhip;
flexhip_Basic=Basic(inizio:fine,:);
flexhip_RT=RT(inizio:fine,:);
flexhip_RS=RS(inizio:fine,:);
flexhip_RF=RF(inizio:fine,:);
flexhip_LT=LT(inizio:fine,:);
flexhip_LS=LS(inizio:fine,:);
flexhip_LF=LF(inizio:fine,:);
% Taglio FLEX/EXT KNEE
inizio=inizio_flexknee;
fine=fine_flexknee;
flexknee_Basic=Basic(inizio:fine,:);
flexknee_RT=RT(inizio:fine,:);
flexknee_RS=RS(inizio:fine,:);
flexknee_RF=RF(inizio:fine,:);
flexknee_LT=LT(inizio:fine,:);
flexknee_LS=LS(inizio:fine,:);
flexknee_LF=LF(inizio:fine,:);

% Faccio la tabella 
[Squat]=Table(squat_Basic,squat_RT,squat_RS,squat_RF,squat_LT,squat_LS,squat_LF);
[Adduzione]=Table(addu_Basic,addu_RT,addu_RS,addu_RF,addu_LT,addu_LS,addu_LF);
[Flexhip]=Table(flexhip_Basic,flexhip_RT,flexhip_RS,flexhip_RF,flexhip_LT,flexhip_LS,flexhip_LF);
[Flexknee]=Table(flexknee_Basic,flexknee_RT,flexknee_RS,flexknee_RF,flexknee_LT,flexknee_LS,flexknee_LF);

%% SALVA
 writetable( Squat,'SquatCristina12Xsens.csv','Delimiter',',','Encoding', 'UTF-8');
 writetable( Adduzione,'AdduzioneCristina12Xsens.csv','Delimiter',',','Encoding', 'UTF-8');
 writetable( Flexhip,'FlexhipCristina12Xsens.csv','Delimiter',',','Encoding', 'UTF-8');
 writetable( Flexknee,'FlexkneeCristina12Xsens.csv','Delimiter',',','Encoding', 'UTF-8');


