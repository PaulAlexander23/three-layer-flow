%TEST_LINEAR Compares numerical method to linear solution for a single
%mode.

% clear;
H1 = 0.5;
H2 = 0.6;
m2 = 0.5;
m3 = 2;
s1 = 1;
s2 = 1;
Q = 0.09;

tL = 1000;
xN = 2^8;
xL = 2*pi;
xS = xL/xN;

a = [0.001;0.0];
mode = 1;

[h,x,t]=compute_numerical_solution(H1,H2,m2,m3,s1,s2 ,Q,...
    @(x) i_eigenfunction(x,a,mode,H1,H2,m2,m3,s1,s2,Q),tL,xL,xN);

t = t';

hLinear=compute_linear(x,t,a,mode,H1,H2,m2,m3,s1,s2,Q);

hDiff = h - hLinear;

%%

fprintf('At t: %g s\n',t(end))
fprintf('Norm Error: %g\n',norm(hDiff(:,end))*sqrt(xS))
fprintf('Absolute Error: %g\n',max(abs(hDiff(:,end))))
fprintf('Relative Error: %g\n',max(abs(hDiff(:,end)))/max(abs(hLinear(:,end))))


figure
plot(t,sqrt(sum(hDiff.^2,1)*xS))
xlabel('Time')
ylabel('Norm error')

figure
plot(t,max(abs(hDiff)))
xlabel('Time')
ylabel('Absolute error')

figure
plot(t,max(abs(hDiff))./max(abs(hLinear)))
xlabel('Time')
ylabel('Relative error')

figure
hold on
plot_log_l2_norm(hLinear,t,x)
plot_log_l2_norm(h,t,x)

save('data_test_linear.mat')