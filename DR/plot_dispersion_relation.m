function plot_dispersion_relation(H1, H2, m2, m3, s1, s2, Q, fk)
    %plot_dispersion_relation Plots the dispersion relation
    %   Plots the dispersion relation for given parameters and a final f
    %   value.
    nf = 101;
    k = linspace(0,fk,nf);
    
    omega = max(real(compute_dispersion_relation(k,H1,H2,m2,m3,s1,s2,Q)),[],2);
        
    plot(k,omega)
    xlabel('k')
    ylabel('Re(\omega)')
    title('Dispersion Relation')
    
end

