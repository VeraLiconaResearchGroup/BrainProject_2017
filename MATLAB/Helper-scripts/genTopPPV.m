function [x,names] = genTopPPV(filename,number)
 load(filename);
 PPV = Meths.PPV';
 
 AUC = Meths.MSAUC;
 row = zeros(size(AUC):1);
 for i=1:size(AUC)
   row(i,1) = i;
 end
 AUC = horzcat(AUC, row);
 AUC = sortrows(AUC, 1);
 AUC = AUC(size(AUC)-number+1:size(AUC),1:2);
  
 x = PPV(:,AUC(1,2));
 count = 1;
 names = cell(number, 1);
 name = Meths.Methodnames{AUC(1,2)};
 names(count,:) = {name};

 for i=2:number
   x = horzcat(x, PPV(:,AUC(i,2)));
   count = count + 1;
   name = Meths.Methodnames{AUC(i,2)};
   names(count,:) = {name};   
 end

%  figure()
%  plot(x);
%  legend(names, 'Fontsize', 7, 'location','eastoutside');
  