%SCRIPT_LINEAR_NONLINEAR_FLUX A short script to determine if analysing the 
%nonlinear flux matrix is redundant

H1 = 0.45;
H2 = 0.5;
m2 = 0.8;
m3 = 2;
s1 = 1;
s2 = 1;
Q = 1;

lin = plot_dispersion_relation_varying_h(m2,m3,s1,s2,Q);
figure
nonlin = plot_type_for_all_h(H1,H2,m2,m3,Q);

any(any(abs(lin-nonlin')))