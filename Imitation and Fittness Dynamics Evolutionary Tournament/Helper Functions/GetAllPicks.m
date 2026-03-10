function [loser_picks] = GetAllPicks(switchers , num_strats , W , loser_indices)

    loser_indices_enum = numel(loser_indices);
    states = GetAllStates(switchers , loser_indices_enum);

    valid = all(states <= W(loser_indices) , 2);
    states = states(valid , :);

    loser_picks = zeros(size(states , 1) , num_strats);

    loser_picks(: , loser_indices) = states;

end