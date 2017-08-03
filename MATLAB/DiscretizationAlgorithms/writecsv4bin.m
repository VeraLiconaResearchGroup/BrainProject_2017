cd C:\Users\wohlford\Documents\MATLAB\DiscretizationAlgorithms\simTB_data;
fnames = dir('*.csv');
numfids = length(fnames);

fid = fopen('C:\Users\wohlford\Documents\MATLAB\DiscretizationAlgorithms\diffnumbers.txt', 'r');
meth = textscan(fid,'%s','Delimiter','\n');
meth = meth{1};
fclose(fid);
nMeth = length(meth);

for i = 1:numfids
  [num] = xlsread(fnames(i).name);
  for j = 1:nMeth
    temp1 = strtok(fnames(i).name, '.');
    S = char(meth(j));
    temp2 = strcat(temp1, '_', S, '.csv');
    csvwrite(temp2, num);
  end
end

