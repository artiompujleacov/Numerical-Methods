function [FeatureMatrix] = prepare_for_regression(InitialMatrix)

    [m, n] = size(InitialMatrix);
    FeatureMatrix = zeros(m, n + 1);

    for i = 1:m
        new_index = 1;

        for initial_index = 1:n

            if strcmp(InitialMatrix{i, initial_index}, 'yes')
                FeatureMatrix(i, new_index) = 1;
            elseif strcmp(InitialMatrix{i, initial_index}, 'no')
                FeatureMatrix(i, new_index) = 0;
            elseif strcmp(InitialMatrix{i, initial_index}, 'semi-furnished')
                FeatureMatrix(i, new_index:new_index + 1) = [1, 0];
                new_index = new_index + 1;
            elseif strcmp(InitialMatrix{i, initial_index}, 'unfurnished')
                FeatureMatrix(i, new_index:new_index + 1) = [0, 1];
                new_index = new_index + 1;
            elseif strcmp(InitialMatrix{i, initial_index}, 'furnished')
                FeatureMatrix(i, new_index:new_index + 1) = [0, 0];
                new_index++;
            else
                FeatureMatrix(i, new_index) = InitialMatrix{i, initial_index};
            endif

            new_index++;
        endfor

    endfor

endfunction
