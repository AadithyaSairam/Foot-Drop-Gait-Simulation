%% Input: normalized length of muscle
%% Output: Force-Length scale factor
function [force_length_scale_factor] = ForceLength(length)

global force_length_regression 
force_length_scale_factor = feval(force_length_regression, length); %% Evaluating the Force-Length regression
end