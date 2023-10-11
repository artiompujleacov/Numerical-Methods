function [Y, InitialMatrix] = parse_data_set_file(file_path)

    file = fopen(file_path, 'r');
    line = fgetl(file);
    sizes = sscanf(line, '%d %d');
    m = sizes(1);
    n = sizes(2);
    InitialMatrix = cell(m, n);
    Y = zeros(m, 1);

    for i = 1:m

        line = fgetl(file);
        data = strsplit(line);
        Y(i) = str2double(data{1});

        for j = 2:(n + 1)

            num = str2double(data{j});

            if isnan(num)
                InitialMatrix{i, j - 1} = data{j};
            else
                InitialMatrix{i, j - 1} = num;
            endif

        endfor

    endfor

    fclose(file);
endfunction
