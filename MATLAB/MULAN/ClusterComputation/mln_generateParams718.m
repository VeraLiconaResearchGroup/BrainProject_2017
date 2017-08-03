function mln_generateParams718()


calParams.defwindow='718';
calParams.defoverlap='0';

calParams.defmodelorders='5';
calParams.minfreq='1';
calParams.maxfreq='30';
calParams.stepfreq='0.5';
calParams.defbins='16';
calParams.defMaxDelay='5';

calParams.genieMethod = '0';
calParams.genieNbTrees = '500';
calParams.genieK = '0';

calParams.tigressR = '500';
calParams.tigressAlpha = '0.3';
calParams.tigressL = '3';
calParams.tigressLarsAlgo = '0';
calParams.tigressScoreMethod = '0';

save('Params718.mat','calParams');