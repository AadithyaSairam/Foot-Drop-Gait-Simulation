%% Inputs: Prev. Angle
%% Outputs: Osx, Osy (coordidnates of the TA attachment to the ankle)
% Diagram for coordinates shown in report

function [TA_Coordinates] = Coordinates_TA(theta)
    A = [0.06; -0.03];
    B = [cos(theta), -sin(theta) 
        sin(theta), cos(theta)]; %% From Lecure Slides
    [TA_Coordinates] = B * A ;
end