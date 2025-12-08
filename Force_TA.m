%% Inputs: muscle activation (a), angle, resting tendon length, resting muscle length
%% Output: Force beign applied by the TA
function ForceTA = Force_TA (a, prevtheta, RestingTendonLength, RestingMuscleLength)
    Fmax = 597.6; %% Markowitz J, Herr H (2016)
    lm = MuscleLength_TA(Coordinates_TA(prevtheta), RestingMuscleLength); %% Getting normalized TA length
    muscle_tendon_length = RestingMuscleLength + RestingTendonLength ; %% Resting muscle/tendon combined length
    lt = Length_Tendon(muscle_tendon_length, lm, RestingMuscleLength, RestingTendonLength); %% Getting length of TA tendon
    ForceTA = a * ForceLength(lm) * ForceVelocity(Velocity(a, lm, lt)) * Fmax + ForceParallel(lm); %% Equation from lecture slides
    disp (a)
end

