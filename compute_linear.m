function y = compute_linear( x, t, a, mode,...
        H1, H2, m2, m3, s1, s2, Q)
    %COMPUTE_LINEAR Returns the linear solution for one mode.
    %   x - Column vector, Function evaluation points
    %   t - Row vector, Temporal evaluation points
    %   a - Column vector, Scalings of the eigenfunctions [1;0] for the most
    %   unstable and [0;1] for the most stable
    %   mode - Scalar, the wavenumber to determine the eigenfunctions of
    
    [lambda, V] = compute_dispersion_relation(mode,H1,H2,m2,m3,s1,s2,Q);

    y1 = a(1) * (kron([1;V(2,1)/V(1,1)], exp(1i*mode*x)) * exp(lambda(1) * t));
    y2 = a(2) * (kron([1;V(2,2)/V(1,2)], exp(1i*mode*x)) * exp(lambda(2) * t));
    
    y = real(y1 + y2);
    
end