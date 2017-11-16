
tF = 1000;            % Sampling frequency                    
tS = 1/tF;             % Sampling period       
tN = 1500;             % Length of signal
tL = tN*tS;
t = (0:tN-1)*tS;        % Time vector

y = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t);
y = y + 2*randn(size(t));

figure();
plot(1000*t(1:50),y(1:50))
title('Signal Corrupted with Zero-Mean Random Noise')
xlabel('t (milliseconds)')
ylabel('X(t)')

Y = fft(y);

YF = abs(Y/tN);
YFH = YF(1:tN/2+1);
YFH(2:end-1) = 2*YFH(2:end-1);

k = tF*(0:(tN/2))/tN;
figure();
plot(k,YFH) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

Y = fft(y);
YF = abs(Y/tN);
YFH = YF(1:tN/2+1);
YFH(2:end-1) = 2*YFH(2:end-1);

figure();
plot(k,YFH) 
title('Single-Sided Amplitude Spectrum of S(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')