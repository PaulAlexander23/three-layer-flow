function plot_h_h_space( y, H1, H2)
    %plot_interfaces Plot the interfaces.
    
    plot( H1 + y(1:end/2), H2 + y(end/2+1:end));
    xlabel('h_1')
    ylabel('h_2')
    %title('A plot of the interfaces against each other')
end