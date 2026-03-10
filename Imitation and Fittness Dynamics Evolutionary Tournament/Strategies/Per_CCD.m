function [move] = Per_CCD(move_history)

    if all(isnan(move_history(1 , :)))
        move = 1;
        return
    end

    if all(isnan(move_history(2 , :)))
        move = 1;
        return
    end

    if all(isnan(move_history(3 , :)))
        move = 2;
        return
    end

    indices = find(~isnan(move_history(: , 1)) , 2 , "last");
    player_last_move_1 = move_history(indices(2) , 1);
    player_last_move_2 = move_history(indices(1) , 1);

    if player_last_move_1 == 2
        move = 1;

    elseif player_last_move_1 == 1 && player_last_move_2 == 2
        move = 1;

    elseif player_last_move_1 == 1 && player_last_move_2 == 1
        move = 2;

    end

end