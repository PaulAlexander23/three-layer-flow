% Driver for the numerical methods

%clear;

Q = 1;
H1 = 0.25;
H2 = 0.89;
m2 = 0.5;
m3 = 0.25;
s1 = 0.5;
s2 = 1;

tFinal = 200;
xCount = 2^6;

%i_custom = @(x, a, theta) [a*cos(x+theta),zeros(size(x))];
%i_custom = @(x, a, theta) [zeros(size(x)),-a*cos(x+theta)];

[hLinear,~,tLinear] = compute_numerical_linear_solution(H1,H2,m2,m3,...
                       s1,s2,Q,tFinal,xCount,@(x) i_double_cos(x,0.001,0));
[h,x,t]=compute_numerical_solution(H1,H2,m2,m3,s1,s2 ,Q,tFinal,xCount,...
                                           @(x) i_double_cos(x,0.001,0.1));

figure
plot_overview(hLinear,tLinear,x,Q,H1,H2,m2,m3)
figure
plot_overview(h,t,x,Q,H1,H2,m2,m3)

norm(h(:,end)-hLinear(:,end)*(x(2)-x(1)))