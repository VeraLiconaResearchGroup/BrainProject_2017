function removeNaNs(dirname)
prenom = 'simER_subject_';
suffix = '_SIM';

% dataprenom = [prenom,'0',int2str(38), suffix]
% convertSimTB(dirname,dataprenom);

for i = 1:9
    dataprenom = [prenom,'00',int2str(i),suffix];
    convertSimTB(dirname,dataprenom);
end

for i = 10:99
    dataprenom = [prenom,'0',int2str(i),suffix];
    convertSimTB(dirname,dataprenom);
end

dataprenom = [prenom,int2str(100),suffix];
convertSimTB(dirname,dataprenom);

end


function convertSimTB(dirname,dataprenom)
datafile=[dirname,'/data/',dataprenom,'.mat'];

simTB = load(datafile);

TR = .72; %repetition time

LFP = simTB.TC';

wRowNames = horzcat((1:1:27)',simTB.cmTC);
wRowColNames = vertcat(0:1:27,wRowNames);

Connectivity = wRowColNames;
%remove NaN's from Connectivity Matrix
NaNrowcols = [];
for i = 1:size(Connectivity,1)
    if isnan(Connectivity(i,4))
        NaNrowcols = [NaNrowcols i];
    end
end
for i = 1:length(Connectivity)
    if ismember(i,NaNrowcols)
        Connectivity(i,i) = NaN;
        Connectivity(1,i) = NaN;
        Connectivity(i,1) = NaN;
    end
end
Connectivity = Connectivity(~all(isnan(Connectivity)),~all(isnan(Connectivity)));
Connectivity(:,1) = [];
names = Connectivity(1,:);
Connectivity(1,:) = [];
NaNrowcols = NaNrowcols - 1;
for i = length(NaNrowcols):-1:1
    LFP(NaNrowcols(i),:) = [];
end

Params.fs = 1/TR;

save(datafile,'LFP','Connectivity','Params','names');
end