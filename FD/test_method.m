% Driver for the numerical methods

%clear all
Q = 2;
H1 = 0.5;
H2 = 0.6;
m2 = 0.5;
m3 = 1.4;
s1 = 10;
s2 = 10;

t_final = 5;
t_count = 2^3;
t = linspace(0,t_final,t_count)';

x_length = 2*pi;
x_count = 2^5;
x_step = x_length/x_count;
x = linspace(x_step, x_length, x_count)';

func = @(t,y) f_evolution(y, Q, H1, H2, m2, m3, s1, s2);
inter = i_double_cos(x, H1, H2,0.01,pi/2,x_length);


% Set Up Finite Differences
initialise_finite_differences(length(x),x(2)-x(1),4)


%%
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