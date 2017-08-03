dirname = 'simTBAdj';
prenom = 'simER_subject_';
filename = ['./',dirname,'/data/',prenom,'003_SIM.mat'];
binarizeCorrMatrix(dirname, filename);
% for i = 1:9
% filename=['./',dirname,'/data/',prenom,'_00',int2str(i),'_SIM','.mat'];
% binarizeCorrMatrix(dirname,filename)
% end
% for i = 10:99
% filename=['./',dirname,'/data/',prenom,'_0',int2str(i),'_SIM','.mat'];
% binarizeCorrMatrix(dirname,filename)
% end
% filename=['./',dirname,'/data/',prenom,'_100','_SIM','.mat'];
% binarizeCorrMatrix(dirname,filename)


function binarizeCorrMatrix(dirname,filename)
load(filename,'Connectivity');
%threshold may be changed. All values greater than equal to threshold are 1.
threshold = 0;
Connectivity=abs(Connectivity(:,:))>= threshold;
save(filename,'Connectivity','-append');
end