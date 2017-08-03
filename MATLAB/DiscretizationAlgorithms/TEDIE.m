function out = TEDIE(method)
load('alldata.mat');
test_data = eval(method);
% data normalization
norm = zeros(size(test_data));
for t = 1:size(original, 1)
    norm(t, :) = ( original(t, :)-ones(size(original(t, :)))*min(min(original(t, :))) )/ (max(max(original(t, :))) - min(min(original(t, :))));
end
%clear test_data;
%test_data = nouveau; 
%clear nouveau;
%% qualification
for i = 1:size(test_data, 1)
    res = norm(i,:)-test_data(i,:); 
    rocile(i,1) = signtest(sort(res)); %changed from signtest(sort(res)) 7/24/17 for testing
    clear res;
end
val = quantile(rocile, 0.25); 
clear i rocile;
if val <0.01 %% Please select threshhold for WRST here
    zygote(1) = 0;
    disp(method);
    disp('stop here! choose another discretization method!');
    zygote(2) = benchmark(norm,test_data); %% added here 7/5/17 to see all results
    fprintf('\n')
else
    zygote(1) = 1;
    disp(method);
    disp('qualification passed! move to evaluation')
    %% evaluation 
    zygote(2) = benchmark(norm,test_data);
    disp('mean area between the curve: ')
    disp(zygote(2))
    fprintf('\n')
end
clear test_data;
out = zygote;