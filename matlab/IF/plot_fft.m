function plot_fft(y)
    %plot_fft Plot the fft.
    
    yf = fft(y);% fft(y(1+end/2:end))];
    
    N = size(yf,1)/2;
    
    P2 = abs(yf /2/N);
    P1 = P2(1:N + 1);
    P1(2:end-1) = 2*P1(2:end-1);

    k = 0:N;
    size(P1)
    hold on;
    plot(k, P1)
    

end

