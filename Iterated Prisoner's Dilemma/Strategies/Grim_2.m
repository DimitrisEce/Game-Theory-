function [move , flag] = Grim_2(move_history , flag)

    if all(isnan(move_history(1 , :)))
        move = 1;
        return
    end

    index = find(~isnan(move_history(: , 2)) , 1 , "last");
    last_move = move_history(index , 2);

    if flag == 1
            move = 2;

    elseif last_move == 1
            move = 1;

    elseif flag == 0 && last_move == 2
            flag = 1;
            move = 2;
    end

end