function add0s(dirname)
prenom = 'simER_subject_';
suffix = '_SIM';

% for i = 2:9
%     dataprenom = [prenom,'00',int2str(i),suffix];
%     convertSimTB2MULAN(dirname,dataprenom);
% end
% 
% for i = 10:99
%     dataprenom = [prenom,'0',int2str(i),suffix];
%     convertSimTB2MULAN(dirname,dataprenom);
% end

dataprenom = [prenom,'00',int2str(1),suffix];
convertSimTB2MULAN(dirname,dataprenom);

end


function convertSimTB2MULAN(dirname,dataprenom)
datafile=[dirname,'/data/',dataprenom,'.mat'];

simTB = load(datafile);

TR = .72; %repetition time

LFP = simTB.TC';

Connectivity = simTB.cmTC;
%replace NaNs with 0s in Connectivity Matrix
NaNrowcols = [];
for i = 1:size(Connectivity,1)
    if isnan(Connectivity(i,4))
        NaNrowcols = [NaNrowcols i];
    end
end
for i = 1:length(Connectivity)
    if ismember(i,NaNrowcols)
        Connectivity(i,:) = zeros(1,length(Connectivity));
        Connectivity(:,i) = zeros(length(Connectivity),1);
    end
end
Connectivity = Connectivity(~all(isnan(Connectivity)),~all(isnan(Connectivity)));

Params.fs = 1/TR;

save(datafile,'LFP','Connectivity','Params');
end