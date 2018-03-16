function [y, lambda] = compute_eigenfunctions( x, a, mode,...
        H1, H2, m2, m3, s1, s2, Q)
    %COMPUTE_EIGENFUNCTIONS Returns the sum of the eigenfunctions given
    %scalings of them
    %   x - Column vector, Function evaluation points
    %   a - Column vector, Scalings of the eigenfunctions [1;0] for the most
    %   unstable and [0;1] for the most stable
    %   mode - Scalar, the wave number to determine the eigenfunctions of
    
    
    [lambda, V] = compute_dispersion_relation(mode,H1,H2,m2,m3,s1,s2,Q);
    
    y = [real(exp(1i*mode*x) * [1,V(1,2)/V(1,1)] * a )',...
            real(exp(1i*mode*x) * [1,V(2,2)/V(2,1)] * a )'];

end