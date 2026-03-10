function [move] = Tit_For_Two_Tats(move_history)

    if all(isnan(move_history(1 , :)))
        move = 1;
        return
    end

    if isnan(move_history(2 , 2))
        move = 1;
        return
    end

    indices = find(~isnan(move_history(: , 2)) , 2 , "last");
    last_move = move_history(indices(2) , 2);
    second_to_last_move = move_history(indices(1) , 2);

    if last_move == 2 && second_to_last_move == 2
        move = 2;

    else
        move = 1;

    end

end