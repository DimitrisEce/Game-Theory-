function [match_result] = Match_2(payoff_table , player_strategies , num_rounds)

    move_history = nan(num_rounds , 2);
    flag_1 = 0;
    flag_2= 0;
    flag_2_1 = 0;
    flag_2_2 = 0;
    match_result = [0,0];

    for i = 1 : num_rounds
        
       %We now flip the move history. Thus, each player "reads" their opponent based on the second column. 
       [move_1 , flag_1 , flag_2_1] = Move_2(player_strategies{1} , move_history(: , [1 2]) , flag_1 , flag_2_1 , payoff_table);
       [move_2 , flag_2 , flag_2_2] = Move_2(player_strategies{2} , move_history(: , [2 1]) , flag_2 , flag_2_2 , payoff_table);
        
     
       move_history(i , :) = [move_1 , move_2];
   
       
       round_result = [payoff_table(move_1 , move_2) , payoff_table(move_2 , move_1)];

       match_result = match_result + round_result;
    
    end
end