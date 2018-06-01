%TEST_DECOUPLING Tests the numerical decoupling of the system.

% clear;
H1 = 1/3;
H2 = 2/3;
m2 = 0;
m3 = 1;
s1 = 1;
s2 = 1;
Q = 1;

tL = 1000;
xN = 2^8;
xL = 2*pi;
xS = xL/xN;

i_custom = @(x) [0.1*cos(x), zeros(size(x))];

[h,x,t]=compute_numerical_solution(H1,H2,m2,m3,s1,s2,Q,i_custom,tL,xL,xN);

fprintf('At t: %g s\n',t(end))
fprintf('Norm Error: %g\n',norm(h(1+end/2:end,end))*xS)
fprintf('Absolute Error: %g\n',max(abs(h(1+end/2:end,end))))