function [move , retaliation_index , opp_defections , coop_left] = Gradual(move_history , retaliation_index , opp_defections , coop_left)

    if all(isnan(move_history(1 , :)))
        move = 1;
        retaliation_index = 0;
        opp_defections = 0;
        coop_left = 0;
        return
    end
    
    if retaliation_index > 0
        move = 2;
        retaliation_index = retaliation_index - 1;
        return
    end

    if coop_left > 0
        move = 1;
        coop_left = coop_left - 1;
        return
    end


    index = find(~isnan(move_history(: , 2)) , 1 , "last");
    last_move = move_history(index , 2);
    
    if last_move == 2 
        opp_defections = opp_defections + 1;
        retaliation_index = opp_defections;
        coop_left = 2;
        move = 2;
        retaliation_index = retaliation_index - 1;
        return
    end

    move = 1;
    
end
    
