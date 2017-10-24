% Driver for the numerical methods

%clear all

%addpath('ImplictFiniteDifferences\')
%addpath('data','data/parameters','plots');
%load('data/parameters/ic-unstable-h-0.46-0.54-mu-0.3-0.5-s-1-1-Q-1.mat','-mat');
Q = 2;
H1 = 0.3;
H2 = 0.7;
m2 = 0.8;
m3 = 1.2;
s1 = 2;
s2 = 2;



t_final = 1;
%t_count = 2^5;
%t = linspace(0,t_final,t_count)';

x_length = 2*pi;
x_count = 2^6;
x_step = x_length/x_count;
x = linspace(x_step, x_length, x_count)';

% Set Up Finite Differences
InitialiseFiniteDifferences(length(x),x(2)-x(1),4)

func = @(t,y) f_linear(y, Q, H1, H2, m2, m3, s1, s2);

%func = @(t,y) f_flux(y,1,0.5,2);

%inter = i_double_cos(x, 0, 0,0.1,0,x_length);
inter = i_double_rand(x, 0, 0,0.2);

plot(x,H1 + inter(1:end/2),x,H2 + inter(end/2+1:end))

%pause
%%
% tic
% [t, h] = ode1b(func, t, inter);
% toc
% 
% tic
% [t, h2] = ode2b(func, t, inter);
% toc
% 
% tic
% [t3, h3] = ode113(func, [0, t(end)], inter);
% toc
% 
% 
% tic
% [t4, h4] = ode45(func, [0, t(end)], inter);
% toc
% 
% h3 = h3';
% h4 = h4';

%options = odeset('RelTol',1e-8,'AbsTol',1e-10);

tic
[t, h] = ode15s(func, [0,t_final], inter);%, options);
toc

h = h';

%%
figure;
PlotSurfaces(h,t,x,H1,H2)
figure;
PlotL1(h,t,x)
figure;
PlotLogL2(h,t,x)

% figure;
% PlotSurfaces(h2,t,x,H1,H2)
% figure;
% PlotL1(h2,t,x)
% figure;
% PlotSurfaces(h3,t3,x,H1,H2)
% figure;
% PlotL1(h3,t3,x)
%SaveData;

%beep
%pause

%PlotSolution;

%pause

%Animate;