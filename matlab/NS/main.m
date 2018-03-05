% Main script for the numerical solution section

% close all;
% clear all;

% H1 = 0.5;
% H2 = 0.6;
% m2 = 0.05;
% m3 = 0.12;
% s1 = 1.0;
% s2 = 1.0;
% Q = 0.3;

% H1 = 0.49;
% H2 = 0.7;
% m2 = 0.5;
% m3 = 0.25;
% s1 = 1.0;
% s2 = 1.0;
% Q = 1;

% H1 = 0.58;
% H2 = 0.62;
% m2 = 0.15;
% m3 = 3.1;
% s1 = 1.0;
% s2 = 1.0;
% Q = 0.05;

% H1 = 0.65;
% H2 = 0.95;
% m2 = 1.0;
% m3 = 0.1;
% s1 = 1.0;
% s2 = 1.0;
% Q = 1.0;

% H1 = 0.6;
% H2 = 0.65;
% m2 = 0.5;
% m3 = 1.0;
% s1 = 1.0;
% s2 = 1.0;
% Q = 1.0;

% H1 = 0.5;
% H2 = 0.6;
% m2 = 0.05;
% m3 = 0.12;
% s1 = 1.0;
% s2 = 1.0;
% Q = 0.3; 

% H1 = 0.2;
% H2 = 0.9;
% m2 = 0.6;
% m3 = 0.34;
% s1 = 1.0;
% s2 = 1.0;
% Q = 0.3;

H1 = 0.2;
H2 = 0.9;
m2 = 0.6;
m3 = 0.34;
s1 = 1.0;
s2 = 1.0;
Q = 0.3;

% H1 = 0.6;
% H2 = 0.95;
% m2 = 0.06;
% m3 = 0.015;
% s1 = 1.0;
% s2 = 1.0;
% Q = 0.1; 

% H1 = 0.5;
% H2 = 0.95;
% m2 = 0.06;
% m3 = 0.015;
% s1 = 1.0;
% s2 = 1.0;
% Q = 0.3; 


% plot_dispersion_relation(H1,H2,m2,m3,s1,s2,Q,2);

%inter = @(x) compute_eigenfunctions(x,[0.06;0],1,H1,H2,m2,m3,s1,s2,Q);
inter = @(x) i_double_rand_fixed(x,0.01);

xL = 2*pi;
xN = 2^7;
tL = 2000;
tol = 1e-3;

tic
[h,x,t]=compute_numerical_solution(H1,H2,m2,m3,s1,s2,Q,inter,...
    tL,xL,xN,tol);
timeTaken = toc;

plot_overview(h,t,x,H1,H2,m2,m3,s1,s2,Q)
