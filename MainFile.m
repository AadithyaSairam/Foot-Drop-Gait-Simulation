clear
clc

global force_length_regression force_velocity_regression
force_length_regression = ForceLengthRegression(); 
force_velocity_regression = ForceVelocityRegression ();


time = 0.4; %% Total time of the swing phase
stimulationDuration = 0.2; %% 0.1 Length of stimulus
stimulationTime = 0.15; %% 0.1 Point in time which stimulus occurs
Frequency = 31; %30
Amplitude = 75; %50

RestingTendonLength_Soleus = 0.35; %% Averages found from CITATION
RestingTendonLength_TA = 0.23;

RestingMuscleLength_Soleus = 0.36; %% Averages found from CITATION
RestingMuscleLength_TA = 0.298;

SimulateModel (time, RestingTendonLength_Soleus, RestingMuscleLength_Soleus, RestingTendonLength_TA, RestingMuscleLength_TA, stimulationDuration, stimulationTime, Frequency, Amplitude)