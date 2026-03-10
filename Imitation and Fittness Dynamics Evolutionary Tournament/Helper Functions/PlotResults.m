function [] = PlotResults(population_evolutuion , player_strategies , t)


    [num_gens , ~] = size(population_evolutuion);

    num_gens = 0 : (num_gens - 1);

    initial_population = population_evolutuion(1 , :);
    active = initial_population > 0;

    if ~any(active)
        error('Tournament cannot be initialized with zero players.')
    end
    
    active_strats = player_strategies(active);
    active_population = population_evolutuion(: , active);

    line_styles = {'-' , '--' , ':' , '-.'};
    num_styles = numel(line_styles);

    figure;
    hold on;

    for i = 1 : size(active_population , 2)
        style = line_styles{mod(i - 1 , num_styles) + 1};
        plot(num_gens , active_population(: , i) ,'Linestyle' , style , 'LineWidth', 1.5 , 'DisplayName', active_strats{i});
    end

    hold off

    xlabel('Generation');
    ylabel('Numbers of each Strategy');
    title(t);
    legend('show' , 'Location', 'best');
    grid on;

end