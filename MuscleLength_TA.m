%% Inputs: TA Coordinates, time
%% Output: TA Length

function normlengthTA = MuscleLength_TA(Coordinates, RestingLength)
    lTA = [0.03; 0.3]; %% Coordinates of TA attachment points at rest
    lengthTA = sqrt(((Coordinates(1)-lTA(1))^2)+((Coordinates(2)-lTA(2))^2)); %Equation from Lecure Slides
    normlengthTA = lengthTA / RestingLength; % Normalization of length
end