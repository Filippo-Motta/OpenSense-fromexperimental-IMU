function[Tabella]=Table(quaternion_Basic,quaternion_RT,quaternion_RS,quaternion_RF,quaternion_LT,quaternion_LS,quaternion_LF)
Time=(0:1/100:length(quaternion_Basic)/100)';

% l'ordine è: IMU BASE, DESTRA (T, S, F) e infine SINISTRA (T,S,F)
Time=[ "Sample Rate:"; "Time"; "s"; Time(1:end-1)];
quat1_static=["100";"Static/Orientation/Scalar";NaN;quaternion_Basic(:,1)];
quat2_static=["Hz";"Static/Orientation/X";NaN; quaternion_Basic(:,2)];
quat3_static=[NaN;"Static/Orientation/Y";NaN;quaternion_Basic(:,3)];
quat4_static=[NaN;"Static/Orientation/Z";NaN;quaternion_Basic(:,4)];
quat1_Upper_r=[NaN;"Upper_r/Orientation/Scalar";NaN;quaternion_RT(:,1)];
quat2_Upper_r=[NaN;"Upper_r/Orientation/X";NaN;quaternion_RT(:,2)];
quat3_Upper_r=[NaN;"Upper_r/Orientation/Y";NaN;quaternion_RT(:,3)];
quat4_Upper_r=[NaN;"Upper_r/Orientation/Z";NaN;quaternion_RT(:,4)];
quat1_Middle_r=[NaN;"Middle_r/Orientation/Scalar";NaN;quaternion_RS(:,1)];
quat2_Middle_r=[NaN;"Middle_r/Orientation/X";NaN;quaternion_RS(:,2)];
quat3_Middle_r=[NaN;"Middle_r/Orientation/Y";NaN;quaternion_RS(:,3)];
quat4_Middle_r=[NaN;"Middle_r/Orientation/Z";NaN;quaternion_RS(:,4)];
quat1_Lower_r=[NaN;"Lower_r/Orientation/Scalar";NaN;quaternion_RF(:,1)];
quat2_Lower_r=[NaN;"Lower_r/Orientation/X";NaN;quaternion_RF(:,2)];
quat3_Lower_r=[NaN;"Lower_r/Orientation/Y";NaN;quaternion_RF(:,3)];
quat4_Lower_r=[NaN;"Lower_r/Orientation/Z";NaN;quaternion_RF(:,4)];
quat1_Upper_l=[NaN;"Upper_l/Orientation/Scalar";NaN;quaternion_LT(:,1)];
quat2_Upper_l=[NaN;"Upper_l/Orientation/X";NaN;quaternion_LT(:,2)];
quat3_Upper_l=[NaN;"Upper_l/Orientation/Y";NaN;quaternion_LT(:,3)];
quat4_Upper_l=[NaN;"Upper_l/Orientation/Z";NaN;quaternion_LT(:,4)];
quat1_Middle_l=[NaN;"Middle_l/Orientation/Scalar";NaN;quaternion_LS(:,1)];
quat2_Middle_l=[NaN;"Middle_l/Orientation/X";NaN;quaternion_LS(:,2)];
quat3_Middle_l=[NaN;"Middle_l/Orientation/Y";NaN;quaternion_LS(:,3)];
quat4_Middle_l=[NaN;"Middle_l/Orientation/Z";NaN;quaternion_LS(:,4)];
quat1_Lower_l=[NaN;"Lower_l/Orientation/Scalar";NaN;quaternion_LF(:,1)];
quat2_Lower_l=[NaN;"Lower_l/Orientation/X";NaN;quaternion_LF(:,2)];
quat3_Lower_l=[NaN;"Lower_l/Orientation/Y";NaN;quaternion_LF(:,3)];
quat4_Lower_l=[NaN;"Lower_l/Orientation/Z";NaN;quaternion_LF(:,4)];

 header = {'Time',	'quat1_static',	'quat2_static',	'quat3_static',	'quat4_static','quat1_Upper_r',	'quat2_Upper_r',	'quat3_Upper_r',	'quat4_Upper_r',	'quat1_Middle_r',	'quat2_Middle_r',	'quat3_Middle_r',	'quat4_Middle_r','quat1_Lower_r',	'quat2_Lower_r',	'quat3_Lower_r',	'quat4_Lower_r','quat1_Upper_l',	'quat2_Upper_l',	'quat3_Upper_l',	'quat4_Upper_l','quat1_Middle_l',	'quat2_Middle_l',	'quat3_Middle_l',	'quat4_Middle_l','quat1_Lower_l',	'quat2_Lower_l',	'quat3_Lower_l',	'quat4_Lower_l'}; 

Tabella=table( Time, quat1_static, quat2_static, quat3_static,quat4_static,...
 quat1_Upper_r, quat2_Upper_r, quat3_Upper_r,quat4_Upper_r,...
 quat1_Middle_r, quat2_Middle_r, quat3_Middle_r,quat4_Middle_r,...
quat1_Lower_r, quat2_Lower_r, quat3_Lower_r,quat4_Lower_r,...
 quat1_Upper_l, quat2_Upper_l, quat3_Upper_l,quat4_Upper_l,...
 quat1_Middle_l, quat2_Middle_l, quat3_Middle_l,quat4_Middle_l,...
 quat1_Lower_l, quat2_Lower_l, quat3_Lower_l,quat4_Lower_l);

Tabella.Properties.VariableNames = header;