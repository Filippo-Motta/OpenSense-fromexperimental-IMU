function [quaternion]=FusionSquat(ripe1,ripe2,ripe3,ripe4,ripe5)

AHRS = MadgwickAHRS('SamplePeriod', 1/100, 'Beta', 0.001);
time=linspace(0, size(ripe1,1),size(ripe1,1))';
quaternion1 = zeros(length(time), 4);
 for t=1:length(time) 
    AHRS.Update(ripe1(t,8:10) * (pi/180), ripe1(t,5:7), ripe1(t,11:13));
    quaternion1(t, :) = AHRS.Quaternion; 
 end
 time=linspace(0, size(ripe2,1),size(ripe2,1))';
 quaternion2 = zeros(length(time), 4);
 for t=1:length(time) 
    AHRS.Update(ripe2(t,8:10) * (pi/180), ripe2(t,5:7), ripe2(t,11:13));
    quaternion2(t, :) = AHRS.Quaternion; 
 end
 time=linspace(0, size(ripe3,1),size(ripe3,1))';
 quaternion3 = zeros(length(time), 4);
 for t=1:length(time) 
    AHRS.Update(ripe3(t,8:10) * (pi/180), ripe3(t,5:7), ripe3(t,11:13));
    quaternion3(t, :) = AHRS.Quaternion; 
 end
 time=linspace(0, size(ripe4,1),size(ripe4,1))';
 quaternion4 = zeros(length(time), 4);
 for t=1:length(time) 
    AHRS.Update(ripe4(t,8:10) * (pi/180), ripe4(t,5:7), ripe4(t,11:13));
    quaternion4(t, :) = AHRS.Quaternion; 
 end
 time=linspace(0, size(ripe5,1),size(ripe5,1))';
 quaternion5 = zeros(length(time), 4);
 for t=1:length(time) 
    AHRS.Update(ripe5(t,8:10) * (pi/180), ripe5(t,5:7), ripe5(t,11:13));
    quaternion5(t, :) = AHRS.Quaternion; 
 end
quaternion=[quaternion1; quaternion2; quaternion3;quaternion4;quaternion5];
