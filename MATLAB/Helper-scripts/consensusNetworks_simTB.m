function consensusNetworks_simTB(dirname,prenom)
%prenom = simER_subject_XXX

%adding number to prenom
for i=1:9
    prenomWithNum = [prenom,'00',int2str(i),'_SIM'];
    addConsensusNetworks(dirname, prenomWithNum);
    mln_MethodStructuresAUC(dirname, [prenomWithNum '_extended']);
end
for i=10:99
    prenomWithNum = [prenom,'0',int2str(i),'_SIM'];
    addConsensusNetworks(dirname, prenomWithNum);
    mln_MethodStructuresAUC(dirname, [prenomWithNum '_extended']);
end
  prenomWithNum = [prenom,int2str(100),'_SIM'];
  addConsensusNetworks(dirname, prenomWithNum);
  mln_MethodStructuresAUC(dirname, [prenomWithNum '_extended']);