function [x_train, y_train, x_test, y_test] = split_dataset(X, y, percent)
    random = randperm(size(X, 1));
    X = X(random, :);
    y = y(random);
    m = size(X, 1);
    delimitate = floor(m * percent);
    x_train = X(1:delimitate, :);
    x_test = X(delimitate + 1:end, :);
    y_train = y(1:delimitate);
    y_test = y(delimitate + 1:end);
endfunction
