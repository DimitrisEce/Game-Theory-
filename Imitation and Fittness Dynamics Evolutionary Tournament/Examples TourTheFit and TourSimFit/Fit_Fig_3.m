B = [3 , 0 ; 5 , 1];

strategies = {'All-D' , 'All-C' , 'TitForTat' , 'Gradual' , 'Prober' , 'Per_CD' , 'Per_DDC' , 'Per_CCD' , 'Per_CCCCD' , 'Soft_Majority'};

population_vector = [0 , 0 , 0 , 0 , 0 , 0 , 1000 , 450 , 0 , 100];
                    %AC  AD Tft Grd Pro CD  DDC  CCD  CCCCD  SM
tic;
[pop_the , ~ , ~] = TourTheFit_2(B , strategies , population_vector , 1000 , 450);
toc;

tic;
%[pop_sim , ~ , ~] = TourSimFit(B , strategies , population_vector , 1000 , 450);
toc;
title1 = 'Theoretical CCD : 450 DDC : 1000 SM : 100';
title2 = 'Simulation CCD : 450 DDC : 1000 SM : 100';

PlotResults(pop_the , strategies , title1);

%PlotResults(pop_sim , strategies , title2);

