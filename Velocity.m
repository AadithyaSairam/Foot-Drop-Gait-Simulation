%% Inputs: muscle activation, normalized muscle length, normalized tendon length
%% Output: Velocity
function [root] = Velocity(a, lm, lt)
% damping coefficient
beta = 0.1;
% Equation from Millard et al. (2013)
% Factored out maximum isometric force term since the RHS of the final equation of the muscle model is set to 0.
% For simplicity, pennation angle (alpha) is set to 0 which yields to cos(alpha) = 1.
model = @(vm) (a*ForceLength(lm)*ForceVelocity(vm)+ForceParallel(lm)+beta*vm) - ForceTendon(lt);

% Find the root that is a value of vm where force_velocity_muscle(vm) is equal to 0 in the muscle model equation by using 0 as initial condition. 

root = fzero(model, 0);

end
