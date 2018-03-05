function plot_interfaces(x, y, H1, H2)
    %plot_interfaces Plot the interfaces.
    
    plot(x, H1 + y(1:end/2), x, H2 + y(end/2+1:end))
    xlabel('x')
    ylabel('y')
    title('A plot of the interfaces.')
    axis([0,2*pi,0,1])
end