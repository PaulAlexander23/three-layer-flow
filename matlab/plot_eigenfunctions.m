function plot_eigenfunctions(a, k, H1, H2, m2, m3, s1, s2, Q)
    
    x = linspace(0,2*pi,100)';
    
    y = compute_eigenfunctions(x,a,k,H1,H2,m2,m3,s1,s2,Q);
    
    ymin = min(min(y,[],'all'),-1);
    ymax = max(max(y,[],'all'),1);
    
    subplot(2,1,1);
    plot(x,y(1+end/2:end,1),'k',x,y(1+end/2:end,2),'k--');
    
    ylabel('$\eta_2$');
    axis([0,2*pi,ymin,ymax])
    prettyPlot()
    xticks([0,2,4,6]);
    yticks([-1,0,1]);
    
    subplot(2,1,2);
    plot(x,y(1:end/2,1),'k');
    axis([0,2*pi,ymin,ymax])
    prettyPlot()
    xticks([0,2,4,6]);
    yticks([-1,0,1]);
    
    xlabel('$x$');
    ylabel('$\eta_1$');
end
