%% Input: Muscle velocity
%% Output: Force-Velocity scale factor
function [force_velocity_scale_factor] = ForceVelocity(vm)

if size(vm, 2) > size(vm, 1)
    vm = vm';
end
global force_velocity_regression
force_velocity_scale_factor = model_eval('Sigmoid', vm, force_velocity_regression); %% Evaluating the Force-Velocity regression
end