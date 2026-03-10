function [pop , bst , switchers_record] = TourSimImi(payoff_table , player_strategies , population_0 , num_rounds , num_gens , switchers)

    num_strats = numel(player_strategies);
    N = sum(population_0);

    pop = zeros(num_gens + 1 , num_strats);
    bst = cell(num_gens , 1);
    switchers_record = cell(num_gens , 1);

    pop(1 , :) = population_0(:);
    population = population_0(:);

    for gen = 1 : num_gens
        
        [scores , players , ~] = Axel_2(payoff_table , player_strategies , population , num_rounds);
        total_payoff = zeros(num_strats , 1);

        for i = 1 : num_strats
            identifier = strcmp(players(: , 1) , player_strategies{i});
            total_payoff(i) = sum(scores(identifier));
        end

        best_indices = find(total_payoff == max(total_payoff));
        bst{gen} = strjoin(player_strategies(best_indices), ', ');

        events = cell(switchers , 1);

        for j = 1 : switchers

            sore_loser_identifier = ~ismember(players(: , 1) , player_strategies(best_indices));
            sore_loser_indices = find(sore_loser_identifier);

            if isempty(sore_loser_indices)
                break;
            end

            chosen_one = sore_loser_indices(randi(numel(sore_loser_indices)));
            conversion = player_strategies{best_indices(randi(numel(best_indices)))};

            old_way = players{chosen_one , 1};

            if ~strcmp(old_way , conversion)

                events{j} = struct('Player_No' , chosen_one , 'switches_from' , old_way , 'to' , conversion);

                where_old = find(strcmp(player_strategies , old_way) , 1);
                where_new = find(strcmp(player_strategies , conversion) , 1);
                population(where_old) = population(where_old) - 1;
                population(where_new) = population(where_new) + 1;
                players{chosen_one , 1} = conversion;
           
            end

        end
        switchers_record{gen} = events;
        pop(gen+1, :) = population;

    end

end

        
