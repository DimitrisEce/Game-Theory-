clc
clc
B = [3 , 0 ; 5 , 1];

strategies = {'All-C'};

population_vector = [2];
                    %AC  AD Tft 

[P] = TourTheImi(B , strategies , population_vector , 1 , 10);

title = 'Two players playing All C';

states = GetAllStates(sum(population_vector) , numel(strategies));

PlotGraph(P , states , title);