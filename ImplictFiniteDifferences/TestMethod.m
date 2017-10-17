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

C = [Q, sigma_1, sigma_2, mu_2, mu_3];

func = @(t,y) f_full_problem(y, C);
inter = i_double_cos(x, H_1, H_2,0.01,pi/2,x_length);


% Set Up Finite Differences
InitialiseFiniteDifferences(length(x),x(2)-x(1),4)

tic
[t, h] = ode2b(func, t, inter);
toc


%%
tic
[t2, h2] = ode15s(func, [0, t_final], inter);
toc
h2 = h2';


norm(h(:,end) - h2(:,end),2)*x_step


%%

tic
[t3, h3] = ode15i(@(t,y,yp) func(t,y), [0, t_final], inter, ones(size(inter)));
toc
h3 = h3';


norm(h(:,end) - h3(:,end),2)*x_step
plot(x,[h(1:end/2,end),h(1+end/2:end,end),h2(1:end/2,end),h2(1+end/2:end,end)])

%SaveData;

%beep
%pause

%PlotSolution;

%pause

%Animate;