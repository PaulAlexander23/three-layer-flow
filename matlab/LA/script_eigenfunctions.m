


H1 = 0.5;
H2 = 0.6;
m2 = 0.3;
m3 = 1;
s1 = 1;
s2 = 1;
Q = 1;

k = 1;
M = (-1i*k*compute_g_linear(H1, H2, m2, m3, Q) + ...
     k^4*compute_f_linear(H1, H2, m2, m3, s1, s2));

[V, D] = eig(M);

lambda = diag(D);


xL = 2*pi;
xN = 2^8;
xS = xL/xN;
x = linspace(xS,xL,xN)';


tL = 2^5;
tN = 2^7;
tS = tL/tN;
t = linspace(tS,tL,tN);

A = 0.05; % Eigenfunction coefficients
B = 0.0; % For eigenfunctions set to [1,0] or [0,1] (scale by amplitude too)

eta1 = real(exp(1i*k*x) * V(1,:) * ([A;B] .* exp(lambda * t)))';
eta2 = real(exp(1i*k*x) * V(2,:) * ([A;B] .* exp(lambda * t)))';

[X,T] = meshgrid(x,t);

%%

y1f = zeros(xN,1);
y1f([1+k, 2*N-k+1]) = [V(1,1),V(1,1)']*xN/2;
y1 = ifft(y1f);

plot(x,y1)
hold on;
%%
plot_interfaces(x,[eta1(1,:)';eta2(1,:)'],H1,H2);


%%
figure
hold on
surface(X,T,H1+eta1,'EdgeColor', 'none');
surface(X,T,H2+eta2,'EdgeColor', 'none');
%%
figure
animate_interfaces([eta1';eta2'],t,x,H1,H2)