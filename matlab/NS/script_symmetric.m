% Driver for the numerical methods

%clear;

Q = 1;
H1 = 0.4;
H2 = 0.6;
m2 = 0.8;
m3 = 1;
s1 = 1;
s2 = 1;

tFinal = 100;
xCount = 2^7;

a = 0.1;
theta = 1;

%%

[h,x,t]=compute_numerical_solution(H1,H2,m2,m3,s1,s2 ,Q,tFinal,xCount,...
    @(x) i_double_cos(x,a,theta));



%%

plot_log_l2_norm(hLinear,tLinear,x)
figure
plot_log_l2_norm(h,t,x)

fprintf('Error norm: %g\n',norm(h(:,end)-hLinear(:,end)*(x(2)-x(1)))*(2*pi/xCount))
fprintf('Absolute Error: %g\n',max(abs(h(:,end)-hLinear(:,end))))
