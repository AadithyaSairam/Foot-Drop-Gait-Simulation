%% Inputs: Force of Soleus, Force of TA
%% Outputs: Angular Velocity equation
% Calculations based on mechanical analysis shown in FIGURE in report
function AngularVelocity = GetAngularVelocity(a, b, prevtheta, RestingTendonLength_soleus, RestingMuscleLength_soleus, RestingTendonLength_TA, RestingMuscleLength_TA)
    % Getting forces being applied to ankle/foot by soleus and TA
    ForceSoleus = Force_Soleus(b, prevtheta, RestingTendonLength_soleus, RestingMuscleLength_soleus);
    ForceTA = Force_TA(a, prevtheta, RestingTendonLength_TA, RestingMuscleLength_TA);
    % Getting coordinates of muscle attachment points to foot (diagram in report)        
    coords_soleus = Coordinates_Soleus(prevtheta);
    coords_TA = Coordinates_TA(prevtheta);

    % Trigonometry  to calculate the distance of the force being applied to the ankle to the point of rotation in the anke
    % 90 degrees converted to 1.5708 radians from analysis
    h_soleus = sqrt((coords_soleus(1))^2 +(coords_soleus(2))^2 );
    h_TA = sqrt((coords_TA(1))^2 +(coords_TA(2))^2 );
    theta_soleus = 1.5708 - atan((abs(coords_soleus(1))/(abs(coords_soleus(2)))));
    theta_TA = 1.5708 - atan((abs(coords_TA(1))/(abs(coords_TA(2)))));
    d_soleus = cos(theta_soleus) * h_soleus;
    d_TA = cos(theta_TA) * h_TA;
    d_gravity = 0.0208*(tan(abs(0.463 - theta_TA + 0.5929)));

    % Calculating the moment about the point of rotation in the ankle
    MomentGravity = 1.22 * 9.8 * d_gravity; 
    Moment_Soleus = ForceSoleus * d_soleus;
    Moment_TA = ForceTA * d_TA;
    TotalMoment = -Moment_Soleus + Moment_TA - MomentGravity ;

    % Moment of inertia value based on average foot dimensions (see FIGURE in report)
    Inertia = 0.0508;
    
    % Calculation of angular velocity
    AngularVelocity = TotalMoment/Inertia ;
    

end