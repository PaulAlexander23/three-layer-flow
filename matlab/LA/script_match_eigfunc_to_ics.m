
tN = 11;
tL = 1;
t = linspace(0,tL,tN);

xN = 2^5;
xS = 2*pi/xN;
x = linspace(xS,2*pi,xN)';

y = [0.2 * cos(x+1); 0.1 * cos(x)];

y1f = fft(y(1:end/2));
y2f = fft(y(1+end/2:end));

N = length(y1f)/2;

k = 1;

% A = [y1f(1+k), y2f(1+k);...
%    y1f(2*N-k+1), y2f(2*N-k+1)]/N;
a = [y1f(1+k), y2f(1+k)]; % Without complex conjugate
% a = [y1f(1+k), y1f(2*N-k+1)]; % Just top interface


H1 = 0.4; H2 = 0.7; m2 = 0.5; m3 = 1; s1 = 1; s2 = 1; Q = 1;

M = -1i*k*compute_g_linear(H1, H2, m2, m3, Q) + ...
    k^4*compute_f_linear(H1, H2, m2, m3, s1, s2);

[V, lambda] = eig(M,'vector');

b = a / V;

y1mf = zeros(2*N,tN);

y1mf(1+k,:) = b * (V(1,:)' .* exp(lambda * t));

y1mf(2*N-k+1,:) = conj(y1mf(1+k,:));

y1m = ifft(y1mf);

plot(x,y(1:end/2),x,y1m)

% eta1 = real( b * V  );

% plot(x, y(1:end/2), x, eta1, x, sum(eta1,2))
