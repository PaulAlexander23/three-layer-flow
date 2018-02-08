function plot_phase_speed(H1, H2, m2, m3, s1, s2, Q, fk)
    %PLOT_PHASE_SPEED Plots the dispersion relation
    %   Plots the dispersion relation for given parameters and a final f
    %   value.
    if nargin < 8
       fk = 1; 
    end
    
    nf = 101;
    omega = zeros(2,nf);
    k = linspace(0,fk,nf);
    
    for j = 1: nf
       omega(:,j) = compute_dispersion_relation(k(j),H1,H2,m2,m3,s1,s2,Q);
    end
    
    plot(k,imag(omega))
    
    xlabel('k')
    ylabel('Im(\omega)')
    title('The Phase Speed against wave number')
    
end

