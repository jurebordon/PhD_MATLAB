% Init all the parameters

strelkowa_init_ODE;

% Run simulation

sim('strelkowa_rep3_ODE');

% Plot results

plot(P_out_ODE(:,1),P_out_ODE(:,2),'b',P_out_ODE(:,1),P_out_ODE(:,3),'r',P_out_ODE(:,1),P_out_ODE(:,4),'g');