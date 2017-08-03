function saveNetAsCSV
   prefix1 = 'AUC_simER_subject_';
   suffix1 = '_SIM_extended.mat';
   
   prefix2 = 'top2mean';
   suffix2 = '.csv';
   for i = 1:9
    filename = [prefix1,'00',int2str(i),suffix1];
    load(filename);
    top2net = Meths.Mat(:,:,62);
    top2netBin = top2net >= .8;
    top2netBin = vertcat(1:1:size(top2netBin,1),top2netBin);
    name = [prefix2,'00',int2str(i),suffix2];
    csvwrite(name, top2netBin);
   end
   for i = 10:99
    filename = [prefix1,'0',int2str(i),suffix1];
    load(filename);
    top2net = Meths.Mat(:,:,62);
    top2netBin = top2net >= .8;
    top2netBin = vertcat(1:1:size(top2netBin,1),top2netBin);
    name = [prefix2,'0',int2str(i),suffix2];
    csvwrite(name, top2netBin);
   end
   filename = [prefix1,int2str(100),suffix1];
   load(filename);
   top2net = Meths.Mat(:,:,62);
   top2netBin = top2net >= .8;
   top2netBin = vertcat(1:1:size(top2netBin,1),top2netBin);
   name = [prefix2,int2str(i),suffix2];
   csvwrite(name, top2netBin);
    
end