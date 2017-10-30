function plot_overview(h,t,x,Q,H1,H2,m2,m3)
    %PLOT_OVERVIEW Calls several plot functions to get an overview of the
    %solution
    
    plot_interfaces(x,h(:,1),H1,H2)
    
    figure
    plot_interfaces(x,h(:,end),H1,H2)
    
    figure
    plot_surfaces(h,t,x,H1,H2)
    
    figure
    plot_l1_norm(h,t,x)
    
    figure
    plot_log_l2_norm(h,t,x)
    
end

