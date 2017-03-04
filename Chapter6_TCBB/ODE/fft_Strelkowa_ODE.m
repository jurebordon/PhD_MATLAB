% Run the simulation

sim_run_Strelkowa_ODE; 

% Perform FFT analysis

[ oscillatory, frequency, amplitude ] = measureOscFFT(P_out_ODE(:,3), 0.1, 50, 0);

display('Oscillatory (0 - No, 1 - Yes):');
display(num2str(oscillatory));
display('Frequency:');
display(num2str(frequency));
display('Amplitude:');
display(num2str(amplitude));