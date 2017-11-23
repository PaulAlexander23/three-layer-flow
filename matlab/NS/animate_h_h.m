function animate_h_h( y, t, H1, H2, m2, m3, s1, s2, Q, c )
    %animate_interfaces Animation of the interfaces
    if nargin < 6
        c = 1;
    end
    
    
    
    %plot_type_for_all_h(H1,H2,m2,m3,Q)
    plot_dispersion_relation_varying_h(m2,m3,s1,s2,Q);
    hold on
    plot_h_h_space(y(:,1),H1,H2);
    
    pause(1)
    
    for tI = 2:10:length(t)
        hold off
        plot_dispersion_relation_varying_h(m2,m3,s1,s2,Q);
        hold on
        plot_h_h_space(y(:,tI),H1,H2);
        
        pause(c*(t(tI)-t(tI-1)))
    end
end