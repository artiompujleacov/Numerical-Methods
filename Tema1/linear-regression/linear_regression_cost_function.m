function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
    m = length(Y);
    Error = 0;
    n = length(Theta);

    for i = 1:m
        prediction = 0;

        for j = 2:n
            prediction = prediction + Theta(j) * FeatureMatrix(i, j - 1);
        endfor

        error = prediction - Y(i);
        Error += error^2;
    endfor

    Error = (1 / (2 * m)) * Error;
endfunction
