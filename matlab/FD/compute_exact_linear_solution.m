function [h, x, t] = compute_exact_linear_solution(x, t, k, A, theta, H1, H2, m2, m3, s1, s2, Q)
    %compute_exact_linear_solution Returns the exact linear solution
    %   Uses given wave numbers to calculate the corresponding wave speeds and
    %   growths
    addpath('../DR')
    
    omega = compute_dispersion_relation(k, H1, H2, m2, m3, s1, s2, Q);
    
    h = A .* exp(real(omega(:,1))*t) .* (cos(x + imag(omega(:,1)) .*t + theta));
    
    
end

