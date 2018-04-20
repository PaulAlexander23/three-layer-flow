% Testing and examples for the interfaces and functions section

H1 = 0.4;
H2 = 0.7;
m2 = 0.5;
m3 = 1.2;
s1 = 1;
s2 = 1;
Q = 1;

x = linspace(2*pi/100,2*pi)';
t = linspace(0,10);
S = 0.1; w = 1; p = 0.1;
rhs = compute_manufacted_rhs(x,t,S,w,p,H1,H2,m2,m3,s1,s2,Q);


%% plots
plot_steady_state(H1,H2,m2,m3,Q)

xL = 2*pi;
xN = 2^8;
xS = xL/xN;
x = linspace(xS,xL,xN)';

figure
subplot(2,2,1)
hold on
plot(x,i_single_cos(x,0.1,0));
plot(x,i_single_cos(x,0.1,pi/8));
plot(x,i_single_cos(x,0.12,pi/2));

subplot(2,2,2)
hold on
plot(x,i_single_rand(x,0.1));
plot(x,i_single_rand(x,0.1));

subplot(2,2,[3 4])
plot(x,i_single_rand_fixed(x,0.1));


figure
subplot(2,2,1)
hold on
plot_interfaces(x,i_double_cos(x,0.1,pi/3),H1,H2);

subplot(2,2,2)
hold on
plot_interfaces(x,i_double_rand(x,0.1),H1,H2);
plot_interfaces(x,i_double_rand(x,0.12),H1,H2);

subplot(2,2,[3 4])
plot_interfaces(x,i_double_rand_fixed(x,0.1),H1,H2);


figure
subplot(2,2,1)
plot_fft(x, i_single_cos(x,0.1,0));
subplot(2,2,2)
plot_fft(x, i_single_rand_fixed(x,0.1));
subplot(2,2,[3 4])
plot_fft(x, i_double_rand_fixed(x,0.1));

