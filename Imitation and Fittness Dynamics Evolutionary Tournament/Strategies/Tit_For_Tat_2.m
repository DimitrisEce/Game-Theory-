function [move] = Tit_For_Tat_2(move_history)
    
    if all(isnan(move_history(1 , :)))
        move = 1;
        return
    end

    index = find(~isnan(move_history(: , 2)) , 1 , "last");
    last_move = move_history(index , 2);

    if last_move == 1
            move = 1;

    elseif last_move == 2
            move = 2;

    end

end