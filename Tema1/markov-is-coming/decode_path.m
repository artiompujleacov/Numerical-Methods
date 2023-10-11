function [decoded_path] = decode_path (path, lines, cols)
    decoded_path = zeros(length(path) - 1, 2);
    i = 1;

    while i <= length(decoded_path)
        rowIndex = ceil(path(i) / cols);
        colIndex = mod(path(i) - 1, cols) +1;
        decoded_path(i, :) = [rowIndex, colIndex];
        i++;
    endwhile

endfunction
