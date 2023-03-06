
% Import the OpenSim libraries
import org.opensim.modeling.*;
 
% Define the trial name
trialName = 'Adduction.csv';

% Create an APDMDataReader and supply the settings file that maps IMUs to your model
apdmSettings = APDMDataReaderSettings('exampleAPDM_Settings.xml');
myAPDMDataReader = APDMDataReader(apdmSettings);
  
% Read the quaternion data and write it to a STO file for use in OpenSense workflow
tables = myAPDMDataReader.read(trialName);
quaternionTable = myAPDMDataReader.getOrientationsTable(tables);
STOFileAdapterQuaternion.write(quaternionTable,  strrep(trialName,'.csv', '_orientations.sto') );

trialName = 'Squat.csv';
tables = myAPDMDataReader.read(trialName);
quaternionTable = myAPDMDataReader.getOrientationsTable(tables);
STOFileAdapterQuaternion.write(quaternionTable,  strrep(trialName,'.csv', '_orientations.sto') );

trialName = 'Flexhip.csv';
tables = myAPDMDataReader.read(trialName);
quaternionTable = myAPDMDataReader.getOrientationsTable(tables);
STOFileAdapterQuaternion.write(quaternionTable,  strrep(trialName,'.csv', '_orientations.sto') );

trialName = 'Flexknee.csv';
tables = myAPDMDataReader.read(trialName);
quaternionTable = myAPDMDataReader.getOrientationsTable(tables);
STOFileAdapterQuaternion.write(quaternionTable,  strrep(trialName,'.csv', '_orientations.sto') );

%opensense -ReadAPDM exampleAPDM_Data.csv exampleAPDM_Settings.xml

% %% Calibration
% 
% % Setup and run the IMUPlacer tool, with model visualization set to true
% myIMUPlacer = IMUPlacer('myIMUPlacer_Setup.xml');
% myIMUPlacer.run(true); 
%  
% % Write the calibrated model to file
% myIMUPlacer.getCalibratedModel().print('Rajagopal_2015_calibrated.osim');
% 
% %% IMU sensors tracking
% % Setup and run the IMU IK tool with visualization set to true.
% imuIK = IMUInverseKinematicsTool('myIMUIK_Setup.xml');
% imuIK.run(true);