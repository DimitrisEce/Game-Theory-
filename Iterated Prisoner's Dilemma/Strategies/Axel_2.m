function [scores , players , num_matches] = Axel_2(payoff_table , strategies , population , num_rounds)

    N = sum(population(1 : end));
    num_matches = 0;
    
    players_1 = repmat({""} , population(1) , 2);
    players_2 = repmat({""} , population(2) , 2);
    players_3 = repmat({""} , population(3) , 2);
    players_4 = repmat({""} , population(4) , 2);
    players_5 = repmat({""} , population(5) , 2);
    players_6 = repmat({""} , population(6) , 2);
    players_7 = repmat({""} , population(7) , 2);
    players_8 = repmat({""} , population(8) , 2);
    players_9 = repmat({""} , population(9) , 2);
    players_10 = repmat({""} , population(10) , 2);
    players_11 = repmat({""} , population(11) , 2);
    players_12 = repmat({""} , population(12) , 2);


    players_1(: , 1) = {strategies{1}};
    players_2(: , 1) = {strategies{2}};
    players_3(: , 1) = {strategies{3}};
    players_4(: , 1) = {strategies{4}};
    players_5(: , 1) = {strategies{5}};
    players_6(: , 1) = {strategies{6}};
    players_7(: , 1) = {strategies{7}};
    players_8(: , 1) = {strategies{8}};
    players_9(: , 1) = {strategies{9}};
    players_10(: , 1) = {strategies{10}};
    players_11(: , 1) = {strategies{11}};
    players_12(: , 1) = {strategies{12}};

    players_1(: , 2) = {0};
    players_2(: , 2) = {0};
    players_3(: , 2) = {0};
    players_4(: , 2) = {0};
    players_5(: , 2) = {0};
    players_6(: , 2) = {0};
    players_7(: , 2) = {0};
    players_8(: , 2) = {0};
    players_9(: , 2) = {0};
    players_10(: , 2) = {0};
    players_11(: , 2) = {0};
    players_12(: , 2) = {0};
    
    %The 'players' vector contains the player's strategy in the first column and
    %their score in the second colum.

    players = [players_1 ; players_2 ; players_3 ; players_4 ; players_5 ; players_6 ; players_7 ; players_8 ; players_9 ; players_10 ; players_11 ; players_12];
    
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