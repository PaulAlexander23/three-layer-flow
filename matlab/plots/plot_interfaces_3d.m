function plot_interfaces_3d(y,t,x,H1,H2,trange)
    if nargin<6
       trange = [min(t),max(t)];
    end
    
    tNew = linspace(trange(1),trange(2),500);
    
    [T,X] = meshgrid(tNew,x);
    ynew = regrid(y,t,x,tNew,x);
    
    figure;
    surf(T', X', H1 + ynew(1:end/2,:)','edgecolor','none')
    xlabel('t')
    ylabel('x')
    title('A plot of the lower interface.')
    view([52.5 37.5])
    axis([trange 0 2*pi -inf inf])
    
    figure;
    surf(T', X', H2 + ynew(1+end/2:end,:)','edgecolor','none')
    xlabel('t')
    ylabel('x')
    title('A plot of the upper interface.')
    view([52.5 37.5])
    axis([trange 0 2*pi -inf inf])
    
end