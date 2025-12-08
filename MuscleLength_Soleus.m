%% Inputs: Soleus Coordinates, time
%% Output: Soleus Length

function normlengthSoleus = MuscleLength_Soleus(Coordinates, RestingLength)
    lS = [-0.03; 0.3]; %% Coordinates of soleus attachment points at rest
    lengthSoleus = sqrt(((Coordinates(1)-lS(1))^2)+((Coordinates(2)-lS(2))^2)); %Equation from Lecure Slides
    normlengthSoleus = lengthSoleus / RestingLength; % Normalization of length
end