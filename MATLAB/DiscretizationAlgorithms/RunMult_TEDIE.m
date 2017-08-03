%% Main
% Luke & Katherine's effort (bound to fail) to standardize the main 
% from Yuezhe Li's TEDIE method

%% Step 1: building object from csv files
% Uses csv files without labels, right now just named orginal + methods
% oldFold = 'C:\Users\wohlford\Documents\MATLAB\DiscretizationAlgorithms\Mult_Test';
% cd(oldFold);
%cd Data;
fnames = dir('*.csv');
numfids = length(fnames);
vals = cell(1,numfids);
 
%methods = {'bikmeans', 'equalfrequency', 'equalwidth', 'gallo', 'kmeans','maxxmax_50','mean', 'median', 'topx_50', 'original'}
alldata = struct;
for K = 1:numfids
  vals{K} = load(fnames(K).name);
end
for K = 1:numfids
  name = strtok(fnames(K).name, '.'); % Works for file formats 'PTandCOND_method.csv'
  [dump,name] = strtok(name, '_'); 
  name = name(2:length(name)); % Simply turns it into 'method'
  data = vals{K};
  alldata.(name) = data;
end
save alldata.mat -struct alldata
%cd(oldFold);

%% Step 2: Calculate results using the data from Step 1
Results = RunMult_runall(alldata);
Results
num = 1;
pass = [];
for iMeth = 1:size(Results,1)
    if Results{iMeth, 1} == 1
        pass(num) = iMeth;
        num = num + 1;
    end
end

if ~isempty(pass)
    posRes = Results(pass,:)
    save posRes.mat posRes
end

save allRes.mat Results
%plot
%clear pass; 