function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
    Theta = zeros(n + 1, 1);
    FeatureMatrix = [ones(m, 1) FeatureMatrix];
    n = length(Theta);

    for i = 1:iter
        predictions = FeatureMatrix * Theta;
        gradient = (1 / m) * FeatureMatrix' * (predictions - Y);

        for j = 2:n
            Theta(j) = Theta(j) - alpha * gradient(j);
        endfor

    endfor

endfunction
