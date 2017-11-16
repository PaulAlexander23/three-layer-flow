% Testing and examples for the nonlinear analysis section

addpath('../IF')

H1 = 0.45;
H2 = 0.6;
m2 = 0.8;
m3 = 0.65;
Q = 1;


compute_g_nonlinear(0.3,0.5,H1,H2,m2,m3,Q)

%%

figure
plot_interface_type(@(x) i_double_cos(x,0.1,0),H1,H2,m2,m3,Q);

figure
plot_type_for_all_h(H1,H2,m2,m3,Q)

x = linspace(0,2*pi)';
t = linspace(0,10);
h = i_double_cos(x,0.1,pi/4)*exp(-0.5*t);

figure
plot_type_regions(h,t,x,H1,H2,m2,m3,Q)

figure
plot_varying_perturbations(@i_double_cos,H1,H2,m2,m3,Q)

figure
plot_varying_theta(@i_double_cos,H1,H2,m2,m3,Q)

figure
plot_varying_theta_interfaces(H1,H2)
