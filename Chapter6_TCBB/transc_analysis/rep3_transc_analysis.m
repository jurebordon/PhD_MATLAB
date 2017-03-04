%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Transcription analysis for represilator with 3 genes
%
% ODE Model is based on equation:
%
% d[mRNA]/dt = 1/(1+[P]^n)
%
% Fuzzy logic is defined in transc_analysis_Transk_simple0.fis
%
% We calculate integral errors (ISE and ITSE) for ODE with n=0.5,2,4 and for three
% different definitions of fuzzy transcription using FIS:
%   transc_analysis_Transk_simple0.fis
%   transc_analysis_Transk_simple0.fis
%   transc_analysis_Transk_simple0.fis
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

plot_enabled = 0;


%% Function response - how repressor concentration (input) affects mRNA increase (output)
disp('===============================================================')


rep3_transc_analysis_init
sim('rep3_transc_analysis_response'); % mRNA_ODE - 3 ode results, mRNA_FL - 3 Fuzzy logic results
if (plot_enabled)
    figure(2)
    plot(mRNA_ODE(:,1),mRNA_ODE(:,2));
    hold on
    plot(mRNA_ODE(:,1),mRNA_ODE(:,3));
    plot(mRNA_ODE(:,1),mRNA_ODE(:,4));
    plot(mRNA_ODE(:,1),mRNA_FL(:,2));
    plot(mRNA_ODE(:,1),mRNA_FL(:,3));
    plot(mRNA_ODE(:,1),mRNA_FL(:,4));
    hold off
    xlabel('Koncentracija represorja [nM]','interpreter','latex','FontSize',32);
    ylabel('Sprememba koncentracije mRNA [nM]','interpreter','latex','FontSize',32);
    legend('ODE_{n=0.5}', 'ODE_{n=2}', 'ODE_{n=4}','FL_{mocnejsi}', 'FL_{osnovni}', 'FL_{sibkejsi}');
end;

ISE_ODE_vs_ODE0_r = sum((mRNA_ODE(:,3)-mRNA_ODE(:,2)).^2);
ISE_ODE_vs_ODE1_r = sum((mRNA_ODE(:,3)-mRNA_ODE(:,3)).^2);
ISE_ODE_vs_ODE2_r = sum((mRNA_ODE(:,3)-mRNA_ODE(:,4)).^2);

ISE_ODE_vs_FL0_r = sum((mRNA_ODE(:,3)-mRNA_FL(:,2)).^2);
ISE_ODE_vs_FL1_r = sum((mRNA_ODE(:,3)-mRNA_FL(:,3)).^2);
ISE_ODE_vs_FL2_r = sum((mRNA_ODE(:,3)-mRNA_FL(:,4)).^2);

max_integral_r = max([ISE_ODE_vs_ODE0_r,ISE_ODE_vs_ODE1_r,ISE_ODE_vs_ODE2_r,ISE_ODE_vs_FL0_r,ISE_ODE_vs_FL1_r,ISE_ODE_vs_FL2_r]);


disp(['Integral error for (response) ODE vs ODE0: ', num2str(ISE_ODE_vs_ODE0_r/max_integral_r)]);
disp(['Integral error for (response) ODE vs ODE1: ', num2str(ISE_ODE_vs_ODE1_r/max_integral_r)]);
disp(['Integral error for (response) ODE vs ODE2: ', num2str(ISE_ODE_vs_ODE2_r/max_integral_r)]);
disp(['Integral error for (response) ODE vs FL0: ', num2str(ISE_ODE_vs_FL0_r/max_integral_r)]);
disp(['Integral error for (response) ODE vs FL1: ', num2str(ISE_ODE_vs_FL1_r/max_integral_r)]);
disp(['Integral error for (response) ODE vs FL2: ', num2str(ISE_ODE_vs_FL2_r/max_integral_r)]);
disp('-----------------------------------------------------------')

%% Pulse - how repressor concentration pulse (input) affects mRNA increase over time (output)

sim('rep3_transc_analysis_pulse'); % mRNA_ODE - 3 ode results, mRNA_FL - 3 Fuzzy logic results

if (plot_enabled)
    figure(3)

    [hAx,hLine1,hLine2] = plotyy([mRNAc_ODE_pulse(:,1),mRNAc_ODE_pulse(:,1),mRNAc_ODE_pulse(:,1),mRNAc_ODE_pulse(:,1),mRNAc_ODE_pulse(:,1),mRNAc_ODE_pulse(:,1)],[mRNAc_ODE_pulse(:,2),mRNAc_ODE_pulse(:,3),mRNAc_ODE_pulse(:,4),mRNAc_FL_pulse(:,2),mRNAc_FL_pulse(:,3),mRNAc_FL_pulse(:,4)],mRNAChange4(:,1),mRNAChange4(:,2));

    xlabel('\v{C}as [min]','interpreter','latex','FontSize',32);
    ylabel(hAx(1),'Sprememba koncentracije mRNA [nM]','interpreter','latex','FontSize',32) % left y-axis
    ylabel(hAx(2),'Koncentracija represorja [nM]','interpreter','latex','FontSize',32) % right y-axis
    legend('ODE_{n=0.5}', 'ODE_{n=2}', 'ODE_{n=4}','FL_{mocnejsi}', 'FL_{osnovni}', 'FL_{sibkejsi}','[P]');
end;


ISE_ODE_vs_ODE0_p = sum((mRNA_ODE_pulse(:,3)-mRNA_ODE_pulse(:,2)).^2);
ISE_ODE_vs_ODE1_p = sum((mRNA_ODE_pulse(:,3)-mRNA_ODE_pulse(:,3)).^2);
ISE_ODE_vs_ODE2_p = sum((mRNA_ODE_pulse(:,3)-mRNA_ODE_pulse(:,4)).^2);

ISE_ODE_vs_FL0_p = sum((mRNA_ODE_pulse(:,3)-mRNA_FL_pulse(:,2)).^2);
ISE_ODE_vs_FL1_p = sum((mRNA_ODE_pulse(:,3)-mRNA_FL_pulse(:,3)).^2);
ISE_ODE_vs_FL2_p = sum((mRNA_ODE_pulse(:,3)-mRNA_FL_pulse(:,4)).^2);

max_integral_p = max([ISE_ODE_vs_ODE0_p,ISE_ODE_vs_ODE1_p,ISE_ODE_vs_ODE2_p,ISE_ODE_vs_FL0_p,ISE_ODE_vs_FL1_p,ISE_ODE_vs_FL2_p]);


disp(['Integral error for (pulse) ODE vs ODE0: ', num2str(ISE_ODE_vs_ODE0_p/max_integral_p)]);
disp(['Integral error for (pulse) ODE vs ODE1: ', num2str(ISE_ODE_vs_ODE1_p/max_integral_p)]);
disp(['Integral error for (pulse) ODE vs ODE2: ', num2str(ISE_ODE_vs_ODE2_p/max_integral_p)]);
disp(['Integral error for (pulse) ODE vs FL0: ', num2str(ISE_ODE_vs_FL0_p/max_integral_p)]);
disp(['Integral error for (pulse) ODE vs FL1: ', num2str(ISE_ODE_vs_FL1_p/max_integral_p)]);
disp(['Integral error for (pulse) ODE vs FL2: ', num2str(ISE_ODE_vs_FL2_p/max_integral_p)]);
disp('-----------------------------------------------------------')

%% Simulation - how simulation results differ based on settings

sim('rep3_transc_analysis_fullmodel'); % P_out_*

if (plot_enabled)
    figure(4)
    plot(P_out_ODE0(:,1),P_out_ODE0(:,2));
    hold on
    plot(P_out_ODE1(:,1),P_out_ODE1(:,2));
    plot(P_out_ODE2(:,1),P_out_ODE2(:,2));
    plot(P_out_FL0(:,1),P_out_FL0(:,2));
    plot(P_out_FL1(:,1),P_out_FL1(:,2));
    plot(P_out_FL2(:,1),P_out_FL2(:,2));
    hold off
    ylabel('Koncentracija proteinov [nM]','interpreter','latex','FontSize',32);
    xlabel('\v{C}as [min]','interpreter','latex','FontSize',32);
    legend('ODE_{n=0.5}', 'ODE_{n=2}', 'ODE_{n=4}','FL_{mocnejsi}', 'FL_{osnovni}', 'FL_{sibkejsi}');
end;

ISE_ODE_vs_ODE0_s = sum((P_out_ODE1(:,2)-P_out_ODE0(:,2)).^2);
ISE_ODE_vs_ODE1_s = sum((P_out_ODE1(:,2)-P_out_ODE1(:,2)).^2);
ISE_ODE_vs_ODE2_s = sum((P_out_ODE1(:,2)-P_out_ODE2(:,2)).^2);

ISE_ODE_vs_FL0_s = sum((P_out_ODE1(:,2)-P_out_FL0(:,2)).^2);
ISE_ODE_vs_FL1_s = sum((P_out_ODE1(:,2)-P_out_FL1(:,2)).^2);
ISE_ODE_vs_FL2_s = sum((P_out_ODE1(:,2)-P_out_FL2(:,2)).^2);

max_integral_s = max([ISE_ODE_vs_ODE0_s,ISE_ODE_vs_ODE1_s,ISE_ODE_vs_ODE2_s,ISE_ODE_vs_FL0_s,ISE_ODE_vs_FL1_s,ISE_ODE_vs_FL2_s]);

disp(['Integral error for (simulation) ODE vs ODE0: ', num2str(ISE_ODE_vs_ODE0_s/max_integral_s)]);
disp(['Integral error for (simulation) ODE vs ODE1: ', num2str(ISE_ODE_vs_ODE1_s/max_integral_s)]);
disp(['Integral error for (simulation) ODE vs ODE2: ', num2str(ISE_ODE_vs_ODE2_s/max_integral_s)]);
disp(['Integral error for (simulation) ODE vs FL0: ', num2str(ISE_ODE_vs_FL0_s/max_integral_s)]);
disp(['Integral error for (simulation) ODE vs FL1: ', num2str(ISE_ODE_vs_FL1_s/max_integral_s)]);
disp(['Integral error for (simulation) ODE vs FL2: ', num2str(ISE_ODE_vs_FL2_s/max_integral_s)]);
disp('-----------------------------------------------------------')

[ oscillatory_ODE0, frequency_ODE0, period_ODE0, amplitude_ODE0, spikiness_ODE0, damped_ODE0, power_ODE0] = measureOscSpikiness (P_out_ODE0(:,2), P_out_ODE0(:,1), 80);
[ oscillatory_ODE1, frequency_ODE1, period_ODE1, amplitude_ODE1, spikiness_ODE1, damped_ODE1, power_ODE1] = measureOscSpikiness (P_out_ODE1(:,2), P_out_ODE1(:,1), 80);
[ oscillatory_ODE2, frequency_ODE2, period_ODE2, amplitude_ODE2, spikiness_ODE2, damped_ODE2, power_ODE2] = measureOscSpikiness (P_out_ODE2(:,2), P_out_ODE2(:,1), 80);
[ oscillatory_FL0, frequency_FL0, period_FL0, amplitude_FL0, spikiness_FL0, damped_FL0, power_FL0] = measureOscSpikiness (P_out_FL0(:,2), P_out_FL0(:,1), 80);
[ oscillatory_FL1, frequency_FL1, period_FL1, amplitude_FL1, spikiness_FL1, damped_FL1, power_FL1] = measureOscSpikiness (P_out_FL1(:,2), P_out_FL1(:,1), 80);
[ oscillatory_FL2, frequency_FL2, period_FL2, amplitude_FL2, spikiness_FL2, damped_FL2, power_FL2] = measureOscSpikiness (P_out_FL2(:,2), P_out_FL2(:,1), 80);

disp('--------------------')
disp(['Frequency of ODE1[s^-1]: ' num2str(60*frequency_ODE1) ', difference from ref [%]: ' num2str((frequency_ODE1-frequency_ODE1)/frequency_ODE1)]);
disp(['Frequency of ODE2[s^-1]: ' num2str(60*frequency_ODE2) ', difference from ref [%]: ' num2str((frequency_ODE2-frequency_ODE1)/frequency_ODE1)]);
disp(['Frequency of FL0[s^-1]: ' num2str(60*frequency_FL0) ', difference from ref [%]: ' num2str((frequency_FL0-frequency_ODE1)/frequency_ODE1)]);
disp(['Frequency of FL1[s^-1]: ' num2str(60*frequency_FL1) ', difference from ref [%]: ' num2str((frequency_FL1-frequency_ODE1)/frequency_ODE1)]);
disp(['Frequency of FL2[s^-1]: ' num2str(60*frequency_FL2) ', difference from ref [%]: ' num2str((frequency_FL2-frequency_ODE1)/frequency_ODE1)]);
disp('--------------------')
disp(['Amplitude of ODE1: ' num2str(amplitude_ODE1) ', difference from ref [%]: ' num2str((amplitude_ODE1-amplitude_ODE1)/amplitude_ODE1)]);
disp(['Amplitude of ODE2: ' num2str(amplitude_ODE2) ', difference from ref [%]: ' num2str((amplitude_ODE2-amplitude_ODE1)/amplitude_ODE1)]);
disp(['Amplitude of FL0: ' num2str(amplitude_FL0) ', difference from ref [%]: ' num2str((amplitude_FL0-amplitude_ODE1)/amplitude_ODE1)]);
disp(['Amplitude of FL1: ' num2str(amplitude_FL1) ', difference from ref [%]: ' num2str((amplitude_FL1-amplitude_ODE1)/amplitude_ODE1)]);
disp(['Amplitude of FL2: ' num2str(amplitude_FL2) ', difference from ref [%]: ' num2str((amplitude_FL2-amplitude_ODE1)/amplitude_ODE1)]);
disp('--------------------')
disp(['Power of ODE1: ' num2str(power_ODE1) ', difference from ref [%]: ' num2str((power_ODE1-power_ODE1)/power_ODE1)]);
disp(['Power of ODE2: ' num2str(power_ODE2) ', difference from ref [%]: ' num2str((power_ODE2-power_ODE1)/power_ODE1)]);
disp(['Power of FL0: ' num2str(power_FL0) ', difference from ref [%]: ' num2str((power_FL0-power_ODE1)/power_ODE1)]);
disp(['Power of FL1: ' num2str(power_FL1) ', difference from ref [%]: ' num2str((power_FL1-power_ODE1)/power_ODE1)]);
disp(['Power of FL2: ' num2str(power_FL2) ', difference from ref [%]: ' num2str((power_FL2-power_ODE1)/power_ODE1)]);
