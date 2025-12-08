%% Inputs: muscle activation (a), angle, resting tendon length, resting muscle length
%% Output: Force beign applied by the Soleus
function ForceSoleus = Force_Soleus (a, prevtheta, RestingTendonLength, RestingMuscleLength)
    Fmax = 3735; %% Markowitz J, Herr H (2016)
    lm = MuscleLength_Soleus(Coordinates_Soleus(prevtheta), RestingMuscleLength); %% Getting normalized TA length
    muscle_tendon_length = (RestingMuscleLength + RestingTendonLength); %% Resting muscle/tendon combined length
    lt = Length_Tendon(muscle_tendon_length, lm, RestingMuscleLength, RestingTendonLength); %% Getting length of TA tendon
    ForceSoleus = a * ForceLength(lm) * ForceVelocity(Velocity(a, lm, lt)) * Fmax + ForceParallel(lm); %% Equation from lecture slides
end