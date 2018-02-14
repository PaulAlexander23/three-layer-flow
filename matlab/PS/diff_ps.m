<<<<<<< Updated upstream
function dy = diff_ps(y, degree, suppression)
    %DIFF_PSEUDO_SPECTRAL Uses the pseudo-spectral method to differentiate
    %   Detailed explanation goes here
    if nargin < 3
       suppression = 1e-13;
    end
    
    % Transform into fourier space
    yF = fft(y);
    
    N = size(yF,1)/2;
    
    % Determine k in matlab form
    %k = fftshift([0,-N+1:N-1])';
    k = [0:N-1, 0, 1-N:-1]';
    
    % Prior suppression
    yF(abs(yF)<suppression) = 0;
    
    % Apply pseudo-spectral differentiation
    dyF = (1i*k).^degree.*yF;
    
    % Posterior suppression
    % dyF(abs(dyF) < suppression*N*2) = 0 ;
    % dyF(abs(dyF) < suppression*max(abs(dyF))) = 0 ;
    
    % Transform back into real space
    dy = ifft(dyF);
    
=======
function [dy, y] = diff_ps(y, diffOrders, suppression)
    %DIFF_PSEUDO_SPECTRAL Uses the pseudo-spectral method to differentiate
    %   Detailed explanation goes here
    if nargin < 3
       suppression = 1e-13;
    end
    
    L = size(y,1);
    
    arrayF = zeros(size(y,1),size(y,2),1+length(diffOrders));
    
    % Transform into fourier space
    arrayF(:,:,1) = fft(y);
    
    N = L/2;
    
    % Determine k in matlab form
    %k = fftshift([0,-N+1:N-1])';
    k = [0:N-1, 0, 1-N:-1]';
    
    % Remove zeroth mode
    %arrayF(1,:,1) = 0;
    %arrayF(1 + N,:,1) = 0;
    
    % Prior suppression
    arrayF(abs(arrayF)<suppression) = 0;
    
    % Apply pseudo-spectral differentiation
    for j = 1:length(diffOrders)
        arrayF(:,:,j+1) = (1i*k).^diffOrders(j).*arrayF(:,:,1);
    end
    
    % Posterior suppression
    % arrayF(abs(arrayF) < suppression*N*2) = 0 ;
    % arrayF(abs(arrayF) < suppression*max(abs(arrayF))) = 0 ;
    
    %Transform back into real space
    array = ifft(arrayF);
    
    y = array(:,:,1);
    dy = array(:,:,2:end);
    
>>>>>>> Stashed changes
end