function dy = diff_ps(y, degree, suppression)
    %DIFF_PSEUDO_SPECTRAL Summary of this function goes here
    %   Detailed explanation goes here
    if nargin < 3
       suppression = 0; 
    end
    
    yF = fft(y);
    N = length(yF)/2;
    k = fftshift([0,-N+1:N-1])';
    dyF = (1i*k).^degree.*yF;
    
    dyF(dyF < suppression*N*2)= 0 ;
    
    dy = real(ifft(dyF));
    
end

