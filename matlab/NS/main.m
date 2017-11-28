% Main script for the numerical solution section

% close all;
% clear all;

H1 = 0.4;
H2 = 0.8;
m2 = 0.5;
m3 = 0.25;
s1 = 1.0;
s2 = 1.0;
Q = 1.0;

inter = @(x) i_eigenfunction(x,H1,H2,m2,m3,s1,s2,Q,[0.03,0.03],1,0);

xL = 2*pi;
xN = 2^6;
tL = 10;
tol = 1e-6;

[h,x,t]=compute_numerical_solution(H1,H2,m2,m3,s1,s2,Q,inter,...
    tL,xL,xN,tol);

