% Comment

xL = 2*pi;
xN = 2^12;
xS = xL/xN;
x = linspace(xS/2,xL-xS/2,xN)';
N = xN/2;
k = [0:N-1, 0, 1-N:-1]';

y = cos(x);


plot(log10(abs(fftshift(fft(y)))));

%% Exact
dy = cos(x);

%% No filtering
dY = ifft((1i*k).^4.*fft(y));

plot(real(fftshift(fft(dY))))
figure
plot(imag(fftshift(fft(dY))))

%% Pre filter

yF = fft(y);
yF(abs(yF)<1e-12) = 0;
yD2 = ifft((1i*k).^4.*yF);

plot(abs(fftshift(fft(yD2))));
% 
% plot(x,dy,x,yD2);
% figure
% plot(x,log10(abs(dy-yD2)));
%% Post filter

fnew_var = fft(dY);
fnew_var(abs(fnew_var) < 10)= 0 ;
new_var = real(ifft(fnew_var));




figure
plot(real(fftshift(fft(new_var))))
figure
plot(imag(fftshift(fft(new_var))))


figure
plot(x,dy,x,dY,x,new_var)

max(abs(dy-dY))
max(abs(dy-new_var))