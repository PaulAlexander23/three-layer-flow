% Driver for the numerical methods

%clear;

Q = 1;
H1 = 0.45;
H2 = 0.55;
m2 = 0.8;
m3 = 1;
s1 = 1;
s2 = 1;

tFinal = 50;
xCount = 2^7;

a = 0.06;
theta = pi/2;

%%

[h,x,t]=compute_numerical_solution(H1,H2,m2,m3,s1,s2 ,Q,tFinal,xCount,...
    @(x) i_double_cos(x,a,theta));


%%
%save('symmetric_unstable_results.mat')

%%
animate_interfaces(h,t,x,H1,H2,0.5);

%%
animate_spectrum(h,t,x,0.5)


%%
animate_h_h(h,t,H1,H2,m2,m3,Q,0.5)

%%
figure
plot_surfaces(h,t,x,H1,H2);

figure
plot_type_regions(h,t,x,H1,H2,m2,m3,Q);

figure
plot_log_l2_norm(h,t,x)

%%
plot_type_for_all_h(H1,H2,m2,m3,Q)
hold on
plot_h_h_space(h(:,1),H1,H2);
plot_h_h_space(h(:,(1+end)/2),H1,H2);
plot_h_h_space(h(:,end),H1,H2);