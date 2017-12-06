function plot_dispersion_relation_m_p(H1, H2, m2, m3, s1, s2, Q, fk)
    %plot_dispersion_relation Plots the dispersion relation
    %   Plots the dispersion relation for given parameters and a final f
    %   value.
    nf = 101;
    k = linspace(0,fk,nf);
    
    % Uncomment for max only
    %omega = max(real(compute_dispersion_relation(k,H1,H2,m2,m3,s1,s2,Q)),[],2);
    omega = real(compute_dispersion_relation(k,H1,H2,m2,m3,s1,s2,Q));
    omega = [max(omega,[],2),min(omega,[],2)];
    
    omegaFlux = real(compute_dispersion_relation(k,H1,H2,m2,m3,0,0,Q));
    omegaFlux = [max(omegaFlux,[],2),min(omegaFlux,[],2)];
    
    omega = omega - omegaFlux;
    
    plot(k,omega)
    %axis([0, fk, -max(max(omega)), max(max(omega))])
    xlabel('k')
    ylabel('Re(\omega)')
    title('The Dispersion Relation')
    
end