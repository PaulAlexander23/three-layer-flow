co% Script to test the remove of the 0th mode

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

%%

H1 = 0.4; H2 = 0.7; m2 = 0.5; m3 = 1.0; s1 = 1.0; s2 = 1.0; Q = 1.0;

xN = 2^7;
x = linspace(2*pi/xN,2*pi,xN)';
y = i_double_rand_fixed(x,0.1);

fy = rhs_ps(0,x,y,...
    @(t, x, y, dy) compute_evolution(y, dy, H1, H2, m2, m3, s1, s2, Q),...
    [1,3,4]);

fyf = fft(fy);

N = size(fyf,1)/2;

k = [0:N-1, 0, 1-N:-1]';

fyf(k == 0)

%%

[h,x,t] = compute_numerical_solution(0.1,0.5,0.5,2,1,1,1,@(x) i_double_cos(x,0.01,1),0.1,2*pi,2^7,1e-7);

y = h(:,end);

yf = fft(y);

N = size(yf,1)/2;

k = [0:N-1, 0, 1-N:-1]';

yf(k == 0)

plot_l1_norm(h,t,x)
