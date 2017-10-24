% Driver for the grouping of everything

clear;

Q = 2;
H1 = 0.3;
H2 = 0.7;
m2 = 0.8;
m3 = 1.2;
s1 = 2;
s2 = 2;



t_final = 1;
%t_count = 2^5;
%t = linspace(0,t_final,t_count)';

x_length = 2*pi;
x_count = 2^6;
x_step = x_length/x_count;
x = linspace(x_step, x_length, x_count)';

% Set Up Finite Differences
initialise_finite_differences(length(x),x(2)-x(1),4)

%func = @(t,y) f_linear(y, Q, H1, H2, m2, m3, s1, s2);
func = @(t,y) f_evo(y, Q, H1, H2, m2, m3, s1, s2);
%func = @(t,y) f_flux(y,1,0.5,2);

%inter = i_double_cos(x, 0, 0,0.1,0,x_length);
inter = i_double_rand(x, 0, 0,0.2);

figure
plot_interfaces(x,inter,H1,H2)

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
plot_surfaces(h,t,x,H1,H2)

figure
plot_l1_norm(h,t,x)

figure
plot_log_l2_norm(h,t,x)

figure
plot_regions(h',t,x,m2,m3)