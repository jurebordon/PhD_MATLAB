%c1 = 1.6;   % Transcription rate - unused
c2 = 0.12;  % mRNA degradation
c3 = 2.6;   % Translation rate
c4 = 0.06;  % Protein degradation

mRNA_init = 10; % mRNA initial concentration

% Init Fuzzy inference system

Transk = readfis('Strelkowa_Transk_jcb.fis');
