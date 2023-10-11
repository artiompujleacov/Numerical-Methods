function [x, err, steps] = perform_iterative(G, c, x0, tol, max_iter)
    x = x0;
    err = tol + 1;
    steps = 0;

    while err > tol && steps < max_iter
        x_prev = x;
        x = G * x_prev + c;
        err = norm(x - x_prev);
        steps++;
    endwhile

endfunction
