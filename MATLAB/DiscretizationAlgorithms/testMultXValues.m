cd C:\Users\wohlford\Documents\MATLAB\DiscretizationAlgorithms\simTB_data;

fnames = dir('*.csv');
numfids = length(fnames);

vals = 1:99;

for i = 1:numfids
    csvwrite(fnames(i).name, maxxmax(fnames(i).name, vals(i)));
end