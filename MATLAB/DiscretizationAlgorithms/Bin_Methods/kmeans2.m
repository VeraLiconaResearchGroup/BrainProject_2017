function result = kmeans2(file)

original = xlsread(file);
[h,l] = size(original);
result = zeros(h,l);
thresh = zeros(1,h);

%First loop calculates the first value of the "activated" cluster in a
%sorted row
for i = 1:h
    tempsort = sort(original(i,:));
    WCSS = zeros(1, l-3);
    for j = 2:(l-2)
        group1 = tempsort(1:j);
        group2 = tempsort((j+1):l);
        M1 = mean(group1);
        M2 = mean(group2);
        calc1 = (group1 - M1).^2;
        calc2 = (group2 - M2).^2;
        WCSS(j-1) = sum(calc1) + sum(calc2);
    end
    [dummy, idx] = min(WCSS);
    thresh(i) = tempsort(idx+2);
end

%Now we can discretize
for i = 1:h
    for j = 1:l
        if original(i,j) >= thresh(i)
            result(i,j) = 1;
        else
            result(i,j) = 0;
        end
    end
end

%csvwrite('ex4_MATLABmedian.csv', result);