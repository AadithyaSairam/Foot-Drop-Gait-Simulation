%% Input: Normalized Muscle Length
%% Output: Force-Parallel scale factor
% Equation from Assignment 2
% Assuming slack length of parallel element is 1
function FPE = ForceParallel(length)
    if length < 1
        FPE = 0;
    else
        FPE = 3 * (length - 1).^2 / (0.6 + length - 1);
    end

end