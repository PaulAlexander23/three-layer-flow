function FF = rhs_ps_f(t, x, yf, func, diffOrders)
    % Right hand side in Fourier space
    
    nOI = size(yf,1)/size(x,1); % Number of interfaces
    
    yCell = cell(nOI,1);
    for j = 1:nOI
        yCell{j} = ifft(yf(1 + end*(j-1)/nOI:end*j/nOI,:));
    end
    
    dyCell = cell(max(diffOrders),nOI);
    
    N = size(yf,1)/2/nOI;
    
    k = [0:N-1, 0, 1-N:-1]';
    
    for degree = diffOrders
        for j = 1:nOI
            dyCell{degree,j} = ifft((1i*k).^degree.*yf(1 + end*(j-1)/nOI:end*j/nOI,:));
        end
    end
    
    F = func(t, x, yCell, dyCell);
    
    FF = fft(F);
    
    % Remove changes in mode 0 as this is conserved
    % FF(k==0,:) = 0;
    
    
end