function result = equalfreq(file)
% Creates equal numbers of zeros and ones for each row
% Uncertain what happens if there (Ncol)mod2 != 0, right now puts the
% median value in the 1 bin

original = xlsread(file);
[h,l] = size(original);
result = zeros(h,l);

for i = 1:h
    thresh_idx = floor((length(original(i,:))/2) + 1);
    sorted = sort(original(i,:));
    thresh = sorted(thresh_idx); 
    for j = 1:l
        if original(i,j) >= thresh
            result(i,j) = 1;
        end
    end
end
%csvwrite('ex4_MATLABmedian.csv', result);