function y = compute_eigenfunctions( x, H1, H2, m2, m3, s1, s2, Q, amplitude, mode)
    
    M = (-1i*mode*compute_g_linear(H1, H2, m2, m3, Q) + ...
        mode^4*compute_f_linear(H1, H2, m2, m3, s1, s2));
    
    [V, D] = eig(M);
    
    A = amplitude; % Eigenfunction coefficients
    B = 0.0; % For eigenfunctions set to [1,0] or [0,1] (scale by amplitude too)
    
    eta1 = [real(exp(1i*mode*x) * V(1,:) * [A;B] )',...
            real(exp(1i*mode*x) * V(2,:) * [A;B] )'];
    
    A = 0.0;
    B = amplitude;
    
    eta2 = [real(exp(1i*mode*x) * V(1,:) * [A;B] )',...
            real(exp(1i*mode*x) * V(2,:) * [A;B] )'];
    
    if real(D(1,1))>real(D(2,2))
        y = [eta1',eta2'];
    else
        y = [eta2',eta1'];
    end
end