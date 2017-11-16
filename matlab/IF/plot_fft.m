function plot_fft(x, y)
    %plot_fft Plot the fft.
    
    nOI = size(y,1)/length(x);
    
    hold on
    
    for j = 1:nOI
        
        yf = fft(y((1 + (j-1)*end/nOI):(j*end/nOI)));
        
        N = size(yf,1)/2;
        
        P2 = abs(yf/N);
        P1 = P2(1:N + 1);
        
        k = 0:N;
        
        plot(k, P1)
        
    end
    
    title('The fourier transform of the interfaces.')
    xlabel('Wave number, k')
    ylabel('Amplitude')
    
end

