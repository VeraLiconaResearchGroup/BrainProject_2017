cd C:\Users\wohlford\Documents\MATLAB\DiscretizationAlgorithms\Testing;
fnames = dir('*.csv');
numfids = length(fnames);

% second input is max - Xmax X value, and third input is topX X value
% formated in % (i.e. 47%)
for i = 1:numfids
    RunMult_BinAll(fnames(i).name, 5, 47);
end