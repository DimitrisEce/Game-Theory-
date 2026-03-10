function [pop , bst , fit] = TourTheFit_2(payoff_matrix , player_strategies , population_0 , num_rounds , num_gens)

    num_strats = numel(player_strategies);
    N = sum(population_0);

    pop = zeros(num_gens + 1 , num_strats);
    fit = zeros(num_gens , num_strats);
    bst = cell(num_gens , 1);
    pop(1 , :) = population_0;

    strat_vs_strat = zeros(num_strats , num_strats);

    for i = 1 : num_strats
        for j = 1 : num_strats

            result = Match_2(payoff_matrix , {player_strategies{i} , player_strategies{j}} , num_rounds);
            strat_vs_strat(i , j) = result(1);

        end
    end

    for n = 1 : num_gens

        W = pop(n , :);
        g = (W * strat_vs_strat.') - diag(strat_vs_strat)';
        total = sum(W .* g);

        fit(n , :) = W .*g;
        W_proxima = floor(N*(W .* g) / total);

        pop(n + 1 , :) = W_proxima;

        [~ , indices] = max(W .* g);
        bst{n} = player_strategies{indices};

        if sum(W .* g == W(indices) * g(indices)) > 1
            equal = player_strategies(W .* g == W(indices) * g(indices));
            bst{n} = strjoin(equal , ', ');
        end
    end
end


