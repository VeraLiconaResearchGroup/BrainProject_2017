function result = meanBin(file)

original = xlsread(file);
[h,l] = size(original);
result = zeros(h,l);
% means = zeros(387,1);
% for i = 1:h
%     tot = 0;
%     for j = 1:l
%         tot = tot + original(i,j);
%     end
%     means(i) = (tot)/j;
% end

for i = 1:h
    Mi = mean(original(i,:));
    for j = 1:l
        if original(i,j) >= Mi
            result(i,j) = 1;
        end
    end
end
%csvwrite('ex4_MATLABmean2.csv', result);