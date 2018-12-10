function plot_dispersion_relation(H1, H2, m2, m3, s1, s2, Q, fk)
    %PLOT_DISPERSION_RELATION Plots the dispersion relation
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
    
    hold on;
    plot(k,real(omega(1,:)),'k-')
    plot(k,real(omega(2,:)),'k--')
    
    xlabel('k')
    ylabel('Re(\omega)')
    
    axis([0 fk 0 inf])
end
