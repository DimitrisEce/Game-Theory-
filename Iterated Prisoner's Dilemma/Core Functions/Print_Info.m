function [] = Print_Info(scores , players , num_matches , strategies)

    for i = 1 : size(players , 1)
    
    fprintf('Player %3d strategy: %-20s Score: %4d.\n', i, players{i,1}, scores(i,1));

    end

    score_sum = sum(scores(: , 1));
    average_score = mean(scores);
    fprintf("\nScore Sum: %d.\n" , score_sum);
    fprintf("Matches played: %d.\n\n",num_matches);
    fprintf("Average Score: %.2f.\n" , average_score);

    num_strategies = numel(strategies);
    players_formatted = string(players(: , 1));
    strategies_formatted = string(strategies);

    strategy_score_sums = cell(num_strategies , 2);

    for i = 1 : num_strategies
        indices = players_formatted == strategies_formatted(i);
        average_strat_score = mean(scores(indices));

        strategy_score_sums{i , 1} = strategies{i};
        strategy_score_sums{i , 2} = sum(scores(indices));

        fprintf("%-20s Average Score: %.2f.\n" , strategies{i} , average_strat_score);
    end

    score_sums_array = cell2mat(strategy_score_sums(: , 2));

    [~ , sort_indices] = sort(score_sums_array , 'descend');

    strategy_score_sums = strategy_score_sums(sort_indices , :);

    fprintf("\nStrategy ranking based on total points accumulated:\n")

    for i = 1 : num_strategies

        fprintf("%2d)  %s\n", i , strategy_score_sums{i , 1});

    end
