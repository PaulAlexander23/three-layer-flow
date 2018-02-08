
H1 = 0.4; H2 = 0.7; m2 = 0.5; m3 = 1; s1 = 1; s2 = 1; Q = 1;


tN = 11;
tL = 1;
t = linspace(0,tL,tN);

xN = 2^7;
xS = 2*pi/xN;
x = linspace(0,2*pi,xN)';

y = [0.2 * cos(x+1); 0.1 * cos(x)];

y1f = fft(y(1:end/2));
y2f = fft(y(1+end/2:end));

N = length(y1f)/2;

k = 1;

% A = [y1f(1+k), y2f(1+k);...
%    y1f(2*N-k+1), y2f(2*N-k+1)]/N;
% a = [y1f(1+k), y2f(1+k)]; % Without complex conjugate
% a = [y1f(1+k), y1f(2*N-k+1)]; % Just top interface

for k = 1:2
    % Isolate kth mode
    a = [y1f(1+k), y2f(1+k)];
    
    % Set up dispersion relation matrix
    M = -1i*k*compute_g_linear(H1, H2, m2, m3, Q) + ...
        k^4*compute_f_linear(H1, H2, m2, m3, s1, s2);
    
    % Compute eigenvalues and eigenfunctions
    [V, lambda] = eig(M,'vector');
    
    % Compute coefficients of the eigenfunctions. THESE SHOULD BE THE SAME
    b = a / V;
    
    % Construct solution in Fourier space
    y1mf = zeros(2*N,tN);
    y2mf = zeros(2*N,tN);
    
    % Coefficients times the appropriate eigenfunction with growth
    y1mf(1+k,:) = b * (V(1,:)' .* exp(lambda * t));
    y2mf(1+k,:) = b * (V(2,:)' .* exp(lambda * t));
    
    % Add complex conjugate
    y1mf(2*N-k+1,:) = conj(y1mf(1+k,:));
    y2mf(2*N-k+1,:) = conj(y2mf(1+k,:));
    
    % Convert back to real space
    y1m = ifft(y1mf);
    y2m = ifft(y2mf);
    
    
    %DEBUG Plot filtered original
    y1ff = zeros(2*N,1);
    y1ff([1+k,2*N-k+1]) = [y1f(1+k), y1f(2*N-k+1)];
    figure;
    plot(x, ifft(y1ff), x, y1m(:,1));
    %figure
    %plot(x, y(1:end/2), x, y1m(:, 1))
    %figure
    %plot(x, y(1+end/2:end), x, y2m(:, 1))
end