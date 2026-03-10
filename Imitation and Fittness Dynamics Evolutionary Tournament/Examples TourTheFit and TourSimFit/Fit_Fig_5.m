B = [3 , 0 ; 5 , 1];

strategies = {'All-D' , 'All-C' , 'TitForTat' , 'Gradual' , 'Prober' , 'Per_CD' , 'Per_DDC' , 'Per_CCD' , 'Per_CCCCD' , 'Soft_Majority'};

population_vector = [0 , 0 , 0 , 0 , 0 , 400 , 300 , 0 , 0 , 200];
                    %AC  AD Tft Grd Pro CD  DDC  CCD  CCCCD  SM
tic;
[pop_the , ~ , ~] = TourTheFit_2(B , strategies , population_vector , 1000 , 450);
toc;

tic;
%[pop_sim , ~ , ~] = TourSimFit(B , strategies , population_vector , 1000 , 450);
toc;
title1 = 'Theoretical CD : 400 DDC : 300 SM : 200';
title2 = 'Simulation CD : 400 DDC : 300 SM : 200';

PlotResults(pop_the , strategies , title1);

%PlotResults(pop_sim , strategies , title2);

