function [Adj] = get_adjacency_matrix(Labyrinth)
    [m, n] = size(Labyrinth);
    num_elements = m * n + 2;
    Adj = sparse(num_elements, num_elements);

    for i = 1:m

        for j = 1:n
            walls = bitand(Labyrinth(i, j), 15);

            if bitand(walls, 8) == 0

                if i == 1
                    Adj((i - 1) * n + j, num_elements - 1) = 1;
                else
                    Adj((i - 1) * n + j, (i - 2) * n + j) = 1;
                endif

            endif

            if bitand(walls, 4) == 0

                if i == m
                    Adj((i - 1) * n + j, num_elements - 1) = 1;
                else
                    Adj((i - 1) * n + j, i * n + j) = 1;
                endif

            endif

            if bitand(walls, 2) == 0

                if j == n
                    Adj((i - 1) * n + j, num_elements) = 1;
                else
                    Adj((i - 1) * n + j, (i - 1) * n + j + 1) = 1;
                endif

            endif

            if bitand(walls, 1) == 0

                if j == 1
                    Adj((i - 1) * n + j, num_elements) = 1;
                else
                    Adj((i - 1) * n + j, (i - 1) * n + j - 1) = 1;
                endif

            endif

        endfor

    endfor

    Adj(num_elements - 1, num_elements - 1) = 1;
    Adj(num_elements, num_elements) = 1;
endfunction
