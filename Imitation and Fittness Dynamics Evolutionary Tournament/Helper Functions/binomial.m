function [B] = binomial(n , k)
    B = arrayfun(@(ni , ki) nchoosek(ni , ki) , n , k);
end