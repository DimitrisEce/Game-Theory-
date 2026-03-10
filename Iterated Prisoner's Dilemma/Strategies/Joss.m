function [move] = Joss(move_history)

    if all(isnan(move_history(1 , :)))
        move = 1;
        return
    end

    index = find(~isnan(move_history(: , 2)) , 1 , "last");
    last_move = move_history(index , 2);

    if last_move == 1
        move = 1;

    else
        move = 2;
        return

    end

    defection_probability = rand();

    if defection_probability < 0.1
        move = 2;
    end
end