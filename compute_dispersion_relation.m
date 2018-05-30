function [e, V] = compute_dispersion_relation(k, H1, H2, m2, m3, s1, s2, Q)
    %compute_dispersion_relation Evaluate the dispersion relation at a given
    %vector of k values, returns all eigenvalues
    
    
    M = -1i*k*compute_g(H1, H2, m2, m3, Q) + ...
        k^4*compute_f(H1, H2, m2, m3, s1, s2);
        
    [V, e] = eig(M, 'vector');
    
    [e, I] = sort(e, 'descend', 'ComparisonMethod', 'Real');
    
    V = V(:,I);
    
end