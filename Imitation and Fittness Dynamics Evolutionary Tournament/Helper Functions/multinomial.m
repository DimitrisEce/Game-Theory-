function [m] = multinomial(K , ks)
    m = factorial(K) / prod(factorial(ks));
end