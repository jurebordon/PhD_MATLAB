function [ oscillatory, frequency, amplitude ] = measureOscFFT(sig, dt, threshold, plot_on)
% [ oscillatory, frequency, amplitude ] = measureOscFFT(sig, dt, threshold, plot_on)
%
% INPUTS:
% sig ... 1D signal 
% dt ... time step
% plot_on ... 0: no plotting, 1: plotting
%
% OUTPUTS:
% oscillatory ... 0: NO, 1: YES
% frequency ... leading frequency
% amplitude ... amplitude of the leading frequency
%




N1 = length(sig);

sig_end = sig(N1);

N0 = round(N1/4);
Fs = 1/dt;
L = N1-N0;

sig = sig(N0:length(sig));


NFFT = 2^nextpow2(L); % Next power of 2 from length of y
sig = sig - mean(sig);
y = fft(sig,NFFT)/L;
Y= 2*abs(y(1:NFFT/2+1));

l = Fs/2*linspace(0,1,NFFT/2+1);


[B,I] = sort(Y,'descend');

if (B(1) > threshold)
    oscillatory = 1;
     frequency = l(I(1));
    amplitude = max(sig) - min(sig);
else
    oscillatory = 0;
    frequency = 0;
    amplitude = 0;
end;

if (frequency <= 1/(NFFT * dt))
    oscillatory = 0;
    frequency = 0;
    amplitude = 0;
end;



if (plot_on)
    
    figure;
    clf;
    hold on;

    
    plot(l,Y) 
    plot(l(I(1:10)),B(1:10),'ro');

    for i=1:10
        fprintf('Frequency = %i Hz, Period = %i s, amplitude = %i nM\n', l(I(i)), 1/l(I(i)), B(i));
    end;



    hold off;
end;

if (sig_end >= (amplitude*0.95))
    oscillatory = 0;
    frequency = 0;
    amplitude = 0;
end;

    

end

