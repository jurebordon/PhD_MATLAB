ALL_neurospora_init
daynight_on = 0;

% ODE
figure(1);
sim('ODE_neurospora_model_leloup');

plot(All(:,1),All(:,2)) % mRNA
hold on
plot(All(:,1),All(:,3)) % Total FRQ
plot(All(:,1),All(:,4)) % Nuclear FRQ
hold off

axis([0 72 0 10]);
title('ODE');
xlabel('Time [h]');
ylabel('Concentration [nM]');
legend('mRNA', 'Total FRQ', 'Nuclear FRQ');

% Fuzzy translation
figure(2);
sim('FUZZY_tsl_neurospora_model_leloup');

plot(All(:,1),All(:,2)) % mRNA
hold on
plot(All(:,1),All(:,3)) % Total FRQ
plot(All(:,1),All(:,4)) % Nuclear FRQ
hold off

axis([0 72 0 10]);
title('ODE + Fuzzy translation');
xlabel('Time [h]');
ylabel('Concentration [nM]');
legend('mRNA', 'Total FRQ', 'Nuclear FRQ');

% Fuzzy transcription
figure(3);
sim('FUZZY_tsc_neurospora_model_leloup');

plot(All(:,1),All(:,2)) % mRNA
hold on
plot(All(:,1),All(:,3)) % Total FRQ
plot(All(:,1),All(:,4)) % Nuclear FRQ
hold off

axis([0 72 0 10]);
title('ODE + Fuzzy transcription');
xlabel('Time [h]');
ylabel('Concentration [nM]');
legend('mRNA', 'Total FRQ', 'Nuclear FRQ');

% Fuzzy degradation of F_C
figure(4);
sim('FUZZY_degFC_neurospora_model_leloup');

plot(All(:,1),All(:,2)) % mRNA
hold on
plot(All(:,1),All(:,3)) % Total FRQ
plot(All(:,1),All(:,4)) % Nuclear FRQ
hold off

axis([0 72 0 10]);
title('ODE + Fuzzy degradation of F_C');
xlabel('Time [h]');
ylabel('Concentration [nM]');
legend('mRNA', 'Total FRQ', 'Nuclear FRQ');

% Fuzzy degradation of mRNA
figure(5);
sim('FUZZY_degmRNA_neurospora_model_leloup');

plot(All(:,1),All(:,2)) % mRNA
hold on
plot(All(:,1),All(:,3)) % Total FRQ
plot(All(:,1),All(:,4)) % Nuclear FRQ
hold off

axis([0 72 0 10]);
title('ODE + Fuzzy degradation of mRNA');
xlabel('Time [h]');
ylabel('Concentration [nM]');
legend('mRNA', 'Total FRQ', 'Nuclear FRQ');

% Fuzzy degradation of mRNA and F_C
figure(6);
sim('FUZZY_deg_neurospora_model_leloup');

plot(All(:,1),All(:,2)) % mRNA
hold on
plot(All(:,1),All(:,3)) % Total FRQ
plot(All(:,1),All(:,4)) % Nuclear FRQ
hold off

axis([0 72 0 10]);
title('ODE + Fuzzy degradation of mRNA and F_C');
xlabel('Time [h]');
ylabel('Concentration [nM]');
legend('mRNA', 'Total FRQ', 'Nuclear FRQ');

% Fuzzy transcription and translation
figure(7);
sim('FUZZY_tsc_tsl_neurospora_model_leloup');

plot(All(:,1),All(:,2)) % mRNA
hold on
plot(All(:,1),All(:,3)) % Total FRQ
plot(All(:,1),All(:,4)) % Nuclear FRQ
hold off

axis([0 72 0 10]);
title('ODE + Fuzzy transcription and translation');
xlabel('Time [h]');
ylabel('Concentration [nM]');
legend('mRNA', 'Total FRQ', 'Nuclear FRQ');

% Fuzzy full
figure(8);
sim('FUZZY_full_neurospora_model_leloup');

plot(All(:,1),All(:,2)) % mRNA
hold on
plot(All(:,1),All(:,3)) % Total FRQ
plot(All(:,1),All(:,4)) % Nuclear FRQ
hold off

axis([0 72 0 10]);
title('All Fuzzy processes');
xlabel('Time [h]');
ylabel('Concentration [nM]');
legend('mRNA', 'Total FRQ', 'Nuclear FRQ');

