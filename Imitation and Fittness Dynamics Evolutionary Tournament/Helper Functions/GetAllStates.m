function [states] = GetAllStates(N , num_strats)

    if num_strats == 1
        states = N;
        return;
    end
    
    
    states = [];
    
    for i = 0 : N
        remaining = GetAllStates(N - i , num_strats - 1);
        states = [states; [i * ones(size(remaining , 1) , 1) , remaining]];
    end

end