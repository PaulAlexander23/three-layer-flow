function animate_spectrum( y, t, x, c )
    %ANIMATE_SPECTRUM Animation of the spectrum of the interfaces
    if nargin < 4
        c = 1;
    end
    
    plot_spectrum(x,y(:,1));
    
    pause(1)
    
    for tI = 2:length(t)
        plot_spectrum(x,y(:,tI));
        
        pause(c*(t(tI)-t(tI-1)))
    end
end