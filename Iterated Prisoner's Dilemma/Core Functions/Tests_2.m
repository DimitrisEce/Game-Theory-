clc
B = [3 , 1 ; 4 , 2];

strategies = {"All-D" , "All-C" , "Grim" , "TitForTat" , "TitForTwoTats" , "GenerousTitForTat" , "Joss" , "Gradual" , "Pavlov" , "Prober" , "ProberMod" , "Maniac"};

population = [10 , 10 , 10 , 10 , 10 , 10 , 10 , 10 , 10 , 10 , 10 , 10];

[scores , players , num_matches] = Axel_2(B , strategies , population , 100);


Print_Info(scores , players , num_matches , strategies)

fprintf("\n\nRaw Scores vector:\n")
disp(scores)



