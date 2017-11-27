function plot_dispersion_relation_phase_speed(H1, H2, m2, m3, s1, s2, Q, fk)
    %plot_dispersion_relation_phase_speed Plots the dispersion relation
    %   Plots the dispersion relation for given parameters and a final f
    %   value.
    nf = 101;
    k = linspace(0,fk,nf);
    
    omega = imag(compute_dispersion_relation(k,H1,H2,m2,m3,s1,s2,Q));
        
    plot(k,omega)
    xlabel('k')
    ylabel('Im(\omega)')
    title('The phase speed')
    
end

