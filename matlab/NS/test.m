% Testing and examples of the numerical solutions section

H1 = 0.4;
H2 = 0.7;
m2 = 1;
m3 = 1;
s1 = 1;
s2 = 1;
Q = 1;

tFinal = 10;
xCount = 2^6;

[h,x,t]=compute_numerical_solution(H1,H2,m2,m3,s1,s2 ,Q,tFinal,xCount,...
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

figure
test_linear;

figure
test_is_symmetric;