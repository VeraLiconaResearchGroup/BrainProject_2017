%% BinAll - Luke Wohlford, July 11, 2017 
% Takes a single file in a folder, binarizes it according to the built in
% methods, and then tests them with the TEDIE method.
% THIS FILE IS SPECIFICALLY SUITED TO DEAL WITH MULTIPLE FILES FROM THE
% SAME FOLDER AND DEALING WITH THE RESULTS

function RunMult_BinAll(file, maxXmax, Xtop)

base = pwd(); 

%% initial data work
if nargin < 3
    maxXmax = 3;
    Xtop = 52;
end

fid = fopen('C:\Users\wohlford\Documents\MATLAB\DiscretizationAlgorithms\methods.txt', 'r');
meth = textscan(fid,'%s','Delimiter','\n');
meth = meth{1};
fclose(fid);
nMeth = length(meth);

% for i = 1:numfids
%   [num] = xlsread(fnames(i).name);
%   for j = 1:nMeth
%     temp1 = strtok(fnames(i).name, '.');
%     S = char(meth(j));
%     temp2 = strcat(temp1, '_', S, '.csv');
%     csvwrite(temp2, num);
%   end
% end

% Creating different files named for the method
[num] = xlsread(file);
temp1 = strtok(file, '.');
mkdir(temp1);
cd(temp1)
for j = 1:nMeth
    temp1 = strtok(file, '.');
    S = char(meth(j));
    temp2 = strcat(temp1, '_', S, '.csv');
    csvwrite(temp2, num);
end
cd(base)

%% Plugging in to different functions

cd(temp1)
filenames = dir('*.csv');
numfids = length(filenames);

for i = 1:numfids
    if ~isempty(strfind(filenames(i).name, 'eqwidth'))
        eqwidth_res = equalwidth(filenames(i).name);
        xlswrite(filenames(i).name, eqwidth_res)
        clear eqwidth_res
    end
    if ~isempty(strfind(filenames(i).name, 'kmeans'))
        kmeans_res = kmeans2(filenames(i).name);
        xlswrite(filenames(i).name, kmeans_res)
        clear kmeans_res
    end
    if ~isempty(strfind(filenames(i).name, 'maxxmax'))
        maxxmax_res = maxxmax(filenames(i).name, maxXmax);
        xlswrite(filenames(i).name, maxxmax_res)
        clear maxxmax_res
    end
    if ~isempty(strfind(filenames(i).name, 'mean'))
        mean_res = meanBin(filenames(i).name);
        xlswrite(filenames(i).name, mean_res)
        clear mean_res
    end
    if ~isempty(strfind(filenames(i).name, 'median'))
        median_res = medianBin(filenames(i).name);
        xlswrite(filenames(i).name, median_res)
        clear median_res
    end
    if ~isempty(strfind(filenames(i).name, 'top'))
        topX_res = topX(filenames(i).name, Xtop);
        xlswrite(filenames(i).name, topX_res)
        clear topX_res
    end
end

%% Now with the discretizations available, let's run TEDIE
RunMult_TEDIE
cd(base)
delete(file)

