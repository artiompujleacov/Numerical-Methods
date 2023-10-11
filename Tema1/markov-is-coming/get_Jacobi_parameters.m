function [G, c] = get_Jacobi_parameters(Link)
    G = Link(1:end - 2, 1:end - 2);
    c = Link(1:end - 2, end - 1);
endfunction
