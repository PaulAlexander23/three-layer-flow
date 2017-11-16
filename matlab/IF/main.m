% Main script for the interfaces and functions section

%% Examples

H1 = 0.4;
H2 = 0.7;
m2 = 0.5;
m3 = 1.2;
s1 = 1;
s2 = 1;
Q = 1;

xL = 2*pi;
xN = 100;
xS = xL/xN;
x = linspace(xS,xL,xN)';


plot_steady_state(H1,H2,m2,m3,Q)


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
plot_fft(i_single_rand_fixed(x,0.1));

%% Code used in report

