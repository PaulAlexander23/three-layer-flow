% Driver for the grouping of everything

%clear;
close all;

addpath('DR','FD','NS')

Q = 1;
H1 = 0.4;
H2 = 0.5;
m2 = 1.5;
m3 = 2;
s1 = 1;
s2 = 1;

%%
omega = compute_dispersion_relation(1,H1,H2,m2,m3,s1,s2,Q)';
fprintf('Dispersion Relation: w+(1) = %f%+fi, w-(1) = %f%+fi\n',omega(1),omega(1)/1i,omega(2),omega(2)/1i);

%plot_dispersion_relation_overview(H1,H2,m2,m3,s1,s2,Q,2);


%%

t_final = 1000;
t_count = 2^4;
x_length = 2*pi;
x_count = 2^6;
x_step = x_length/x_count;
x = linspace(x_step, x_length, x_count)';

% Set Up Finite Differences
initialise_finite_differences(length(x),x(2)-x(1),4)

%func = @(t,y) f_evolution_linear(y, Q, H1, H2, m2, m3, s1, s2);
func = @(t,y) f_evolution(y, Q, H1, H2, m2, m3, s1, s2);

inter = i_double_cos(x, 0, 0, 0.02, pi, x_length);
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

% tic
% [t2, h2] = ode2b(func, linspace(0,t_final,t_count), inter);
% toc

%%
figure
plot_overview(h,t,x,H1,H2,m2,m3)

% figure
% plot_overview(h2,t2,x,H1,H2,m2,m3)

% norm(h(:,end)-h2(:,end))*x_step