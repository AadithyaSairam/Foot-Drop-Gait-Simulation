%% Inputs: Prev. Angle
%% Outputs: Osx, Osy (coordidnates of the soleus attachment to the ankle)
% Diagram for coordinates shown in report

function [Soleus_Coordinates] = Coordinates_Soleus(theta)
    A = [-0.05; -0.02];
    B = [cos(theta), -sin(theta); sin(theta), cos(theta)]; %%From Lecure Slides
    [Soleus_Coordinates] = B * A ;
end