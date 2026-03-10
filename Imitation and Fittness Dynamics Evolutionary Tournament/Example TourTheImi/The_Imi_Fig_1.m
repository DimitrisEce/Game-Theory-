clc
clc
B = [3 , 0 ; 5 , 1];

strategies = {'All-D'};

population_vector = [1];
                    %AC  AD Tft 

[P] = TourTheImi(B , strategies , population_vector , 1 , 10);

title = 'One Player playing All-D';

states = GetAllStates(sum(population_vector) , numel(strategies));

PlotGraph(P , states , title);