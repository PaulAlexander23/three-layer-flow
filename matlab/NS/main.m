% Main script for the numerical solution section

% close all;
% clear all;

% H1 = 0.6;
% H2 = 0.65;
% m2 = 0.5;
% m3 = 1.0;
% s1 = 1.0;
% s2 = 1.0;
% Q = 1.0;


<<<<<<< HEAD
H1 = 0.595;
H2 = 0.645;
m2 = 1.0;
m3 = 2.0;
s1 = 1.0;
s2 = 1.0;
Q = 4; % 4 next
=======
H1 = 0.55;
H2 = 0.6;
m2 = 0.5;
m3 = 1.0;
s1 = 1.0;
s2 = 1.0;
Q = 1.0;
>>>>>>> 304f8cda4a9074e3f964b8c98f5ddf78ec420187

% plot_dispersion_relation(H1,H2,m2,m3,s1,s2,Q,2);

%inter = @(x) compute_eigenfunctions(x,[0.06;0],1,H1,H2,m2,m3,s1,s2,Q);
inter = @(x) i_double_rand_fixed(x,0.01);

xL = 2*pi;
xN = 2^7;
<<<<<<< HEAD
tL = 200;
tol = 1e-6;
=======
tL = 100;
tol = 1e-3;
>>>>>>> 304f8cda4a9074e3f964b8c98f5ddf78ec420187

tic
[h,x,t]=compute_numerical_solution(H1,H2,m2,m3,s1,s2,Q,inter,...
    tL,xL,xN,tol);
timeTaken = toc;

plot_overview(h,t,x,H1,H2,m2,m3,s1,s2,Q)
