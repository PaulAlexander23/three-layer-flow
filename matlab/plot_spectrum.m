function plot_spectrum(x, y)
    %PLOT_SPECTRUM Plot the spectrum of the interfaces.
    
    nOI = size(y,1)/length(x);
    
    for j = 1:nOI
        
        yf = fft(y((1 + (j-1)*end/nOI):(j*end/nOI)));
        
        N = size(yf,1)/2;
        
        P2 = abs(yf/N);
        P1 = P2(1:N + 1);
        
        k = 0:N;
        
        plot(k, log10(P1))
        hold on
    end
    
    xlabel('Wave number, $k$')
    ylabel('Amplitude')
    hold off
end

