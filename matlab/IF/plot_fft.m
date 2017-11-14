function plot_fft(x, y, H1, H2)
    %plot_interfaces Plot the interfaces.
    Y1 = fft(y(1:end/2));
    Y2 = fft(y(1:end/2));
    
    L1 = length(Y1);
    L2 = length(Y2);
    
    P2 = abs(Y1/L1);
    P1 = P2(1:L1/2+1);
    P1(2:end-1) = 2*P1(2:end-1);

    hold on;
    plot(P1)
    

end

