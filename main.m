% Driver for the grouping of everything

%clear;
close all;

addpath('DR','FD','NS')

Q = 1.0;
H1 = 0.45;
H2 = 0.65;
m2 = 0.7;
m3 = 0.45;
s1 = 0.5;
s2 = 2.0;

%%
omega = compute_dispersion_relation(1,H1,H2,m2,m3,s1,s2,Q)';
fprintf('Dispersion Relation: w+(1) = %f%+fi, w-(1) = %f%+fi\n',omega(1),omega(1)/1i,omega(2),omega(2)/1i);

plot_dispersion_relation_overview(H1,H2,m2,m3,s1,s2,Q,2);

pause
%%
tFinal = 200;
xCount = 2^5;

[hLinear,x,tLinear]=compute_numerical_linear_solution(H1,H2,m2,m3,s1,s2 ,Q,tFinal,xCount,@(x) i_double_cos(x,0.02,0));
[h,~,t]=compute_numerical_solution(H1,H2,m2,m3,s1,s2 ,Q,tFinal,xCount,@(x) i_double_cos(x,0.02,0));


%%

figure
plot_overview(hLinear,tLinear,x,Q,H1,H2,m2,m3)
figure
plot_overview(h,t,x,Q,H1,H2,m2,m3)

norm(h(:,end)-hLinear(:,end)*(x(2)-x(1)))