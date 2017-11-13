function dy = psd(y, degree)
    %DIFF_PSEUDO_SPECTRAL Summary of this function goes here
    %   Detailed explanation goes here
    yF = fft(y);
    N = length(yF)/2;
    k = [0:N-1, 0, 1-N:-1]';
    %k = fftshift([0,-N+1:N-1])';
    dyF = (1i*k).^degree.*yF;
    dy = real(ifft(dyF));
    
end

