function [Labyrinth] = parse_labyrinth(file_path)
    file = fopen(file_path, 'r');
    rows = fscanf(file, '%d', 1);
    cols = fscanf(file, '%d', 1);
    Labyrinth = fscanf(file, '%d', [cols, rows])';
    fclose(file);
endfunction
