clc
B = [3 , 0 ; 5 , 1];

strategies = {'All-C' , 'All-D' , 'TitForTat'};

population_vector = [1 , 1 , 1];
                    %AC  AD Tft 

[P] = TourTheImi(B , strategies , population_vector , 1 , 10);

title = 'Three players playing All C , All D and TfT';

states = GetAllStates(sum(population_vector) , numel(strategies));

PlotGraph(P , states , title);