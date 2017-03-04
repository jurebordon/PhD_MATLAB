% Init all the parameters and FIS

init_Strelkowa_FLTransk_jcb;

% Run simulation

sim('strelkowa_rep3_FLtransk_jcb');

% Plot results

plot(P_out(:,1),P_out(:,2),'b',P_out(:,1),P_out(:,3),'r',P_out(:,1),P_out(:,4),'g');