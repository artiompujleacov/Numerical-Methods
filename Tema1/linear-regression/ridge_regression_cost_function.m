function [Error] = ridge_regression_cost_function(Theta, Y, FeMatrix, lambda)

    [m, n] = size(FeMatrix);
    FeMatrix = [ones(m, 1), FeMatrix];
    Error = (1 / (2 * m)) * sum((Y - FeMatrix * Theta).^2) + ...
        (lambda * sum(Theta(2:end).^2));
end
