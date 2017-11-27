% Script to test the remove of the 0th mode

x = linspace(2*pi/100,2*pi)';

y = [1 + cos(x), 3 - sin(x)];

yf = fft(y);

size(yf)

N = size(yf,1)/2;

k = [0:N-1, 0, 1-N:-1]';

hold on

plot(x, y)

yf(k==0,:) = 0;

y2 = ifft(yf);

plot(x,y2)

figure

plot(x,log10(abs(y2-[cos(x),-sin(x)])))
