function dy = diff_ps(y, degree, suppression)
    %DIFF_PSEUDO_SPECTRAL Summary of this function goes here
    %   Detailed explanation goes here
    if nargin < 3
       suppression = 0; 
    end
    
    yF = fft(y);
    
    yF(abs(yF)<1e-12) = 0;
    
    N = size(yF,1)/2;
    
    %k = fftshift([0,-N+1:N-1])';
    k = [0:N-1, 0, 1-N:-1]';
    
    dyF = (1i*k).^degree.*yF;
    
    % Post suppression
    % dyF(abs(dyF) < suppression*N*2) = 0 ;
    % dyF(abs(dyF) < suppression*max(abs(dyF))) = 0 ;
    
    dy = real(ifft(dyF));
    
end

