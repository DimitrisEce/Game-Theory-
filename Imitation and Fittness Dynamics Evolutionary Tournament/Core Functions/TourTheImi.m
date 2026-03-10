function [P] = TourTheImi(payoff_matrix , player_strategies , population_0 , switchers , num_rounds)

    num_strats = numel(player_strategies);
    N = sum(population_0);

    different_states = GetAllStates(N , num_strats);

    num_different_states = size(different_states , 1);

    strat_vs_strat = zeros(num_strats , num_strats);

    for i = 1 : num_strats
        for j = 1 : num_strats

            result = Match_2(payoff_matrix , {player_strategies{i} , player_strategies{j}} , num_rounds);
            strat_vs_strat(i , j) = result(1);

        end
    end

    P = zeros(num_different_states , num_different_states);

    for s = 1 : num_different_states
        W = different_states(s , :);

        payoffs = W * strat_vs_strat.';

        best_indices = find(payoffs == max(payoffs));
        sore_loser_indices = setdiff(1 : num_strats , best_indices);
        sore_loser_indices = sore_loser_indices(W(sore_loser_indices) > 0);

        num_losers = sum(W(sore_loser_indices));
        fprintf("s=%d, W=[%s], bestIdx=%s, loserIdx=%s, #losers=%d\n", ...
        s, num2str(W), mat2str(best_indices), mat2str(sore_loser_indices), num_losers);

        if num_losers == 0
            fprintf("  → absorbing, setting P(%d,%d)=1\n", s,s);
            P(s , s) = 1;
            continue
        end

        loser_picks = GetAllPicks(switchers , num_strats , W , sore_loser_indices);

        strat_picks = GetAllStates(switchers , numel(best_indices));


        for k = 1 : size(loser_picks , 1)

            picks_vector = loser_picks(k , :);
            pick_ways = prod(binomial(W , picks_vector));
            total_ways = nchoosek(num_losers , switchers);

            pick_prob = pick_ways / total_ways;

            for z = 1 : size(strat_picks , 1)

                strat_dist = strat_picks(z , :);
                strat_picks_vector = zeros(1 , num_strats);
                strat_picks_vector(best_indices) = strat_dist;

                assignment_ways = multinomial(switchers , strat_dist);
                assignment_prob = assignment_ways / (numel(best_indices)^switchers);

                W_proxima = W - picks_vector + strat_picks_vector;

                s2 = find(all(different_states == W_proxima , 2) , 1);
                P(s , s2) = P(s , s2) + pick_prob*assignment_prob;

            end
        end
    end
    rs = sum(P,2);
    zerorows = find(abs(rs)<1e-14);
    P(sub2ind(size(P), zerorows, zerorows)) = 1;
end
