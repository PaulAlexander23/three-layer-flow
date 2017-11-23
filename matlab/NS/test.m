% Testing and examples of the numerical solutions section

H1 = 0.4;
H2 = 0.7;
m2 = 1;
m3 = 1;
s1 = 1;
s2 = 1;
Q = 1;

tL = 10;
xN = 2^6;
xL = 2*pi;
xS = xL/xN;
x = linspace(xS, xL, xN)';

func = @(t,y) rhs_ps(t, x, y, ...
    @(t, x, y, dy) compute_evolution(y, dy, H1, H2, m2, m3, s1, s2, Q),...
    [1,3,4]);

options = odeset('Vectorized','on',...
    'Event',@(t,y) event_collision(t,y,H1,H2),...
    'RelTol',1e-3,... % Default: 1e-3
    'AbsTol',1e-6);  % Default: 1e-6

tic
[t, h, te, ~, ~] = ode15s(func, [0,tL], i_double_cos(x,0.1,0), options);
toc
h = h';
size(h)

tic
[t, h] = ode2b(func, linspace(0,tL,16), i_double_cos(x,0.1,0));
toc
size(h)

%% Solving numerically

[h,x,t]=compute_numerical_solution(H1,H2,m2,m3,s1,s2 ,Q,tL,xN,...
    @(x) i_double_rand_fixed(x,0.1));
size(h)

%% Animating

animate_interfaces(h,t,x,H1,H2,0.1)

figure
animate_spectrum(h,t,x,0.1)

%% Plotting

figure
plot_l1_norm(h,t,x)

figure
plot_log_l2_norm(h,t,x)

figure
plot_surfaces(h,t,x,H1,H2)

figure
plot_overview(h,t,x,H1,H2)


%% Testing

figure
test_method;

figure
test_error_t;

%% Verification

figure
test_linear;

figure
test_is_symmetric;