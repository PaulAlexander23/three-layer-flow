

xL = 2*pi;
xN = 2^12;
xS = xL/xN;
x = linspace(xS/2,xL-xS/2,xN)';
N = xN/2;
k = [0:N-1, 0, 1-N:-1]';

y = cos(x);

dy = ifft((1i*k).^4.*fft(y));

fnew_var = fft(dy);
fnew_var(fnew_var < 10)= 0 ;
new_var = real(ifft(fnew_var));


plot(real(fftshift(fft(dy))))
figure
plot(imag(fftshift(fft(dy))))
figure
plot(real(fftshift(fft(new_var))))
figure
plot(imag(fftshift(fft(new_var))))


figure
plot(x,y,x,dy,x,new_var)

max(abs(dy-cos(x)))
