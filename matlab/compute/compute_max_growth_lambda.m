function lambda = compute_max_growth_lambda(H1,H2,m2,m3,s1,s2,Q)
    %COMPUTE_MAX_GROWTH_LAMBDA Computes wavelength with the maximum growth.
    
    k = fminunc(@(x) -max(real(compute_dispersion_relation(x,H1,H2,m2,m3,s1,s2,Q))),1);
        
    lambda = 2*pi/k;
    
end