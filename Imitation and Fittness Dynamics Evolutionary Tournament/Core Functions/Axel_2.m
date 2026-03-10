function [scores , players , num_matches] = Axel_2(payoff_table , strategies , population , num_rounds)
    N = sum(population);
    num_matches = 0;
    
    players = cell(N , 2);
    players(: , 1) = repelem(strategies(:) , population(:));
    players(: , 2) = num2cell(zeros(N , 1));
    
    for i = 1 : N - 1

        for j = i + 1 : N

            player_strategies = {players{i , 1} , players{j , 1}};

            match_result = Match_2(payoff_table , player_strategies , num_rounds);

            players{i , 2} = players{i , 2} + match_result(1);
            players{j , 2} = players{j , 2} + match_result(2);

            num_matches = num_matches + 1;

        end

    end

    scores = cell2mat(players(: , 2));

end