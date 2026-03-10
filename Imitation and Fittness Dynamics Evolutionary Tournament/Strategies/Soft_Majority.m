function [move] = Soft_Majority(move_history)

    if all(isnan(move_history(1 , :)))
        move = 1;
        return
    end

    opponent_moves = move_history(: , 2);
    opponent_moves = opponent_moves(~isnan(opponent_moves));
    opponent_moves = opponent_moves - 1;

    if sum(opponent_moves) <= numel(opponent_moves)/2
        move = 1;

    elseif sum(opponent_moves) > numel(opponent_moves)/2
        move = 2;

    end

end