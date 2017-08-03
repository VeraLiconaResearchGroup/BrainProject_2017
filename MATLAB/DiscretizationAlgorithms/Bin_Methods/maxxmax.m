function result = maxxmax(file, X)
% Takes X as a whole number percentage [0,100], so will be converted to
% decimal

original = xlsread(file);
[h,l] = size(original);
result = zeros(h,l);
x = 1 - (X/100);
for i = 1:h
    thresh_a = max(original(i,:));
    thresh = thresh_a*x; 
    for j = 1:l
        if original(i,j) >= thresh
            result(i,j) = 1;
        end
    end
end
%csvwrite('ex4_MATLABmedian.csv', result);