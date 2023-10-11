function [classes] = predict_classes(X, weights, input_layer_size, hidden_layer_size, output_layer_size)
    m = size(X, 1);
    a1 = [ones(m, 1) X];
    Theta1 = reshape(weights(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, (input_layer_size + 1));
    Theta2 = reshape(weights((1 + (hidden_layer_size * (input_layer_size + 1))):end), output_layer_size, (hidden_layer_size + 1));
    z2 = a1 * Theta1';
    a2 = [ones(size(z2, 1), 1) sigmoid(z2)];
    z3 = a2 * Theta2';
    a3 = sigmoid(z3);
    [~, classes] = max(a3, [], 2);
end
