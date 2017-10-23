% Driver for the numerical methods

%clear all

addpath('ImplictFiniteDifferences\')
%addpath('data','data/parameters','plots');
%load('data/parameters/ic-unstable-h-0.46-0.54-mu-0.3-0.5-s-1-1-Q-1.mat','-mat');

t_final = 4;
t_count = 2^5;
t = linspace(0,t_final,t_count)';

x_length = 2*pi;
x_count = 2^5;
x_step = x_length/x_count;
x = linspace(x_step, x_length, x_count)';

% Set Up Finite Differences
InitialiseFiniteDifferences(length(x),x(2)-x(1),4)

func = @(t,y) f_full_problem2(y, Q, m2, m3, s1, s2);

%func = @(t,y) f_flux(y,1,0.5,2);

inter = i_double_rand(x, H1, H2,0.1);

plot(x,inter(1:end/2),x,inter(end/2+1:end))

%pause
%%
tic
[t, h2] = ode1b(func, t, inter);
toc

tic
[t, h] = ode2b(func, t, inter);
toc

tic
[t3, h3] = ode113(func, [0, t(end)], inter);
toc
h3 = h3';

figure;
PlotSurfaces(h,t,x)
figure;
PlotL1(h,t,x)
figure;
PlotSurfaces(h2,t,x)
figure;
PlotL1(h2,t,x)
figure;
PlotSurfaces(h3,t3,x)
figure;
PlotL1(h3,t3,x)
%SaveData;

%beep
%pause

%PlotSolution;

%pause

%Animate;