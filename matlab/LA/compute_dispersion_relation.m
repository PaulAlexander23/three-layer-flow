function [e, V] = compute_dispersion_relation(k, H1, H2, m2, m3, s1, s2, Q)
    %compute_dispersion_relation Evaluate the dispersion relation at a given
    %vector of k values, returns all eigenvalues
    
    
    M = -1i*k(ik)*compute_g(H1, H2, m2, m3, Q) + ...
        k(ik)^4*compute_f(H1, H2, m2, m3, s1, s2);
        
    [V, e] = eig(M, 'vector');
    
    [e, I] = sort(e,2,'descend','ComparisonMethod','real');
    
    V = V(:,I);
    
end