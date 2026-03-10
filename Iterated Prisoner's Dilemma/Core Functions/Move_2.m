function [move , flag , flag_2] = Move_2(player_strategy , move_history , flag , flag_2 , payoff_table)

    if player_strategy == "All-C"
        move = All_C();
   
    elseif player_strategy == "All-D"
        move = All_D();
    
    elseif player_strategy == "TitForTat"
        move = Tit_For_Tat_2(move_history);

    elseif player_strategy == "Grim"
        [move , flag] = Grim_2(move_history , flag);

    elseif player_strategy == "TitForTwoTats"
        move = Tit_For_Two_Tats(move_history);

    elseif player_strategy == "GenerousTitForTat"
        move = Generous_Tit_For_Tat(move_history , payoff_table);

    elseif player_strategy == "Joss"
        move = Joss(move_history);

    elseif player_strategy == "Gradual"
        [move , flag , flag_2] = Gradual(move_history , flag , flag_2);

    elseif player_strategy == "Pavlov"
        move = Pavlov(move_history , payoff_table);

    elseif player_strategy == "Prober"
        move = Prober(move_history);

    elseif player_strategy == "ProberMod"
        move = Prober_Mod(move_history);

    elseif player_strategy == "Maniac"
        move = Maniac(move_history);

    end

end