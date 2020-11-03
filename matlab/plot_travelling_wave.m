function plot_travelling_wave(x, y, H1, H2)

    plot(x, H1 + y(1:(end-1)/2), 'k', x, H2 + y((end-1)/2+1:end-1),'k');
    fprintf("Wavespeed: %e\n", y(end));

    xlabel('$x$');
    ylabel('$y$');
    axis([0,inf,0,1]);
end
