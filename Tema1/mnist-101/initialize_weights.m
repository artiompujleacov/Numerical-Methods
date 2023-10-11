function [matrix] = initialize_weights(L_prev, L_next)
    epsilon = abs(sqrt(6)) / sqrt(L_next + L_prev);
    temporary_matrix = rand(L_next, L_prev + 1);
    matrix = temporary_matrix * 2 * epsilon - epsilon;
endfunction
