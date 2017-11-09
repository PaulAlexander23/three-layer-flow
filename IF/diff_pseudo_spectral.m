function dy = diff_pseudo_spectral(y, degree)
    %DIFF_PSEUDO_SPECTRAL Summary of this function goes here
    %   Detailed explanation goes here
    fy = fft(y);
    k = 1:length(fy);
    fdy = (1i*k.^degree)*fy; % What is k?
    dy = ifft(fdy);
    
end

