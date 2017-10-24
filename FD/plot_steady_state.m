function plot_steady_state(H1, H2, m2, m3, Q)
    %plot_steady_state A short function to plot the steady state solution.
    
    y1 = linspace(0,H1,41);
    y2 = linspace(H1,H2,41);
    y3 = linspace(H2,1,41);
    
    u1 = -6 .* m2 .* m3 .* (-m3 .* (m2 - 1) .* H1 .^ 2 + y1 .* m3 .* (m2 - 1) .* H1 + (m2 - m3) .* H2 .^ 2 - y1 .* (m2 - m3) .* H2 + m2 .* (y1 - 1)) .* Q .* y1 / (m3 .^ 2 .* (m2 - 1) .^ 2 .* H1 .^ 4 - 4 .* m3 .* ((m2 - m3) .* H2 - m2) .* (m2 - 1) .* H1 .^ 3 + 6 .* m3 .* ((m2 - m3) .* H2 .^ 2 - m2) .* (m2 - 1) .* H1 .^ 2 - 4 .* m3 .* (m2 - 1) .* ((m2 - m3) .* H2 .^ 3 - m2) .* H1 + (m2 - m3) .^ 2 .* H2 .^ 4 - 4 .* m2 .* (m2 - m3) .* H2 .^ 3 + 6 .* m2 .* (m2 - m3) .* H2 .^ 2 - 4 .* m2 .* (m2 - m3) .* H2 + m2 .^ 2);
    u2 = -6 .* (-(m2 - 1) .* ((m2 - m3) .* H2 + y2 .* m3 - m2) .* H1 .^ 2 + (m2 - 1) .* ((m2 - m3) .* H2 .^ 2 + y2 .^ 2 .* m3 - m2) .* H1 - ((-m2 + m3) .* H2 .^ 2 + y2 .* (m2 - m3) .* H2 - m2 .* (y2 - 1)) .* y2) .* m3 .* Q / (m3 .^ 2 .* (m2 - 1) .^ 2 .* H1 .^ 4 - 4 .* m3 .* ((m2 - m3) .* H2 - m2) .* (m2 - 1) .* H1 .^ 3 + 6 .* m3 .* ((m2 - m3) .* H2 .^ 2 - m2) .* (m2 - 1) .* H1 .^ 2 - 4 .* m3 .* (m2 - 1) .* ((m2 - m3) .* H2 .^ 3 - m2) .* H1 + (m2 - m3) .^ 2 .* H2 .^ 4 - 4 .* m2 .* (m2 - m3) .* H2 .^ 3 + 6 .* m2 .* (m2 - m3) .* H2 .^ 2 - 4 .* m2 .* (m2 - m3) .* H2 + m2 .^ 2);
    u3 = -6 .* m2 .* Q .* (y3 - 1) .* (-m3 .* (m2 - 1) .* H1 .^ 2 + m3 .* (m2 - 1) .* (y3 + 1) .* H1 + (m2 - m3) .* H2 .^ 2 - (m2 - m3) .* (y3 + 1) .* H2 + m2 .* y3) / (m3 .^ 2 .* (m2 - 1) .^ 2 .* H1 .^ 4 - 4 .* m3 .* ((m2 - m3) .* H2 - m2) .* (m2 - 1) .* H1 .^ 3 + 6 .* m3 .* ((m2 - m3) .* H2 .^ 2 - m2) .* (m2 - 1) .* H1 .^ 2 - 4 .* m3 .* (m2 - 1) .* ((m2 - m3) .* H2 .^ 3 - m2) .* H1 + (m2 - m3) .^ 2 .* H2 .^ 4 - 4 .* m2 .* (m2 - m3) .* H2 .^ 3 + 6 .* m2 .* (m2 - m3) .* H2 .^ 2 - 4 .* m2 .* (m2 - m3) .* H2 + m2 .^ 2);
    
    hold on;
    plot(u1,y1)
    plot(u2,y2)
    plot(u3,y3)
    plot(get(gca,'xlim'),[0,0],'k')
    plot(get(gca,'xlim'),[H1,H1],'k')
    plot(get(gca,'xlim'),[H2,H2],'k')
    plot(get(gca,'xlim'),[1,1],'k')
    xlabel('u_i')
    ylabel('y')
end