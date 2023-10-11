function [Y, InitialMatrix] = parse_csv_file(file_path)
    f = fopen(file_path, 'r');
    row = 1;

    fgetl(f);

    while true

        currentline = fgetl(f);

        if currentline == -1
            break;
        endif

        line_elements = strsplit(currentline, ',');

        Y(row) = str2double(line_elements{1});

        for j = 2:length(line_elements)

            nr = str2double(line_elements{j});

            if isnan(nr)
                InitialMatrix{row, j - 1} = line_elements{j};
            else
                InitialMatrix{row, j - 1} = nr;
            endif

        endfor

        row++;
    endwhile

    Y = Y';

    fclose(f);
endfunction
