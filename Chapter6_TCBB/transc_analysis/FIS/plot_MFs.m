Transk0 = readfis('transc_analysis_Transk_simple0.fis');
Transk1 = readfis('transc_analysis_Transk_simple1.fis');
Transk2 = readfis('transc_analysis_Transk_simple2.fis');

figure(1)
plotmf(Transk0,'input',1);
figure(2)
plotmf(Transk1,'input',1);
figure(3)
plotmf(Transk2,'input',1);

% figure(2)
% plotmf(Transk1,'output',1);