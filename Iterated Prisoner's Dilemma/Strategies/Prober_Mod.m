function [move] = Prober_Mod(move_history)  %Tournament must be 3 rounds long or more.

    if all(isnan(move_history(1 , :)))
        move = 1;
        return
    end

    if all(isnan(move_history(2 , :)))
        move = 2;
        return
    end

    if all(isnan(move_history(3 , :)))
        move = 1;
        return
    end

    if all(move_history(1 : 3 , 2) == 1)
        move = 2;
        return
    end

    index = find(~isnan(move_history(: , 2)) , 1 , "last");
    last_move = move_history(index , 2);

    if last_move == 1
        move = 1;
    
    else
        move = 2;

    end

end