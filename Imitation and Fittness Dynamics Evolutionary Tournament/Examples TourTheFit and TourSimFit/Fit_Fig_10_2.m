B = [3 , 0 ; 4.7 , 1];

strategies = {'All-D' , 'All-C' , 'TitForTat' , 'Gradual' , 'Prober' , 'Per_CD' , 'Per_DDC' , 'Per_CCD' , 'Per_CCCCD' , 'Soft_Majority'};

population_vector = [0 , 0 , 0 , 0 , 0 , 0 , 244 , 300 , 0 , 100];
                    %AC  AD Tft Grd Pro CD  DDC  CCD  CCCCD  SM
tic;
[pop_the , ~ , ~] = TourTheFit_2(B , strategies , population_vector , 1000 , 500);
toc;

tic;
%[pop_sim , ~ , ~] = TourSimFit(B , strategies , population_vector , 1000 , 500);
toc;
title1 = 'Theoretical CCD : 300 DDC : 244 SM : 100 / T = 4.7 ';
title2 = 'Simulation CCD : 300 DDC : 244 SM : 100 / T = 4.7';

PlotResults(pop_the , strategies , title1);

%PlotResults(pop_sim , strategies , title2);

