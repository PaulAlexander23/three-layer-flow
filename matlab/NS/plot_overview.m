function plot_overview( h, t, x, H1, H2, m2, m3, s1, s2, Q)
    % PLOT_OVERVIEW Calls several plot functions to get an overview of the
    % solution
    
    addpath('../IF')
    
    plot_interfaces(x,h(:,1),H1,H2)
    
    figure
    plot_interfaces(x,h(:,end),H1,H2)
    
    figure
    plot_spectrum(x,h(:,1))
    
    figure
    plot_spectrum(x,h(:,end))
    
    figure
    plot_stability_h(1,m2,m3,s1,s2,Q);
    hold on;
    plot_h_h_space(h(:,end),H1,H2);
    plot(H1,H2,'.r')
    
    figure
    plot_log_int(h,t,x)
    
    figure
    plot_log_l2_norm(h,t,x)
    
    figure
    if length(t)<1000
        plot_stability_regions_in_time(h,t,x,H1,H2,m2,m3,s1,s2,Q)
    else
        plot_stability_regions_in_time(h(:,1:4:end),t(1:4:end),x,H1,H2,m2,m3,s1,s2,Q)
    end
end