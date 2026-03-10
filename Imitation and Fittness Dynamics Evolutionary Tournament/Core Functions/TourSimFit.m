function [pop , bst , fit] = TourSimFit(payoff_table , strategies , population_0 , num_rounds , num_gens)

    num_strats = numel(strategies);
    N = sum(population_0);

    pop = zeros(num_gens + 1 , num_strats);
    fit = zeros(num_gens , num_strats);
    bst = cell(num_gens , 1);
    
    population_fit = population_0;
    pop(1 , :) = population_0;

    for gen = 1 : num_gens
        
        [scores , players , ~] = Axel_2(payoff_table , strategies , population_fit , num_rounds);
       
        total_payoff = zeros(1 , num_strats);

        for i = 1 : num_strats
            mask = strcmp(players(: , 1) , strategies{i});
            total_payoff(i) = sum(scores(mask));
        end

        fit(gen , :) = total_payoff;

        raw_counts = total_payoff / sum(total_payoff) * N;
        new_population = round(raw_counts);

        diff = N - sum(new_population);

        if diff ~= 0
            [~ , max_index] = max(total_payoff - raw_counts);
            new_population(max_index) = new_population(max_index) + diff;
        end

        population_fit = new_population;
        pop(gen + 1 , :) = population_fit;

        best_index = find(total_payoff == max(total_payoff));
        bst{gen} = strategies{best_index};
    end

end
    
    
    


