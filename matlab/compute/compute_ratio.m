function [ r ] = compute_ratio( k, H1, H2, m2, m3, s1, s2, Q )
    %compute_ratio Computes the some ratio
    %   Used to studied the phase of the eigenfunctions
    
    M = -1i*k*compute_g_linear(H1, H2, m2, m3, Q) - ...
        k^4*compute_f_linear(H1, H2, m2, m3, s1, s2);
    e = compute_dispersion_relation(k, H1, H2, m2, m3, s1, s2, Q);
    
    r = (e(1)-M(1,1))/(M(1,2));
    
end

