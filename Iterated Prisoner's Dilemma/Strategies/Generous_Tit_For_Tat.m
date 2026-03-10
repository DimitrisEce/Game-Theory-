function [move] = Generous_Tit_For_Tat(move_history , payoff_table)

    if all(isnan(move_history(1 , :)))
        move = 1;
        return
    end

    index = find(~isnan(move_history(: , 2)) , 1 , "last");
    last_move = move_history(index , 2);

    if last_move == 1
        move = 1;

    else
        forgiveness_probability = max(0 , min(1 , (payoff_table(1,1)-payoff_table(2,2))/(payoff_table(2,1)-payoff_table(2,2))));
        r = rand();

        if forgiveness_probability > r
            move = 1;

        else
            move = 2;

        end
        
    end

end

    