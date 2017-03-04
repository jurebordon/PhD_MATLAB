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
% c3 = 2.6;   % Translation rate (P1_FL)
% c4 = 0.06;  % Protein degradation (P2_FL)
%
%


%dimen1 = round(log2(max_val1/min_val1))+1;
%dimen2 = round(log2(max_val2/min_val2))+1;
% 
% P1_FL = zeros(1, dimen1);
% P2_FL = zeros(1, dimen2);
% 
% P1_FL(1) = min_val1;
% P2_FL(1) = min_val2;
% 
% for i=2:dimen1
%     P1_FL(i) = P1_FL(i-1)*2;
% end;  
% for i=2:dimen2    
%     P2_FL(i) = P2_FL(i-1)*2;
% end;

prescale_0_min = 100;
prescale_0_max = 5000;
postscale_0_min = 5;
postscale_0_max = 20;

P1_FL = linspace(prescale_0_min, prescale_0_max, 30);
P2_FL = linspace(postscale_0_min, postscale_0_max, 30);

%P1_FL = [prescale_0/2 prescale_0 prescale_0*2 prescale_0*4];
%P2_FL = [postscale_0/2 postscale_0 postscale_0*2 postscale_0*4];

dimen1 = size(P1_FL,2);
dimen2 = size(P2_FL,2);

OSC_FL = zeros(dimen1,dimen2);
FREQ_FL = zeros(dimen1,dimen2);
AMP_FL = zeros(dimen1,dimen2);
POW_FL = zeros(dimen1,dimen2);
SPIK_FL = zeros(dimen1,dimen2);
DAMP_FL = zeros(dimen1,dimen2);

%% Reference values

mRNA_init = 10;
threshold = 30;

%c1 = 1.6;   % Transcription rate
c2 = 0.12;  % mRNA degradation
c3 = 2.6;   % Translation rate
c4 = 0.06;  % Protein degradation
prescale_0 = 400;
postscale_0 = 1.2;

Transk = readfis('Strelkowa_Transk.fis');
sim('strelkowa_rep3_FLTransk');

oscillatory = 0;
frequency = 0;
amplitude = 0;
damped = 0;
power = 0;
period = 0;

[ osc_ref, freq_ref, per_ref, amp_ref, spik_ref, damp_ref, pow_ref] = measureOscSpikiness(P_out_FL(:,2), P_out_FL(:,1), threshold);


%%
% SIMULATION
%%


warning('off', 'all');
for a = 1:dimen1
    for b = 1:dimen2
        
        mRNA_init = 10;
        c1 = 1.6;  % Transcription rate
        c2 = 0.12;  % mRNA degradation
        c3 = 2.6;
        c4 = 0.06;
        
        prescale_0 = P1_FL(a);
        postscale_0 = P2_FL(b);
        
        warning('off', 'all');
        simout = sim('strelkowa_rep3_FLTransk');
        warning('off', 'all');
        
        [ oscillatory, frequency, period, amplitude, spikiness, damped, power] = measureOscSpikiness(P_out_FL(:,2), P_out_FL(:,1), threshold);

        OSC_FL(a,b) = oscillatory;
        FREQ_FL(a,b) = frequency;
        AMP_FL(a,b) = amplitude;
        POW_FL(a,b) = power;
        SPIK_FL(a,b) = spikiness;
        DAMP_FL(a,b) = damped;
       
        disp(['iteration:' num2str(((a)-1)*dimen2+b) '/' num2str(dimen1*dimen2)]);
    end;
end;

%%
% DISPLAY
%%

% for a = 1:dimen1
%     for b = 1:dimen2
%         disp('Parameter values (prescale, postscale):');
%         disp(strcat(num2str(P1_FL(a)), ', ',num2str(P2_FL(b))));
%         
%         disp(['frequency' 9 'amplitude' 9 'spikiness' 9 'damped' 9 'power']);
%         disp([num2str(FREQ_FL(a,b)) 9 num2str(AMP_FL(a,b)) 9 num2str(SPIK_FL(a,b)) 9 9 num2str(DAMP_FL(a,b)) 9 9 num2str(POW_FL(a,b))]);
%         
%         disp(['frequency diff' 9 'amplitude diff' 9 'spikiness diff' 9 'damped diff' 9 'power diff']);
%         disp([num2str((FREQ_FL(a,b)-freq_ref)/freq_ref) 9 9 9 num2str((AMP_FL(a,b)-amp_ref)/amp_ref) 9 9 9  num2str((SPIK_FL(a,b)-spik_ref)/spik_ref) 9 9 9 num2str(DAMP_FL(a,b)) 9 9 9 num2str((POW_FL(a,b)-pow_ref)/pow_ref)]);
%       
%         disp('============================================');
%     end;
% end;

%%
% PLOTTING
%%

%P1_FL = log10(P1_FL);
%P2_FL = log10(P2_FL);
% 
parameter1 = 'Prescale';
parameter2 = 'Postscale';
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
surf(P1_FL,P2_FL,OSC_FL);
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
surf(P1_FL,P2_FL,FREQ_FL);
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
surf(P1_FL,P2_FL,AMP_FL);
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
surf(P1_FL,P2_FL,POW_FL);
view(2)
colorbar
hold off;