function MulanCal_simTB(dirname,dataprenom,paramfile)
% Huifang Wang, Marseille, August 18, 2013, Calculate all methods  
VGroupMethlog = {'TimeBasic','FreqBasic','Hsquare','Granger','FreqAH','MutualInform','TE','Tigress','Genie'};
%VGroupMethlog = {'MutualInform','TE'}
% csvFile =[dataprenom,'.csv'];
% lfp = xlsread(csvFile);
% Params = struct('fs',.5);
% save(datafile,'-struct','alldata');
% alldata = struct('lfp',lfp,'Params',Params);
datafile=[dirname,'/data/',dataprenom,'.mat'];

data=load(datafile);
load(paramfile);
%Params=data.Params;


%% load the data

if exist(datafile,'file')
    try 
        prevar = load(datafile);
        if isstruct(prevar)
            fileprevar=fieldnames(prevar);
            iLFP=strncmpi(fileprevar,'LFP',3); % compare vector of string 'Params''Connectivity' 'LFP' to 'LFP'
            if ~isempty(find(strncmpi(fileprevar,'LFP',1)==1,1))
                lfp = prevar.(char(fileprevar(iLFP)));
                
            else
                errordlg('Which date want to process?')
            end
            
            if size(lfp,1)>size(lfp,2)
                lfp=lfp';
            else
                lfp=lfp;
            end
            
        end            
    catch ME
        errordlg('filename is invalid')
    end
end

if ~isempty(find(strncmpi(fileprevar,'Params',6)==1,1))
    
    Params= prevar.Params;
    
end

if ~isempty(find(strncmpi(fileprevar,'Connectivity',12)==1,1))
    
    ReferenceMatrix= prevar.Connectivity;
    
end

%% Calculate the 

%%%% Get parameters
%VGroupMethlog={'TimeBasic','FreqBasic','Hsquare','Granger','FreqAH','MutualInform','TE'};

%%% Define the file to store results
Ngroup=length(VGroupMethlog);
for igroup=1:Ngroup
    GroupMethlog=VGroupMethlog{igroup};
    Resultfile=[dirname,'/Results/',GroupMethlog,'_',dataprenom,'.mat'];
    [Methlogs,paramsfields]=mln_setgroupmethlogparam(GroupMethlog);
    params=initialparamsmethodsGiven(paramsfields,calParams);
    params.fs=Params.fs;
    
    tic
    switch GroupMethlog
      case 'TimeBasic'
        mln_calcMatTimeBasic_priordata(Resultfile,Methlogs,lfp,params);
      case 'FreqBasic'
        mln_calcMatFreqBasic_priordata(Resultfile,Methlogs,lfp,params);
      case 'Hsquare'
        mln_calcMatH2_priordata(Resultfile,Methlogs,lfp,params);
       case 'Granger'
         mln_calcMatGranger_priordata(Resultfile,Methlogs,lfp,params);
      case 'FreqAH'
        mln_calcMatMvar_priordata(Resultfile,Methlogs,lfp,params);
      case 'MutualInform'
        mln_calcMatMITime_priordata(Resultfile,Methlogs,lfp,params);
      case 'TE'
        mln_calcMatTE_priordata(Resultfile,Methlogs,lfp,params);
      case 'Tigress'
        mln_calcMatTigress_priordata(Resultfile,Methlogs,lfp,params);
      case 'Genie'
        mln_calcMatGenie_priordata(Resultfile,Methlogs,lfp,params);
    end
    
    timerVal = toc;
    Time.(GroupMethlog) = timerVal;
    
end

filesaved=[dirname,'/ToutResults/Time_',dataprenom];
save(filesaved,'-struct','Time');
mln_Result2file_simTB(dirname,dataprenom,VGroupMethlog);
mln_MethodStructuresAUCforNORMALIZED(dirname,dataprenom);


function params=initialparamsmethodsGiven(paramsfields,calParams)

param_df=struct('wins',calParams.defwindow,...
                'overlap',calParams.defoverlap,...
                'modelOrder',calParams.defmodelorders,...
                'minfreq',calParams.minfreq,'maxfreq',calParams.maxfreq,'stepfreq',calParams.stepfreq,...
                'bins',calParams.defbins,...
                'MaxDelay',calParams.defMaxDelay,'genieMethod', ...
                calParams.genieMethod,'genieNbTrees', ...
                calParams.genieNbTrees,'genieK',calParams.genieK,'tigressR',calParams.tigressR,'tigressAlpha',calParams.tigressAlpha,'tigressL',calParams.tigressL,'tigressLarsAlgo',calParams.tigressLarsAlgo,'tigressScoreMethod',calParams.tigressScoreMethod);

Nparamf=length(paramsfields);
paramsdata=cell(Nparamf,2);
for i=1:Nparamf
    paramsdata{i,1}=paramsfields{i};
    paramsdata{i,2}=param_df.(paramsfields{i});
end
params=mln_cell2struct(paramsdata);

function params=mln_cell2struct(cparams)
nparams=size(cparams,1);
for i=1:nparams
    parafiled=char(cparams(i,1));

    params.(parafiled)=str2double(cparams(i,2));
    
end

