% Repression
v_s = 1.6;      % Transcription rate [nMh^-1]
n = 4;          % Hill coefficient [ ]
K_I = 1;        % Repression coefficient [nM]

% mRNA degradation
v_m = 0.505;    % mRNA F_C Degradation rate [nMh^-1]
K_m = 0.5;      % mRNA F_C michaelis constant for enzymatic degradation [nM]

% Translation
k_s = 0.5;      % Translation rate for F_C [h^-1]

% F_C degradation
v_d = 1.4;      % F_C Degradation rate [nMh^-1]
K_d = 0.13;     % F_C michaelis constant for enzymatic degradation [nM]

% Cytosolic -> Nuclear
k_1 = 0.5;      % Cytosolic to Nuclear rate [h^-1]

% Nuclear -> Cytosolic
k_2 = 0.6;      % Nuclear to Cytosolic rate [h^-1]

% Day and night light - 1; uniform light - 0
daynight_on = 0;
