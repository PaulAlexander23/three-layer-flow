function plot_interfaces_with_stability(x, y, H1, H2, m2, m3, s1, s2, Q)
    %plot_interfaces Plot the interfaces.
    
    subplot(8,1,[1,7]);
    plot(x, H1 + y(1:end/2), 'k', x, H2 + y(end/2+1:end),'k')
    ylabel('$y$')
    %title('A plot of the interfaces.')
    axis([0,inf,0,1])
    set(gca,'xtick',[]);

    [unstable, elliptic] = compute_stability_h(y, H1, H2, m2, m3, s1, s2, Q);

    subplot(8,1,8);
    imagesc([x(1)/2,x(end)-x(1)/2], [0.5,0.5], (unstable'+elliptic')/2);
    set(gca,'YDir','normal');
    colormap([1   1   1
              0.5 0.5 0.5
              0   0   0])
    caxis([0 1]);
    axis([0,inf,0,1])
    set(gca,'ytick',[]);
    xlabel('$x$')
end
