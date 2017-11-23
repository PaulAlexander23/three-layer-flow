% Testing and examples for the dispersion relation section

H1 = 0.45;
H2 = 0.6;
m2 = 0.8;
m3 = 0.65;
s1 = 1;
s2 = 1;
Q = 1;

f_linear = compute_f_linear(H1,H2,m2,m3,s1,s2)

g_linear = compute_g_linear(H1,H2,m2,m3,Q)

dispersion_relation = compute_dispersion_relation(1,H1,H2,m2,m3,s1,s2,Q)

ratio = compute_ratio(1,H1,H2,m2,m3,s1,s2,Q)

xL = 2*pi;
xN = 2^6;
xS = xL/xN;
x = linspace(xS,xL,xN)';

y = compute_eigenfunctions(x,H1,H2,m2,m3,s1,s2,Q,0.1,1)

plot_interfaces(x,y(:,1),H1,H2)

figure
plot_interfaces(x,y(:,2),H1,H2)

%% Plotting

figure
plot_dispersion_relation(H1,H2,m2,m3,s1,s2,Q,1)

figure
plot_dispersion_relation_phase_speed(H1,H2,m2,m3,s1,s2,Q,1)

figure
plot_dispersion_relation_varying_h(m2,m3,s1,s2,Q)

figure
plot_dispersion_relation_varying_m(H1,H2,s1,s2,Q)

figure
plot_dispersion_relation_overview(H1,H2,m2,m3,s1,s2,Q)
