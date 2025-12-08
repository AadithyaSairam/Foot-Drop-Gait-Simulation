%% Calculation of the tension of the Tendon in the Hill Muscle Model
% Equation from Assignment 2
% Assuming slack length of series element is 1
function [normalize_tendon_tension] = ForceTendon(lt)

    if lt < 1
        [normalize_tendon_tension] = 0;
    else
        [normalize_tendon_tension] = 10 * (lt - 1) + 240 * (lt - 1).^2;

    end

