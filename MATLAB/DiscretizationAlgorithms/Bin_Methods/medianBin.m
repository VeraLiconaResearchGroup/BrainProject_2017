function result = medianBin(file)

original = xlsread(file);
[h,l] = size(original);
result = zeros(h,l);
for i = 1:h
    Mi = median(original(i,:));
    for j = 1:l
        if original(i,j) >= Mi
            result(i,j) = 1;
        end
    end
end
%csvwrite('ex4_MATLABmedian.csv', result);