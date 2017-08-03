function returnTopMethodsMatrix(dirname,prenom,number)
%prenom = simER_subject_(XXX)
  filename=['./',dirname,'/AUC/AUC_',prenom,'00',int2str(1),'_SIM.mat'];  
  MethodsMat = findTopMethods(filename,number);
  for i=2:9
    filename=['./',dirname,'/AUC/AUC_',prenom,'00',int2str(i),'_SIM.mat'];
    MethodsMat = horzcat(MethodsMat,findTopMethods(filename,number));
  end
  for i=10:99
    filename=['./',dirname,'/AUC/AUC_',prenom,'0',int2str(i),'_SIM.mat'];
    MethodsMat = horzcat(MethodsMat,findTopMethods(filename,number));
  end
  filename=['./',dirname,'/AUC/AUC_',prenom,int2str(100),'_SIM.mat'];  
  MethodsMat = horzcat(MethodsMat,findTopMethods(filename,number));
  
  total = zeros(44,1);
  for i=1:44
    total(i) = sum(sum(MethodsMat(:,:)==i));
  end
  data = struct('MethodsMat',MethodsMat,'totalAppearances',total);
  dataname = ['./',dirname,'/AUC/Top_',int2str(number),'_Methods.mat'];
  save(dataname,'-struct','data');
end

