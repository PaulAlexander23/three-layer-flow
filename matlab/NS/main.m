% Main script for the numerical solution section

% close all;
% clear all;

H1 = 0.6;
H2 = 0.65;
m2 = 0.5;
m3 = 1.0;
s1 = 1.0;
s2 = 1.0;
Q = 1.0;

inter = @(x) i_eigenfunction(x,H1,H2,m2,m3,s1,s2,Q,[0.06,0.06],1,0);

xL = 2*pi;
xN = 2^8;
tL = 100;
tol = 1e-9;

tic
[h,x,t]=compute_numerical_solution(H1,H2,m2,m3,s1,s2,Q,inter,...
    tL,xL,xN,tol);
timeTaken = toc;
