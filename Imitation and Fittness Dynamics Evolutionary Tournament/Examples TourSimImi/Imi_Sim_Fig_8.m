clc
clf
B = [3 , 0 ; 5 , 1];

strategies = {'All-D' , 'All-C' , 'TitForTat' , 'Gradual' , 'Prober' , 'Per_CD' , 'Per_DDC' , 'Per_CCD' , 'Per_CCCCD' , 'Soft_Majority'};

population_vector = [1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1];
                    %AD  AC Tft Grd Pro CD  DDC  CCD  CCCCD  SM

[pop , ~ , ~] = TourSimImi(B , strategies , population_vector , 10 , 10 , 1);

title = 'AD AC TfT Grad Prober CD CCD DDC CCCCD SM : 1 , 10 Rounds , 1 Switchers';

PlotResults(pop , strategies  , title);
disp(pop)