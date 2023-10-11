function [J, grad] = cost_function(params, X, y, lambda, input_layer_size, hidden_layer_size, output_layer_size)
    m = size(X, 1);

    Theta1 = reshape(params(1:hidden_layer_size * (input_layer_size + 1)), ...
        hidden_layer_size, (input_layer_size + 1));
    Theta2 = reshape(params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
        output_layer_size, (hidden_layer_size + 1));
    a1 = [ones(m, 1) X];
    z2 = a1 * Theta1';
    a2 = [ones(m, 1) sigmoid(z2)];
    z3 = a2 * Theta2';
    h = sigmoid(z3);
    Y = eye(output_layer_size)(y, :);

    J = (1 / m) * sum(sum((-Y) .* log(h) - (1 - Y) .* log(1 - h))) + ...
        (lambda / (2 * m)) * (sum(sum(Theta1(:, 2:end).^2)) + ...
        sum(sum(Theta2(:, 2:end).^2)));
    d3 = h - Y;
    d2 = (d3 * Theta2(:, 2:end)) .* (sigmoid(z2) .* (1 - sigmoid(z2)));
    gradient1 = d2' * a1 / m;
    gradient2 = d3' * a2 / m;
    gradient1(:, 2:end) = gradient1(:, 2:end) + lambda / m * Theta1(:, 2:end);
    gradient2(:, 2:end) = gradient2(:, 2:end) + lambda / m * Theta2(:, 2:end);
    grad = [gradient1(:); gradient2(:)];
endfunction
