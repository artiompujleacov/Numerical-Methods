function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
    [m, n] = size(FeatureMatrix);

    FeatureMatrix = [ones(m, 1), FeatureMatrix];
    Error = (1 / m) * sum((Y - FeatureMatrix * Theta).^2) + ...
        (lambda * sum(abs(Theta(2:end))));
end
