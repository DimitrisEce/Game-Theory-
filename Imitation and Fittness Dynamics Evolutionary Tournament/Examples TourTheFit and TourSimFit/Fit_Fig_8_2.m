B = [3 , 0 ; 5 , 1];

strategies = {'All-D' , 'All-C' , 'TitForTat' , 'Gradual' , 'Prober' , 'Per_CD' , 'Per_DDC' , 'Per_CCD' , 'Per_CCCCD' , 'Soft_Majority'};

population_vector = [0 , 0 , 0 , 0 , 0 , 100 , 100 , 0 , 0 , 160];
                    %AC  AD Tft Grd Pro CD  DDC  CCD  CCCCD  SM
tic;
[pop_the , ~ , ~] = TourTheFit_2(B , strategies , population_vector , 1000 , 25);
toc;

tic;
%[pop_sim , ~ , ~] = TourSimFit(B , strategies , population_vector , 1000 , 125);
toc;
title1 = 'Theoretical CD : 100 DDC : 100 SM : 160';
title2 = 'Simulation CD : 100 DDC : 100 SM : 160';

PlotResults(pop_the , strategies , title1);

%PlotResults(pop_sim , strategies , title2);

