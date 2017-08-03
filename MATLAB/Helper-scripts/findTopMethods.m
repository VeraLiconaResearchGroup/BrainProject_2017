function [topMethods] = returnTopMethods(filename,number) 
  load(filename);
  AUC = Meths.MSAUC;
  row = zeros(size(AUC):1);
  for i=1:size(AUC)
    row(i,1) = i;
  end
  AUC = horzcat(AUC, row);
  AUC = sortrows(AUC, 1);
  AUC = AUC(size(AUC)-number+1:size(AUC),1:2);
  AUC = sortrows(AUC,1,'descend');
  AUC(:,1) = [];
  
  topMethods = AUC;
end