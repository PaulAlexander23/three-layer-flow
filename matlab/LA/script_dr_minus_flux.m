
H1 = 0.54; H2 = 0.6; m2 = 0.5; m3 = 1; s1 = 1; s2 = 1; Q = 1;

figure
% set(0,'DefaultFigureWindowStyle','docked')

hold on;

plot_dispersion_relation(H1,H2,m2,m3,s1,s2,Q,4);

plot_dispersion_relation(H1,H2,m2,m3,s1,s2,0,4);

plot_dispersion_relation(H1,H2,m2,m3,0,0,Q,4);

legend

figure
plot_dispersion_relation_m_p(H1,H2,m2,m3,s1,s2,Q,4);

%omegaDR(i,j) = max(max(real(compute_dispersion_relation(k,h(i),h(j),m2,m3,s1,s2,Q))));
%omegaG(i,j) = max(imag(eig(compute_g_linear(h(i),h(j),m2,m3,Q))));