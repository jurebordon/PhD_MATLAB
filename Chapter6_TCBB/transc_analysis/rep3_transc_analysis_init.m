c1 = 1.6;   % Transcription rate
c2 = 0.12;  % mRNA degradation
c3 = 2.6;   % Translation rate
c4 = 0.06;  % Protein degradation

Transk0 = readfis('transc_analysis_Transk_simple0.fis');
Transk1 = readfis('transc_analysis_Transk_simple1.fis');
Transk2 = readfis('transc_analysis_Transk_simple2.fis');

%Transk = Transk1;

mRNA_init = 0.5;

n0 = 0.5;
n1 = 2;
n2 = 4;

K_D = 1;