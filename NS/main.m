

Q = 1.3;
H1 = 0.1;
H2 = 0.5;
m2 = 2;
m3 = 1.3;

figure
plot_single_case(Q,H1,H2,m2,m3)

figure
plot_varying_perturbations(Q,H1,H2,m2,m3)

figure
plot_varying_theta(H1,H2,m2,m3,Q)

figure
plot_varying_theta_interfaces(H1,H2)



