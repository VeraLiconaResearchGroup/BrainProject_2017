function calculateMaxMin(dirname,prenom)

filename=['./',dirname,'/ToutResults/Tout_',prenom,'.mat'];

calresult=load(filename);
fieldname=fieldnames(calresult);
% remove params and connectivity
fieldname(strcmp('Params',fieldname))=[];

fieldname(strcmp('Connectivity',fieldname))=[];
%%
%idx=find(strcmp('pCOH1',fieldname));
%fieldname(idx)=[];
%%
Nmethod=length(fieldname);

Meths.Methodnames=fieldname;


for imethod=1:44
    Methods=fieldname{imethod};
    Mat=calresult.(Methods);
    fieldname{imethod}
    max(max(Mat))
    min(min(Mat))
end