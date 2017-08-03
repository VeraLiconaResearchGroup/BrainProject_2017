function saveNames(dirname)
prenom = 'simER_subject_';
suffix = '_SIM.mat';

for i = 1:9
    datafile = [prenom,'00',int2str(i),suffix];
    load(datafile,'names');
    names = vertcat((1:1:length(names)),names);
    csvwrite([prenom,'00',int2str(i),'_names.csv'],names);
end

for i = 10:99
    datafile = [prenom,'0',int2str(i),suffix];
    load(datafile,'names');
    names = vertcat((1:1:length(names)),names);
    csvwrite([prenom,'0',int2str(i),'_names.csv'],names);
end

datafile = [prenom,int2str(100),suffix];
load(datafile,'names');
names = vertcat((1:1:length(names)),names);
csvwrite([prenom,int2str(100),'_names.csv'],names);
end