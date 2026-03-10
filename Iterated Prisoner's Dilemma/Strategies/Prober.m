function [move] = Prober(move_history)  %It is actually "Remorsefull Prober"

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

    if all(move_history(1 : 3 , 2) == 1)
        move = 2;
        return
    end

    index = find(~isnan(move_history(: , 2)) , 1 , "last");
    last_move_column = move_history(index , 2);
    last_move_row = move_history(index , 1);

    if last_move_row == 2 && last_move_column == 2
        move = 1;
        return
    end

    if last_move_column == 1
        move = 1;

    else
        move = 2;

    end

end
    


