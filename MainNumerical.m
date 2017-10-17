% Driver for the numerical methods

%clear all

%addpath('data','data/parameters','plots');
load('data/parameters/ic-unstable-h-0.46-0.54-mu-0.3-0.5-s-1-1-Q-1.mat','-mat');

t_final = 5;
t_count = 2^3;
t = linspace(0,t_final,t_count)';

x_length = 2*pi;
x_count = 2^5;
x_step = x_length/x_count;
x = linspace(x_step, x_length, x_count)';

func = @(t,y) f_full_problem(y, Q, s1, s2, m2, m3);
inter = i_double_cos(x, H1, H2,0.01,pi/2,x_length);


% Set Up Finite Differences
InitialiseFiniteDifferences(length(x),x(2)-x(1),4)

tic
[t, h] = ode2b(func, t, inter);
toc

%SaveData;

%beep
%pause

%PlotSolution;

%pause

%Animate;