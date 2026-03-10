clc
B = [3 , 0 ; 5 , 1];

strategies = {'All-D' , 'All-C' , 'TitForTat' , 'Gradual' , 'Prober' , 'Per_CD' , 'Per_DDC' , 'Per_CCD' , 'Per_CCCCD' , 'Soft_Majority'};

population_vector = [10 , 10 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0];
                    %AD  AC Tft Grd Pro CD  DDC  CCD  CCCCD  SM

[pop , bst , switchers_record] = TourSimImi(B , strategies , population_vector , 10 , 10 , 10);

PlotResults(pop , strategies  , '');

disp(bst)

idk = vertcat(switchers_record{:});
whatever = vertcat(idk{:});
doesntmatter = struct2table(whatever);
disp(doesntmatter)

