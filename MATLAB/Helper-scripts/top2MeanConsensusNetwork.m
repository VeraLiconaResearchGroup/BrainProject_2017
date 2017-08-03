% Huifang Wang, Sep. 26, 2013
% Huifang Wang, Nov. 26, 2013 update Method Structure AUC for mlnI
function flg=top2MeanConsensusNetwork(dirname,prenom)

flg=0; % flg for the error

molecMeths ={'Genie' 'Tigress'};

top2 = {'BCorrU' 'BCorrD'};

filename1=['./',dirname,'/ToutResults/Tout_',prenom,'.mat'];
calresult=load(filename1);

consensustop2mean=zeros(387);
count = 0.0;
for i=1:length(top2)
  methodname = top2{i};
  mat = calresult.(methodname);
  if any(isnan(mat(:)))
  else
      mat = abs(mat);
      consensustop2mean = consensustop2mean + mat;
      count = count + 1;
  end
end
consensustop2mean = consensustop2mean/double(count);
calresult.('top2mean') = consensustop2mean;
save(['./',dirname,'/ToutResults/Tout_',prenom, '_extended', '.mat'], '-struct', 'calresult');