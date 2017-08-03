cd C:\Users\wohlford\Documents\MATLAB\DiscretizationAlgorithms\simTB_data_signrank

fnames = dir('*.csv');
numfids = length(fnames);
 
for i = 1:numfids
  name = strrep(fnames(i).name, '_', '-');
  x = xlsread(fnames(i).name);
  csvwrite(name, x);
  %csvwrite(fnames(i).name, x);
  delete(fnames(i).name);
end