function T = RunMult_runall(alldata)
%alldata = load('alldata.mat');
Methods = fieldnames(alldata);
Methods(strcmp(Methods(:,1), 'original'),:) = []; % removing original from methods 
Ngroup=length(Methods);
results = ones(Ngroup, 2);
for imeth=1:Ngroup
    method=Methods{imeth};
    results(imeth,:) = TEDIE(method);
end
Test_Result = results(:,1);
Mean_ABCs = results(:,2);
T = table(Test_Result, Mean_ABCs, 'RowNames', Methods)