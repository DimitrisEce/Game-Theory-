function [move , retaliation_index , opp_defections] = Gradual(move_history , retaliation_index , opp_defections)

    if all(isnan(move_history(1 , :)))
        move = 1;
        retaliation_index = 0;
        return
    end

    index = find(~isnan(move_history(: , 2)) , 1 , "last");
    last_move = move_history(index , 2);
    
    if retaliation_index > 0
        move = 2;
        retaliation_index = retaliation_index - 1;
        return
    end

    if last_move == 1
        move = 1;
        opp_defections = 0;

    else
        opp_defections = opp_defections + 1;
        move = 2;
        retaliation_index = opp_defections - 1;

    end
end
    
