clc
B = [3 , 0 ; 5 , 1];

strategies = {'All-D' , 'All-C' , 'TitForTat' , 'Gradual' , 'Prober' , 'Per_CD' , 'Per_DDC' , 'Per_CCD' , 'Per_CCCCD' , 'Soft_Majority'};

population_vector = [10 , 10 , 10 , 10 , 10 , 10 , 10 , 10 , 10 , 10];
                    %AC  AD Tft Grd Pro CD  DDC  CCD  CCCCD  SM

[pop , bst , fit] = TourTheFit_2(B , strategies , population_vector , 1000 , 160);

PlotResults(pop , strategies);

disp(pop)
disp(bst)
disp(fit)