%% Inputs: total muscle-tendon length, normalized muscle length, resting muscle length, resting tendon length
%% Output: Normalized tendon length
function normalized_tendon_length = Length_Tendon(muscle_tendon_length, normalized_muscle_length, resting_length_muscle, resting_length_tendon)
    % Equation from Assignment 2
    normalized_tendon_length = (muscle_tendon_length - resting_length_muscle * normalized_muscle_length) / resting_length_tendon;
end