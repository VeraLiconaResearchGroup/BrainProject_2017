function result = gallo(file)
% NOTE: This was an attempt to copy the "Gallo et al" binarization method
% directly from their source code in Java... which I don't know...

original = xlsread(file);
[h,len] = size(original);
result = zeros(h,len);
thresh = zeros(1,h);

for i = 1:h
    tempsort = sort(original(i,:));
    m1 = tempsort(1);
    m2 = mean(tempsort);
    pos = 0;
    prom1 = m1;
    prom2 = m2;
    var1 = 0;
    var2 = 0;
    for j =2:len
        var2 = var2 + (tempsort(j)-prom2)^2;
    end
    obj = var1 + (var2/(len-1));
    pos = 2;
    for j = 2:(len-1)
        m2 = m2 - tempsort(j);
        m1 = m1 + tempsort(j); 
        prom1 = m1/(j);
        prom2 = m2/(len-j);
        var1 = 0;
        var2 = 0;
        for vi = 1:len
            if vi <= j
                var1 = var1 + (tempsort(j) - prom1)^2;
            else
                var2 = var2 + (tempsort(j) - prom2)^2;
            end
        end
        var1 = var1/j;
        var2 = var2/(len-j);
        if (var1+var2 < obj)
            obj = var1 + var2;
            pos = j;
        end
    end
    thresh = (tempsort(pos-1) + tempsort(pos))/2
    
    if original(i,j) > thresh
            result(i,j) = 1;
    end
end


%csvwrite('ex4_MATLABmedian.csv', result);