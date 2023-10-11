function [Link] = get_link_matrix(Labyrinth)
    [m, n] = size(Labyrinth);
    num_elements = m * n + 2;
    Link = sparse(num_elements, num_elements);

    for i = 1:m

        for j = 1:n
            north = bitand(Labyrinth(i, j), 8) > 0;
            south = bitand(Labyrinth(i, j), 4) > 0;
            east = bitand(Labyrinth(i, j), 2) > 0;
            west = bitand(Labyrinth(i, j), 1) > 0;
            num_paths = 0;

            if ~north
                num_paths = num_paths + 1;
            endif

            if ~south
                num_paths = num_paths + 1;
            endif

            if ~east
                num_paths = num_paths + 1;
            endif

            if ~west
                num_paths = num_paths + 1;
            endif

            if ~north

                if i == 1
                    Link((i - 1) * n + j, num_elements - 1) = 1 / num_paths;
                else
                    Link((i - 1) * n + j, (i - 2) * n + j) = 1 / num_paths;
                endif

            endif

            if ~south

                if i == m
                    Link((i - 1) * n + j, num_elements - 1) = 1 / num_paths;
                else
                    Link((i - 1) * n + j, i * n + j) = 1 / num_paths;
                endif

            endif

            if ~east

                if j == n
                    Link((i - 1) * n + j, num_elements) = 1 / num_paths;
                else
                    Link((i - 1) * n + j, (i - 1) * n + j + 1) = 1 / num_paths;
                endif

            endif

            if ~west

                if j == 1
                    Link((i - 1) * n + j, num_elements) = 1 / num_paths;
                else
                    Link((i - 1) * n + j, (i - 1) * n + j - 1) = 1 / num_paths;
                endif

            endif

        endfor

    endfor

    Link(num_elements - 1, num_elements - 1) = 1;
    Link(num_elements, num_elements) = 1;
endfunction
