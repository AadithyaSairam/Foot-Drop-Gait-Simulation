%% Input: Frequency (Hz), Amplitude (mA)
%% Output: Muscle Activation
function a = MuscleActivation(Frequency, Amplitude)
    % Normalization
    % Frequency range between 16 and 50 hz
    normFreq = (Frequency - 16) / 50;
    % Amplitude range between 0 and 100 mA
    normAmp = (Amplitude) / 100;
    % Calculation of normalized current
    normCurrent = normFreq * normAmp ;

    activation = 1.1737 * normCurrent^3 - 2.8216 * normCurrent^2 + 2.5415 * normCurrent - 0.0047 ;
    
    if activation < 0
        a = 0;
    else
        a = activation;
    end

end