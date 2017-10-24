function e = compute_dispersion_relation(k, H1, H2, m2, m3, s1, s2, Q)
    %compute_dispersion_relation Evaluate the dispersion relation at a given
    %vector of k values, returns all eigenvalues
    
    e = zeros(length(k),2);
    for ik = 1:length(k)
        M = -1i*k(ik)*compute_g_linear(H1, H2, m2, m3, Q) + ...
            k(ik)^4*compute_f_linear(H1, H2, m2, m3, s1, s2);
        e(ik,:) = eig(M);
    end
    
end