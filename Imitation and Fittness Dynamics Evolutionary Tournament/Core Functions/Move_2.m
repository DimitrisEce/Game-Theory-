function [move , flag , flag_2 , coop_left] = Move_2(player_strategy , move_history , flag , flag_2 , coop_left )

    if strcmp(player_strategy , 'All-C') 
        move = All_C();
   
    elseif strcmp(player_strategy , 'All-D')
        move = All_D();
    
    elseif strcmp(player_strategy , 'TitForTat')
        move = Tit_For_Tat_2(move_history);

    elseif strcmp(player_strategy , 'Gradual')
        [move , flag , flag_2 , coop_left] = Gradual(move_history , flag , flag_2 , coop_left);

    elseif strcmp(player_strategy , 'Prober')
        move = Prober(move_history);
    
    elseif strcmp(player_strategy , 'Per_CD')
        move = Per_CD(move_history);

    elseif strcmp(player_strategy , 'Per_DDC')
        move = Per_DDC(move_history);

    elseif strcmp(player_strategy , 'Per_CCD')
        move = Per_CCD(move_history);

    elseif strcmp(player_strategy , 'Per_CCCCD')
        move = Per_CCCCD(move_history);

    elseif strcmp(player_strategy , 'Soft_Majority')
        move = Soft_Majority(move_history);
    end

end