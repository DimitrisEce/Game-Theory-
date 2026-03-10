function [move] = Per_CCCCD(move_history)

    if all(isnan(move_history(1 , :)))
        move = 1;
        return
    end

    if all(isnan(move_history(2 , :)))
        move = 1;
        return
    end

    if all(isnan(move_history(3 , :)))
        move = 1;
        return
    end

    if all(isnan(move_history(4 , :)))
        move = 1;
        return
    end

    if all(isnan(move_history(5 , :)))
        move = 2;
        return
    end

    indices = find(~isnan(move_history(: , 1)) , 4 , "last");
    player_last_move_1 = move_history(indices(4) , 1);
    player_last_move_2 = move_history(indices(3) , 1);
    player_last_move_3 = move_history(indices(2) , 1);
    player_last_move_4 = move_history(indices(1) , 1);

    if player_last_move_1 == 2
        move = 1;

    elseif player_last_move_1 == 1 && player_last_move_2 == 1 && player_last_move_3 == 1 && player_last_move_4 == 1
        move = 2;

    else
        move = 1;

    end

end
