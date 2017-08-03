function plotPPVACC(dirname,prenom,number)
% number = number of methods you would like included in the plot

filename6=['./',dirname,'/AUC/AUC_',prenom,int2str(6),'.mat'];
filename7=['./',dirname,'/AUC/AUC_',prenom,int2str(7),'.mat'];
filename8=['./',dirname,'/AUC/AUC_',prenom,int2str(8),'.mat'];
filename9=['./',dirname,'/AUC/AUC_',prenom,int2str(9),'.mat'];

[PPV6,names] = genTopPPV(filename6,number);
[ACC6,names] = genTopACC(filename6,number);
[PPV7,names] = genTopPPV(filename7,number);
[ACC7,names] = genTopACC(filename7,number);
[PPV8,names] = genTopPPV(filename8,number);
[ACC8,names] = genTopACC(filename8,number);
[PPV9,names] = genTopPPV(filename9,number);
[ACC9,names] = genTopACC(filename9,number);
Nsteps = 100;
ih=linspace(0,1,Nsteps);
figure

subplot(2,1,1)       
plot(ih,PPV6);          
title('.6 Threshold PPV')
legend(names, 'Fontsize', 7, 'location','eastoutside');
   
subplot(2,1,2)  
plot(ih,ACC6);
title('.6 Threshold ACC')
legend(names, 'Fontsize', 7, 'location','eastoutside');

figure
subplot(2,1,1)  
plot(ih,PPV7);
title('.7 Threshold PPV')
legend(names, 'Fontsize', 7, 'location','eastoutside');

subplot(2,1,2)
plot(ih,ACC7);
title('.7 Threshold ACC')
legend(names, 'Fontsize', 7, 'location','eastoutside');

figure

subplot(2,1,1)       
plot(ih,PPV8);          
title('.8 Threshold PPV')
legend(names, 'Fontsize', 7, 'location','eastoutside');

subplot(2,1,2)  
plot(ih,ACC8);
title('.8 Threshold ACC')
legend(names, 'Fontsize', 7, 'location','eastoutside');

figure
subplot(2,1,1)  
plot(ih,PPV9);
title('.9 Threshold PPV')
legend(names, 'Fontsize', 7, 'location','eastoutside');

subplot(2,1,2)
plot(ih,ACC9);
title('.9 Threshold ACC')
legend(names, 'Fontsize', 7, 'location','eastoutside');
% legend