function plot_dispersion_relation_m_p(H1, H2, m2, m3, s1, s2, Q, fk)
    %PLOT_DISPERSION_RELATION_M_P Plots the Madja-Pego part of the dispersion relation
    %   Plots the dispersion relation for given parameters and a final f
    %   value.
    if nargin < 8
       fk = 1; 
    end
    
    nf = 101;
    omega = zeros(2,nf);
    k = linspace(0,fk,nf);
    
    for j = 1: nf
       omega(:,j) = compute_dispersion_relation(k(j),H1,H2,m2,m3,s1,s2,Q)-...
           compute_dispersion_relation(k(j),H1,H2,m2,m3,0,0,Q);
    end
    
    plot(k,real(omega))
    
    xlabel('k')
    ylabel('Re(\omega)')
    title('The Dispersion Relation')
    
end