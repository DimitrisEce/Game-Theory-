function [move] = Pavlov(move_history , payoff_table)

    if all(isnan(move_history(1 , :)))
        move = 1;
        return
    end

    index = find(~isnan(move_history(: , 1)) , 1 , 'last');
    last_move_row = move_history(index , 1);
    last_move_column = move_history(index , 2);

    good_deal = payoff_table(1 , 1);
    last_deal = payoff_table(last_move_row , last_move_column);

    if last_deal >= good_deal
        move = last_move_row;
        return
    end

    if last_move_row == 1
        move = 2;

    else
        move = 1;
        
    end

end

