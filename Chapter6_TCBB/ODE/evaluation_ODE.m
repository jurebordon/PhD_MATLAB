%%%%
% Analiza parametrov Fuzzy+ODE pristopa
%
%%%%

%% Kako spreminjanje parametrov (k_tsk, n) vpliva na frekvenco/amplitudo/moc sistema ce uporabimo:
%
%
% a) ODE model
% b) ODE model + fuzzy transkripcijo
% 
% Initial values:
% c1 = 1.6;   % Transcription rate
% c2 = 0.12;  % mRNA degradation
% c3 = 2.6;   % Translation rate (P1)
% c4 = 0.06;  % Protein degradation (P2)
%
%

ktsk_0 = 1.6;
n_0 = 2;
ktsk_0_min = 0;
ktsk_0_max = 6;
n_0_min = 2;
n_0_max = 5;

P1 = linspace(ktsk_0_min, ktsk_0_max, 30);
P2 = linspace(n_0_min, n_0_max, 30);

dimen1 = size(P1,2);
dimen2 = size(P2,2);

OSC = zeros(dimen1,dimen2);
FREQ = zeros(dimen1,dimen2);
AMP = zeros(dimen1,dimen2);
POW = zeros(dimen1,dimen2);
SPIK = zeros(dimen1,dimen2);
DAMP = zeros(dimen1,dimen2);

%% Reference values

mRNA_init = 10;
threshold = 30;

c1 = ktsk_0;  % Transcription rate
c2 = 0.12;  % mRNA degradation
c3 = 2.6;
c4 = 0.06;
n = n_0;

sim('strelkowa_rep3_ODE');

oscillatory = 0;
frequency = 0;
amplitude = 0;
damped = 0;
power = 0;
period = 0;

[ osc_ref, freq_ref, per_ref, amp_ref, spik_ref, damp_ref, pow_ref] = measureOscSpikiness(P_out_ODE(:,2), P_out_ODE(:,1), threshold);


%%
% SIMULATION
%%

warning('off', 'all');

for a = 1:dimen1
    for b = 1:dimen2
        
        mRNA_init = 10;
        threshold = 30;
        
        c1 = P1(a);  % Transcription rate
        c2 = 0.12;  % mRNA degradation
        c3 = 2.6;
        c4 = 0.06;
        n = P2(b);

        sim('strelkowa_rep3_ODE');
        
        oscillatory = 0;
        frequency = 0;
        amplitude = 0;
        damped = 0;
        power = 0;
        period = 0;

        [ oscillatory, frequency, period, amplitude, spikiness, damped, power] = measureOscSpikiness(P_out_ODE(:,2), P_out_ODE(:,1), threshold);

        OSC(a,b) = oscillatory;
        FREQ(a,b) = frequency;
        AMP(a,b) = amplitude;
        POW(a,b) = power;
        SPIK(a,b) = spikiness;
        DAMP(a,b) = damped;
        
        disp(['iteration:' num2str(((a)-1)*dimen2+b) '/' num2str(dimen1*dimen2)]);

%%
% DISPLAY
%%
        
%         disp('Parameter values (k_tsk, n):');
%         disp(strcat(num2str(P1(a)), ', ',num2str(P2(b))));
%         
%         disp(['frequency' 9 'amplitude' 9 'spikiness' 9 'damped' 9 'power']);
%         disp([num2str(FREQ(a,b)) 9 num2str(AMP(a,b)) 9 num2str(SPIK(a,b)) 9 9 num2str(DAMP(a,b)) 9 9 num2str(POW(a,b))]);
%         
%         disp(['frequency diff' 9 'amplitude diff' 9 'spikiness diff' 9 'damped diff' 9 'power diff']);
%         disp([num2str((FREQ(a,b)-freq_ref)/freq_ref) 9 9 9 num2str((AMP(a,b)-amp_ref)/amp_ref) 9 9 9  num2str((SPIK(a,b)-spik_ref)/spik_ref) 9 9 9 num2str(DAMP(a,b)) 9 9 9 num2str((POW(a,b)-pow_ref)/pow_ref)]);
%         
        %disp('Iterations to go:');
        %disp(strcat(int2str(a*b+a),', ',int2str(dimen1+dimen2)));
        
%         disp('============================================');
    end;
end;

%%
% PLOTTING
%%

%P1 = log10(P1);
%P2 = log10(P2);
% 
parameter1 = 'k_{tsk}';
parameter2 = 'n';
% 
figure(1)
clf;
hold on;
title('Oscillatory (YES or NO)');
xlabel(parameter1);
ylabel(parameter2);
% xlabel(strcat('log10(',parameter1,')'));
% ylabel(strcat('log10(',parameter2,')'));
% 
surf(P1,P2,OSC);
view(2)
colorbar
hold off;
% 
figure(2)
clf;
hold on;
title('Frequency');
xlabel(parameter1);
ylabel(parameter2);
% xlabel(strcat('log10(',parameter1,')'));
% ylabel(strcat('log10(',parameter2,')'));
% 
surf(P1,P2,FREQ);
view(2)
colorbar
hold off;
% 
figure(3)
clf;
hold on;
title('Amplitude');
xlabel(parameter1);
ylabel(parameter2);
% xlabel(strcat('log10(',parameter1,')'));
% ylabel(strcat('log10(',parameter2,')'));
% 
surf(P1,P2,AMP);
view(2)
colorbar
hold off;

figure(4)
clf;
hold on;
title('Power');
xlabel(parameter1);
ylabel(parameter2);
% xlabel(strcat('log10(',parameter1,')'));
% ylabel(strcat('log10(',parameter2,')'));
% 
surf(P1,P2,POW);
view(2)
colorbar
hold off;