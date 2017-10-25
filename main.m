% Driver for the grouping of everything

clear;
close;

addpath('DR','FD','NS')

Q = 2;
H1 = 0.4;
H2 = 0.7;
m2 = 0.5;
m3 = 1.4;
s1 = 0.1;
s2 = 0.1;

%%

plot_dispersion_relation_overview(H1,H2,m2,m3,s1,s2,Q,1);

%%

t_final = 10;
x_length = 2*pi;
x_count = 2^8;
x_step = x_length/x_count;
x = linspace(x_step, x_length, x_count)';

% Set Up Finite Differences
initialise_finite_differences(length(x),x(2)-x(1),4)

%func = @(t,y) f_linear(y, Q, H1, H2, m2, m3, s1, s2);
func = @(t,y) f_evolution(y, Q, H1, H2, m2, m3, s1, s2);

inter = i_double_cos(x, 0, 0, 0.05, 0, x_length);
%inter = i_double_rand(x, 0, 0,0.2);

figure
plot_steady_state(H1,H2,m2,m3,Q)

%pause
%%
%options = odeset('RelTol',1e-8,'AbsTol',1e-10);

tic
[t, h] = ode15s(func, [0,t_final], inter);%, options);
toc

h = h';

%%
figure
plot_overview(h,t,x,H1,H2,m2,m3)