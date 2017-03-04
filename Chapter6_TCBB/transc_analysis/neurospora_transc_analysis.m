%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Transcription analysis for represilator with 3 genes
%
% ODE Model is based on equation:
%
% d[mRNA]/dt = 1/(1+([P]/[K_I])^n)
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

%% Function response - how repressor concentration (input) affects mRNA increase (output)
disp('===============================================================')


neurospora_transc_analysis_init
sim('neurospora_transc_analysis_response'); % mRNA_ODE - 3 ode results, mRNA_FL - 3 Fuzzy logic results

ISE_ODE_vs_ODE0_r = sum((mRNA_ODE(:,3)-mRNA_ODE(:,2)).^2);
ISE_ODE_vs_ODE1_r = sum((mRNA_ODE(:,3)-mRNA_ODE(:,3)).^2);
ISE_ODE_vs_ODE2_r = sum((mRNA_ODE(:,3)-mRNA_ODE(:,4)).^2);

ISE_ODE_vs_FL0_r = sum((mRNA_ODE(:,3)-mRNA_FL(:,2)).^2);
ISE_ODE_vs_FL1_r = sum((mRNA_ODE(:,3)-mRNA_FL(:,3)).^2);
ISE_ODE_vs_FL2_r = sum((mRNA_ODE(:,3)-mRNA_FL(:,4)).^2);

disp(['Integral error for (response) ODE vs ODE0: ', num2str(ISE_ODE_vs_ODE0_r)]);
disp(['Integral error for (response) ODE vs ODE1: ', num2str(ISE_ODE_vs_ODE1_r)]);
disp(['Integral error for (response) ODE vs ODE2: ', num2str(ISE_ODE_vs_ODE2_r)]);
disp(['Integral error for (response) ODE vs FL0: ', num2str(ISE_ODE_vs_FL0_r)]);
disp(['Integral error for (response) ODE vs FL1: ', num2str(ISE_ODE_vs_FL1_r)]);
disp(['Integral error for (response) ODE vs FL2: ', num2str(ISE_ODE_vs_FL2_r)]);
disp('-----------------------------------------------------------')

%% Pulse - how repressor concentration pulse (input) affects mRNA increase over time (output)

sim('neurospora_transc_analysis_pulse'); % mRNA_ODE - 3 ode results, mRNA_FL - 3 Fuzzy logic results

ISE_ODE_vs_ODE0_p = sum((mRNA_ODE_pulse(:,3)-mRNA_ODE_pulse(:,2)).^2);
ISE_ODE_vs_ODE1_p = sum((mRNA_ODE_pulse(:,3)-mRNA_ODE_pulse(:,3)).^2);
ISE_ODE_vs_ODE2_p = sum((mRNA_ODE_pulse(:,3)-mRNA_ODE_pulse(:,4)).^2);

ISE_ODE_vs_FL0_p = sum((mRNA_ODE_pulse(:,3)-mRNA_FL_pulse(:,2)).^2);
ISE_ODE_vs_FL1_p = sum((mRNA_ODE_pulse(:,3)-mRNA_FL_pulse(:,3)).^2);
ISE_ODE_vs_FL2_p = sum((mRNA_ODE_pulse(:,3)-mRNA_FL_pulse(:,4)).^2);

disp(['Integral error for (pulse) ODE vs ODE0: ', num2str(ISE_ODE_vs_ODE0_p)]);
disp(['Integral error for (pulse) ODE vs ODE1: ', num2str(ISE_ODE_vs_ODE1_p)]);
disp(['Integral error for (pulse) ODE vs ODE2: ', num2str(ISE_ODE_vs_ODE2_p)]);
disp(['Integral error for (pulse) ODE vs FL0: ', num2str(ISE_ODE_vs_FL0_p)]);
disp(['Integral error for (pulse) ODE vs FL1: ', num2str(ISE_ODE_vs_FL1_p)]);
disp(['Integral error for (pulse) ODE vs FL2: ', num2str(ISE_ODE_vs_FL2_p)]);
disp('-----------------------------------------------------------')

% ITSE_ODE_vs_ODE0_p = sum(mRNA_ODE_pulse(:,1).*((mRNA_ODE_pulse(:,3)-mRNA_ODE_pulse(:,2)).^2));
% ITSE_ODE_vs_ODE1_p = sum(mRNA_ODE_pulse(:,1).*((mRNA_ODE_pulse(:,3)-mRNA_ODE_pulse(:,3)).^2));
% ITSE_ODE_vs_ODE2_p = sum(mRNA_ODE_pulse(:,1).*((mRNA_ODE_pulse(:,3)-mRNA_ODE_pulse(:,4)).^2));
% 
% ITSE_ODE_vs_FL0_p = sum(mRNA_ODE_pulse(:,1).*((mRNA_ODE_pulse(:,3)-mRNA_FL_pulse(:,2)).^2));
% ITSE_ODE_vs_FL1_p = sum(mRNA_ODE_pulse(:,1).*((mRNA_ODE_pulse(:,3)-mRNA_FL_pulse(:,3)).^2));
% ITSE_ODE_vs_FL2_p = sum(mRNA_ODE_pulse(:,1).*((mRNA_ODE_pulse(:,3)-mRNA_FL_pulse(:,4)).^2));
% 
% disp(['Integral error for (response) ODE vs ODE0: ', num2str(ITSE_ODE_vs_ODE0_p)]);
% disp(['Integral error for (response) ODE vs ODE1: ', num2str(ITSE_ODE_vs_ODE1_p)]);
% disp(['Integral error for (response) ODE vs ODE2: ', num2str(ITSE_ODE_vs_ODE2_p)]);
% disp(['Integral error for (response) ODE vs FL0: ', num2str(ITSE_ODE_vs_FL0_p)]);
% disp(['Integral error for (response) ODE vs FL1: ', num2str(ITSE_ODE_vs_FL1_p)]);
% disp(['Integral error for (response) ODE vs FL2: ', num2str(ITSE_ODE_vs_FL2_p)]);
% disp('-----------------------------------------------------------')






