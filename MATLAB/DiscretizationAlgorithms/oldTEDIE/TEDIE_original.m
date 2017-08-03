function TEDIE(method)
load('alldata.mat');
test_data = eval(method);
% data normalization
nouveau = ( test_data-ones(size(test_data))*min(min(test_data)) )/ (max(max(test_data)) - min(min(test_data)));
%clear test_data;
test_data = nouveau; 
%clear nouveau;
%% qualification
for i = 1:size(original,1)
    res = original(i,:)-test_data(i,:); 
    rocile(i,1) = signtest(sort(res));
    clear res;
end
zygote(1) = quantile(rocile, 0.25);
clear i rocile;
if zygote <0.000001 %% Please select threshhold for WRST here
    disp('stop here! choose another discretization method!');
else 
    disp('qualification passed! move to evaluation')
    %% evaluation
    for i = 1:8
        startt = (i-1)*13+1;
        endd = i*13;
        roche(i,1) = benchmark(original(startt:endd,:)', test_data(startt:endd,:)' );    
        clear startt endd;
    end
    zygote(2) = sum(roche)/8;
    clear i roche;
    disp('mean area between the curve: ')
    disp(zygote(2))
end
clear test_data;