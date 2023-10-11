function [path] = heuristic_greedy (start_position, probabilities, Adj)
    already = false(1, size(Adj, 1));
    path = [start_position];
    already(start_position) = true;

    while path
        current_pos = path(end);

        if current_pos == size(Adj, 1) - 1
            break;
        endif

        not_yet = find(Adj(current_pos, :) &~already);
        not_yet = not_yet(not_yet ~= size(Adj, 1));

        [~, idx] = max(probabilities(not_yet));
        next_pos = not_yet(idx);
        already(next_pos) = true;
        path(end + 1) = next_pos;
    endwhile

endfunction
