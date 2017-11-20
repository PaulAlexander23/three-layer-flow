function plot_dispersion_relation_overview( H1, H2, m2, m3, s1, s2, Q )
    %plot_dispersion_relation_overview Plots the dispersion relation and
    % slices through the parameter space
    
    subplot(3,2,[1,2])
    plot_dispersion_relation(H1, H2, m2, m3, s1, s2, Q, 2);
    
    subplot(3,2,3)
    plot_dispersion_relation_varying_h(m2, m3, s1, s2, Q);
    hold on
    plot(H1,H2,'xk');
    plot(H1,H2,'ow');
    
    subplot(3,2,4)
    plot_dispersion_relation_varying_m(H1, H2, s1, s2, Q);
    hold on
    plot(m2,m3,'xk');
    plot(m2,m3,'ow');
    
    xL = 2*pi;
    xN = 2^6;
    xS = xL/xN;
    x = linspace(xS,xL,xN)';
    
    y = compute_eigenfunctions(x,H1,H2,m2,m3,s1,s2,Q,(H2-H1)/2,1);
    
    
    subplot(3,2,5)
    plot_interfaces(x,y(:,1),H1,H2)
    title('Most unstable eigenfunction')
    
    subplot(3,2,6)
    plot_interfaces(x,y(:,2),H1,H2)
    title('Most stable eigenfunction')
end

