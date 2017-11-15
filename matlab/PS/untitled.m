

xL = 2*pi;
xN = 2^12;
xS = xL/xN;
x = linspace(xS/2,xL-xS/2,xN)';
N = xN/2;
k = [0:N-1, 0, 1-N:-1]';

y = cos(x);
dy = -cos(x);
dY = ifft((1i*k).^2.*fft(y));

fnew_var = fft(dY);
fnew_var(abs(fnew_var) < 10)= 0 ;
new_var = real(ifft(fnew_var));


plot(real(fftshift(fft(dY))))
figure
plot(imag(fftshift(fft(dY))))
figure
plot(real(fftshift(fft(new_var))))
figure
plot(imag(fftshift(fft(new_var))))


figure
plot(x,dy,x,dY,x,new_var)

max(abs(dy-dY))
max(abs(dy-new_var))