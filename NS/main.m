

H1 = 0.45;
H2 = 0.6;
m2 = 0.8;
m3 = 0.65;
Q = 1;

figure('position',[0,660,560,420])
plot_single_case(Q,H1,H2,m2,m3)


figure('position',[660,660,560,420])
plot_type_vs_h(Q,H1,H2,m2,m3)


figure('position',[1320,660,560,420])
plot_varying_perturbations(Q,H1,H2,m2,m3)

figure('position',[0,0,560,420])
plot_varying_theta(H1,H2,m2,m3,Q)

figure('position',[660,0,560,420])
plot_varying_theta_interfaces(H1,H2)

commandwindow();
