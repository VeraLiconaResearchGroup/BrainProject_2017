function result = equalwidth(file)
% Creates bins of equal range for each row

original = xlsread(file);
[h,l] = size(original);
result = zeros(h,l);

for i = 1:h
    rowi = original(i,:);
    diff = (max(rowi)-min(rowi))/2;
    thresh = min(rowi) + diff;
    for j = 1:l
        if original(i,j) >= thresh
            result(i,j) = 1;
        end
    end
end
%csvwrite('ex4_MATLABmedian.csv', result);