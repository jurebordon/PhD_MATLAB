a = readfis('Strelkowa_Transk_jcb.fis');

figure(1)
plotmf(a,'input',1);
figure(2)
plotmf(a,'output',1);