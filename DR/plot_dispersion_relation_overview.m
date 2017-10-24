function plot_dispersion_relation_overview(H1, H2, m2, m3, s1, s2, Q, fk)
    %plot_dispersion_relation_overview Plots the dispersion relation and 
    %slices through the parameter space

    figure;
    plot_dispersion_relation(H1, H2, m2, m3, s1, s2, Q, fk);
    
    figure;
    plot_dispersion_relation_varying_h(H1, H2, m2, m3, s1, s2, Q);
    
    figure;
    plot_dispersion_relation_varying_mu(H1, H2, m2, m3, s1, s2, Q);

end

