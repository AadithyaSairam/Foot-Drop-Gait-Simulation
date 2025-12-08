function SimulateModel (T, RestingTendonLength_soleus, RestingMuscleLength_soleus, RestingTendonLength_TA, RestingMuscleLength_TA, stimulationDuration, stimulationTime, Frequency, Amplitude)

   %% Finding Angular Velocity
    function thetadot = geteqn (T, prevtheta)
         if stimulationTime < T && T < stimulationTime + stimulationDuration 
            a = MuscleActivation(Frequency, Amplitude);
         else
            a = 0;
         end
         
         b = 0; %Soleus not being activated for simplicity

        thetadot = GetAngularVelocity(a, b, prevtheta, RestingTendonLength_soleus, RestingMuscleLength_soleus, RestingTendonLength_TA, RestingMuscleLength_TA);

    end
    
    y0 = 0; % Inital change in angle is 0 
    [time, angle] = ode45(@geteqn, [0,T], y0); % Integrating the angular velocity to get the angle over time

    % Converting to degrees, then subtracting the angle at rest (standing) to get the angle difference (to compare to paper) 
    % Making it negative since the graph from the paper has dorsiflexion (decreasing angle) as positive 
    [degrees] = (angle * (180/pi)) + 22.33567426; %Assuming its already dorsiflexed at beginning of swing phase to match literature model
    
    [Model] = [0.004427191,22.33567426
0.018023473,22.3155548
0.032895544,22.40989271
0.046695915,22.23878552
0.05812265,20.78325835
0.071966948,20.90097222
0.082391372,17.4471395
0.095371835,16.53107588
0.107204576,13.53977759
0.107135437,11.2042908
0.110270287,9.522400823
0.122531909,8.321226124
0.12910989,6.190127197
0.142393605,5.554102201
0.157223298,5.103892875
0.172139301,5.762761394
0.187070855,6.621463758
0.20199891,7.435203507
0.21690286,7.939200795
0.231795536,8.298318545
0.246692099,8.707394756
0.26158944,9.12646266
0.276483671,9.505563794
0.291369737,9.77975216
0.306262802,10.14386576
0.32114498,10.36809566
0.336009275,10.36251664
0.350865794,10.2570207
0.365382906,9.924604853
0.379493649,9.331684836
0.393463061,9.196605376
0.395099777,6.868740092];



    figure()
    LineWidth = 1.5;
    FontSize = 12;
    
    plot(time, degrees, 'LineWidth', LineWidth)
    hold on
    plot(Model (:, 1), Model(:, 2),'LineWidth', LineWidth)
    hold off
    xlabel('Time (s)')
    ylabel('Angle (Degrees)')
    legend('Our Model','AFO Model')
    set(gca,'FontSize', FontSize)

end