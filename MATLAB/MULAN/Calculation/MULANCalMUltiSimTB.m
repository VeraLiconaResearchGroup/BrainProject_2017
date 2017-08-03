function MULANCalMUltiSimTB(dirname,prenom,paramfile)
% Huifang Wang, Marseille, August 26, 2013, Calculate all datasets with
% Katherine created on July 11th to 
% basic prenom = simER_subject_(xxx)
% paramfile = name of parameter file (ex. Params.mat)
suffix = '_SIM';

% for i = 1:9
%     dataprenom = [prenom,'00',int2str(i),suffix];
%     MulanCal_simTB(dirname,dataprenom,paramfile);
% end
% 
% for i = 10:99
%    dataprenom = [prenom,'0',int2str(i),suffix];
%    MulanCal_simTB(dirname,dataprenom,paramfile);
% end
dataprenom = ['simER_subject_003_SIM']
MulanCal_simTB(dirname,dataprenom,paramfile);



