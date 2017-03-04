%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Analysis for Neurospora circadian rythm
%
%
% Fuzzy logic is defined in FIS folder
%
% We calculate integral errors (ISE and ITSE) for ODE for six
% different models using fuzzy descriptions for various processes:
%   transc_analysis_Transk_simple0.fis
%   transc_analysis_Transk_simple0.fis
%   transc_analysis_Transk_simple0.fis
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

plot_enabled = 1;

%% Simulation - how simulation results differ based on settings

ALL_neurospora_init;

sim('ODE_neurospora_model_leloup'); % F_ODE
sim('FUZZY_tsc_neurospora_model_leloup'); % F_FL_tsc
sim('FUZZY_tsl_neurospora_model_leloup'); % FFL_tsl
sim('FUZZY_tsc_tsl_neurospora_model_leloup'); % F_FL_tsc_tsl
sim('FUZZY_degFC_neurospora_model_leloup'); % F_FL_Fdeg
sim('FUZZY_degmRNA_neurospora_model_leloup'); % F_FL_mrna_deg
sim('FUZZY_deg_neurospora_model_leloup'); % F_FL_deg
sim('FUZZY_full_neurospora_model_leloup'); % F_FL_full

if (plot_enabled)
    figure(4)
    plot(F_ODE(:,1),F_ODE(:,2));
    hold on
    plot(F_FL_tsc(:,1),F_FL_tsc(:,2));
    plot(F_FL_tsl(:,1),F_FL_tsl(:,2));
    plot(F_FL_tsc_tsl(:,1),F_FL_tsc_tsl(:,2));
    plot(F_FL_Fdeg(:,1),F_FL_Fdeg(:,2));
    plot(F_FL_mrna_deg(:,1),F_FL_mrna_deg(:,2));
    plot(F_FL_deg(:,1),F_FL_deg(:,2));
    plot(F_FL_full(:,1),F_FL_full(:,2));
    hold off
    ylabel('Total FRQ [nM]','interpreter','latex','FontSize',32);
    xlabel('Time [h]','interpreter','latex','FontSize',32);
    legend('ODE', 'FL_{tsl}', 'FL_{tsc}','FL_{tsc\_tsl}', 'FL_{Fdeg}', 'FL_{mRNAdeg}', 'FL_{deg}', 'FL_{full}');
end;

ISE_ODE_vs_FL_tsc = sum((F_ODE(:,2)-F_FL_tsc(:,2)).^2);
ISE_ODE_vs_FL_tsl = sum((F_ODE(:,2)-F_FL_tsl(:,2)).^2);
ISE_ODE_vs_FL_tsc_tsl = sum((F_ODE(:,2)-F_FL_tsc_tsl(:,2)).^2);

ISE_ODE_vs_FL_Fdeg = sum((F_ODE(:,2)-F_FL_Fdeg(:,2)).^2);
ISE_ODE_vs_FL_mrna_deg = sum((F_ODE(:,2)-F_FL_mrna_deg(:,2)).^2);
ISE_ODE_vs_FL_deg = sum((F_ODE(:,2)-F_FL_deg(:,2)).^2);
ISE_ODE_vs_FL_full = sum((F_ODE(:,2)-F_FL_full(:,2)).^2);

max_integral_s = max([ISE_ODE_vs_FL_tsc,ISE_ODE_vs_FL_tsl,ISE_ODE_vs_FL_tsc_tsl,ISE_ODE_vs_FL_Fdeg,ISE_ODE_vs_FL_mrna_deg,ISE_ODE_vs_FL_deg,ISE_ODE_vs_FL_full]);

disp(['Integral error for (simulation) ODE vs FL_tsc: ', num2str(ISE_ODE_vs_FL_tsc/max_integral_s)]);
disp(['Integral error for (simulation) ODE vs FL_tsl: ', num2str(ISE_ODE_vs_FL_tsl/max_integral_s)]);
disp(['Integral error for (simulation) ODE vs FL_tsc_tsl: ', num2str(ISE_ODE_vs_FL_tsc_tsl/max_integral_s)]);
disp(['Integral error for (simulation) ODE vs FL_Fdeg: ', num2str(ISE_ODE_vs_FL_Fdeg/max_integral_s)]);
disp(['Integral error for (simulation) ODE vs FL_mrna_deg: ', num2str(ISE_ODE_vs_FL_mrna_deg/max_integral_s)]);
disp(['Integral error for (simulation) ODE vs FL_deg: ', num2str(ISE_ODE_vs_FL_deg/max_integral_s)]);
disp(['Integral error for (simulation) ODE vs FL_full: ', num2str(ISE_ODE_vs_FL_full/max_integral_s)]);
disp('-----------------------------------------------------------')

[ oscillatory_ODE, frequency_ODE, period_ODE, amplitude_ODE, spikiness_ODE, damped_ODE, power_ODE] = measureOscSpikiness (F_ODE(:,2), F_ODE(:,1), 3);
[ oscillatory_FL_tsc, frequency_FL_tsc, period_FL_tsc, amplitude_FL_tsc, spikiness_FL_tsc, damped_FL_tsc, power_FL_tsc] = measureOscSpikiness (F_FL_tsc(:,2), F_FL_tsc(:,1), 3);
[ oscillatory_FL_tsl, frequency_FL_tsl, period_FL_tsl, amplitude_FL_tsl, spikiness_FL_tsl, damped_FL_tsl, power_FL_tsl] = measureOscSpikiness (F_FL_tsl(:,2), F_FL_tsl(:,1), 3);
[ oscillatory_FL_tsc_tsl, frequency_FL_tsc_tsl, period_FL_tsc_tsl, amplitude_FL_tsc_tsl, spikiness_FL_tsc_tsl, damped_FL_tsc_tsl, power_FL_tsc_tsl] = measureOscSpikiness (F_FL_tsc_tsl(:,2), F_FL_tsc_tsl(:,1), 3);
[ oscillatory_FL_Fdeg, frequency_FL_Fdeg, period_FL_Fdeg, amplitude_FL_Fdeg, spikiness_FL_Fdeg, damped_FL_Fdeg, power_FL_Fdeg] = measureOscSpikiness (F_FL_Fdeg(:,2), F_FL_Fdeg(:,1), 3);
[ oscillatory_FL_mrna_deg, frequency_FL_mrna_deg, period_FL_mrna_deg, amplitude_FL_mrna_deg, spikiness_FL_mrna_deg, damped_FL_mrna_deg, power_FL_mrna_deg] = measureOscSpikiness (F_FL_mrna_deg(:,2), F_FL_mrna_deg(:,1), 3);
[ oscillatory_FL_deg, frequency_FL_deg, period_FL_deg, amplitude_FL_deg, spikiness_FL_deg, damped_FL_deg, power_FL_deg] = measureOscSpikiness (F_FL_deg(:,2), F_FL_deg(:,1), 3);
[ oscillatory_FL_full, frequency_FL_full, period_FL_full, amplitude_FL_full, spikiness_FL_full, damped_FL_full, power_FL_full] = measureOscSpikiness (F_FL_full(:,2), F_FL_full(:,1), 3);


disp('--------------------')
disp(['Frequency of ODE[h^-1]: ' num2str(frequency_ODE) ', difference from ref [%]: ' num2str((frequency_ODE-frequency_ODE)/frequency_ODE*100)]);
disp(['Frequency of tsc[h^-1]: ' num2str(frequency_FL_tsc) ', difference from ref [%]: ' num2str((frequency_FL_tsc-frequency_ODE)/frequency_ODE*100)]);
disp(['Frequency of tsl[h^-1]: ' num2str(frequency_FL_tsl) ', difference from ref [%]: ' num2str((frequency_FL_tsl-frequency_ODE)/frequency_ODE*100)]);
disp(['Frequency of tsc_tsl[h^-1]: ' num2str(frequency_FL_tsc_tsl) ', difference from ref [%]: ' num2str((frequency_FL_tsc_tsl-frequency_ODE)/frequency_ODE*100)]);
disp(['Frequency of Fdeg[h^-1]: ' num2str(frequency_FL_Fdeg) ', difference from ref [%]: ' num2str((frequency_FL_Fdeg-frequency_ODE)/frequency_ODE*100)]);
disp(['Frequency of mrna_deg[h^-1]: ' num2str(frequency_FL_mrna_deg) ', difference from ref [%]: ' num2str((frequency_FL_mrna_deg-frequency_ODE)/frequency_ODE*100)]);
disp(['Frequency of deg[h^-1]: ' num2str(frequency_FL_deg) ', difference from ref [%]: ' num2str((frequency_FL_deg-frequency_ODE)/frequency_ODE*100)]);
disp(['Frequency of full[h^-1]: ' num2str(frequency_FL_full) ', difference from ref [%]: ' num2str((frequency_FL_full-frequency_ODE)/frequency_ODE*100)]);
disp('--------------------')
disp(['Amplitude of ODE: ' num2str(amplitude_ODE) ', difference from ref [%]: ' num2str((amplitude_ODE-amplitude_ODE)/amplitude_ODE*100)]);
disp(['Amplitude of tsc: ' num2str(amplitude_FL_tsc) ', difference from ref [%]: ' num2str((amplitude_FL_tsc-amplitude_ODE)/amplitude_ODE*100)]);
disp(['Amplitude of tsl: ' num2str(amplitude_FL_tsl) ', difference from ref [%]: ' num2str((amplitude_FL_tsl-amplitude_ODE)/amplitude_ODE*100)]);
disp(['Amplitude of tsc_tsl: ' num2str(amplitude_FL_tsc_tsl) ', difference from ref [%]: ' num2str((amplitude_FL_tsc_tsl-amplitude_ODE)/amplitude_ODE*100)]);
disp(['Amplitude of Fdeg: ' num2str(amplitude_FL_Fdeg) ', difference from ref [%]: ' num2str((amplitude_FL_Fdeg-amplitude_ODE)/amplitude_ODE*100)]);
disp(['Amplitude of mrna_deg: ' num2str(amplitude_FL_mrna_deg) ', difference from ref [%]: ' num2str((amplitude_FL_mrna_deg-amplitude_ODE)/amplitude_ODE*100)]);
disp(['Amplitude of deg: ' num2str(amplitude_FL_deg) ', difference from ref [%]: ' num2str((amplitude_FL_deg-amplitude_ODE)/amplitude_ODE*100)]);
disp(['Amplitude of full: ' num2str(amplitude_FL_full) ', difference from ref [%]: ' num2str((amplitude_FL_full-amplitude_ODE)/amplitude_ODE*100)]);
disp('--------------------')
disp(['Power of ODE: ' num2str(power_ODE) ', difference from ref [%]: ' num2str((power_ODE-power_ODE)/power_ODE*100)]);
disp(['Power of tsc: ' num2str(power_FL_tsc) ', difference from ref [%]: ' num2str((power_FL_tsc-power_ODE)/power_ODE*100)]);
disp(['Power of tsl: ' num2str(power_FL_tsl) ', difference from ref [%]: ' num2str((power_FL_tsl-power_ODE)/power_ODE*100)]);
disp(['Power of tsc_tsl: ' num2str(power_FL_tsc_tsl) ', difference from ref [%]: ' num2str((power_FL_tsc_tsl-power_ODE)/power_ODE*100)]);
disp(['Power of Fdeg: ' num2str(power_FL_Fdeg) ', difference from ref [%]: ' num2str((power_FL_Fdeg-power_ODE)/power_ODE*100)]);
disp(['Power of mrna_deg: ' num2str(power_FL_mrna_deg) ', difference from ref [%]: ' num2str((power_FL_mrna_deg-power_ODE)/power_ODE*100)]);
disp(['Power of deg: ' num2str(power_FL_deg) ', difference from ref [%]: ' num2str((power_FL_deg-power_ODE)/power_ODE*100)]);
disp(['Power of full: ' num2str(power_FL_full) ', difference from ref [%]: ' num2str((power_FL_full-power_ODE)/power_ODE*100)]);
