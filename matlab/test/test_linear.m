% Driver for the numerical methods

%clear;
H1 = 1/3;
H2 = 2/3;
m2 = 1;
m3 = 1;
s1 = 1;
s2 = 1;
Q = 1;

tN = 100;
tL = 1000;
xN = 2^8;
xL = 2*pi;

a = [0.01,0.01];
theta = pi;

[h,~,t]=compute_numerical_solution(H1,H2,m2,m3,s1,s2 ,Q,...
                                           @(x) i_double_cos(x,a,theta),tL,xL,xN);

[hLinear,x,tLinear] = compute_linear_solution(H1,H2,m2,m3,...
                       s1,s2,Q,@(x) i_double_cos(x,a,theta),tL,tN,xL,xN);

%save('test_linear_results.mat')

%%        

hNew = compute_interpolation(h,t,x,tLinear,x);
hDiff = hNew - hLinear;

figure;
plot(tLinear,sqrt(sum(hDiff.^2,1)));

figure;
plot(tLinear,sqrt(sum(hDiff.^2,1))./sqrt(sum(hLinear.^2,1)));

figure
plot_log_l2_norm(hLinear,tLinear,x)
hold on
plot_log_l2_norm(h,t,x)

fprintf('Error norm: %g\n',norm(hNew(:,end)-hLinear(:,end)*(x(2)-x(1)))*(2*pi/xN))
fprintf('Absolute Error: %g\n',max(abs(hNew(:,end)-hLinear(:,end))))
fprintf('Relative Error: %g\n',max(abs(hNew(:,end)-hLinear(:,end)))/max(abs(hLinear(:,end))))