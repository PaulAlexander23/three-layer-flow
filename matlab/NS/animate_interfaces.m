function animate_interfaces( y, t, x, H1, H2, c )
    %animate_interfaces Animation of the interfaces
    if nargin < 6
        c = 1;
    end
    
    axes = [0,x(end),0,1];
    
    plot_interfaces(x,y(:,1),H1,H2);
    axis(axes)
    
    pause(1)
    
    for tI = 2:1:length(t)
        plot_interfaces(x,y(:,tI),H1,H2);        
        axis(axes)
        
        pause(c*(t(tI)-t(tI-1)))
    end
end