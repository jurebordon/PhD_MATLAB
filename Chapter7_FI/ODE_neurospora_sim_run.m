ODE_neurospora_init
daynight_on = 0;

sim('ODE_neurospora_model_leloup');

plot(All(:,1),All(:,2)) % mRNA
hold on
plot(All(:,1),All(:,3)) % Total FRQ
plot(All(:,1),All(:,4)) % Nuclear FRQ
hold off

axis([0 72 0 10]);
xlabel('Time [h]');
ylabel('Concentration [nM]');
legend('mRNA', 'Total FRQ', 'Nuclear FRQ');