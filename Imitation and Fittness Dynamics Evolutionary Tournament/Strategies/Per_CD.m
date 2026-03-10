function [move] = Per_CD(move_history)

    if all(isnan(move_history(1 , :)))
        move = 1;
        return
    end

    index = find(~isnan(move_history(: , 1)) , 1 , "last");
    player_last_move = move_history(index , 1);

    if player_last_move == 1
        move = 2;

    elseif player_last_move == 2
        move = 1;

    end

end
