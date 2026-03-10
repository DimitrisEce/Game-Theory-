clc
clf
B = [3 , 0 ; 5 , 1];

strategies = {'All-D' , 'All-C' , 'TitForTat' , 'Gradual' , 'Prober' , 'Per_CD' , 'Per_DDC' , 'Per_CCD' , 'Per_CCCCD' , 'Soft_Majority'};

population_vector = [10 , 10 , 10 , 0 , 0 , 0 , 0 , 0 , 0 , 0];
                    %AD  AC Tft Grd Pro CD  DDC  CCD  CCCCD  SM

[pop , ~ , ~] = TourSimImi(B , strategies , population_vector , 150 , 10 , 10);

title = 'All D : 10 All C : 10 , TfT : 10 , 150 Rounds , 10 Switchers';

PlotResults(pop , strategies  , title);
disp(pop)