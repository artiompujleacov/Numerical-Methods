function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
    trans = FeatureMatrix' * FeatureMatrix;
    trans_Y = FeatureMatrix' * Y;
    intial_solutions = zeros(size(trans, 2), 1);
    [~, positive] = chol(trans);
    positive_definite = positive == 0;

    if positive_definite > 0
        residual = trans_Y - trans * intial_solutions;
        direction = residual;
        current_solutions = intial_solutions;
        i = 1;

        while i <= iter && residual' * residual > tol^2
            trans_direction = trans * direction;
            residual_ratio = (residual' * residual) / (direction' * trans_direction);
            current_solutions = current_solutions + residual_ratio * direction;
            next_residual = residual - residual_ratio * trans_direction;
            direction_ratio = (next_residual' * next_residual) / (residual' * residual);
            direction = next_residual + direction_ratio * direction;
            residual = next_residual;
            i++;
        endwhile

        Theta = current_solutions;
    else
        Theta = zeros(size(trans, 2), 1);
    endif

    Theta = [0; Theta];
endfunction
