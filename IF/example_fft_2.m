
xN = 1000;
xL = 2*pi;
xS = xL/xN;

x = linspace(xS,xL,xN);

y = cos(x);


figure();
plot(x,y)

for j = 1:4
    yF = fft(y);
    
    k = fftshift([0,1-length(yF)/2:length(yF)/2-1]);
    dyF = (1i*k).^j.*yF;
    
    dy = ifft(dyF);
    
    figure();
    plot(x,dy)
end



