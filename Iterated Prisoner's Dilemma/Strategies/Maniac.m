function [move] = Maniac(move_history)  %Just for fun.
    
    if all(isnan(move_history(1 , :)))
        move = 2;
        return
    end

    index = find(~isnan(move_history(: , 2)) , 1 , "last");
    last_move = move_history(index , 2);

    if last_move == 1
        move = 2;

    else
        move = 1;
    
    end

end


    