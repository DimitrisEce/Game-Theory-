clc
B = [3 , 0 ; 5 , 1];

strategies = {'All-D' , 'All-C' , 'TitForTat'};

population_vector = [3 , 3 , 3];
                    %AC  AD Tft Grd Pro CD  DDC  CCD  CCCCD  SM

[P] = TourTheImi(B , strategies , population_vector , 1 , 10);

states = GetAllStates(sum(population_vector) , numel(strategies));

PlotGraph(P , states);