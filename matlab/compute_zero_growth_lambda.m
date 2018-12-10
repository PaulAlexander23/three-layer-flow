function lambda = compute_zero_growth_lambda(H1,H2,m2,m3,s1,s2,Q)
    %COMPUTE_ZERO_GROWTH_LAMBDA Computes the nontrivial wavelength with zero growth.
    
    k = fsolve(@(x) max(real(compute_dispersion_relation(x,H1,H2,m2,m3,s1,s2,Q))),100);
    
    lambda = 2*pi/k;
end