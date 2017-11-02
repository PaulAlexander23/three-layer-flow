% Test script to determine which method to employ

addpath('../IF/')

Q = 2;
H1 = 0.4;
H2 = 0.7;
m2 = 1;
m3 = 1;
s1 = 1;
s2 = 1;

t_final = 10;
t_count = 2^7;
t_my = linspace(0,t_final,t_count)';

x_length = 2*pi;
x_count = 2^5;
x_step = x_length/x_count;
x = linspace(x_step, x_length, x_count)';

initialise_finite_differences(length(x),x(2)-x(1),4)

func = @(t,y) f_evolution(y, Q, H1, H2, m2, m3, s1, s2);
inter = @(x) i_double_cos(x, 0.01, pi/2);

noMethods = 4;
timeTaken = zeros(noMethods,1);
error = zeros(noMethods,1);
h = cell(noMethods);
t = cell(noMethods);

%options = odeset('Event',@(t,y) event_collision(t,y,H1,H2));

tic;
[t(1), h(1)] = ode45(func, [0, t_final], inter);
timeTaken(1) = toc
h(1) = h(1)';

tic;
[t(2), h(2)] = ode113(func, [0, t_final], inter);
timeTaken(2) = toc
h(2) = h(2)';

tic;
[t(3), h(3)] = ode15s(func, [0, t_final], inter);
timeTaken(3) = toc
h(3) = h(3)';

tic;
[t(4), h(4)] = ode23s(func, [0, t_final], inter);
timeTaken(4) = toc
h(4) = h(4)';

tic;
[t(5), h(5)] = ode23t(func, [0, t_final], inter);
timeTaken(5) = toc
h(5) = h(5)';

tic;
[t(6), h(6)] = ode23tb(func, [0, t_final], inter);
timeTaken(6) = toc
h(6) = h(6)';

tic;
[t(7), h(7)] = ode15i(@(t,y,yp) func(t,y), [0, t_final], inter, ones(size(inter)));
timeTaken(7) = toc
h(7) = h(7)';

tic;
[t(8), h(8)] = ode1b(func, t_my, inter);
timeTaken(8) = toc

tic
[t(9), h(9)] = ode2b(func, t_my, inter);
timeTaken(9) = toc



%norm(h(:,end) - h2(:,end),2)*x_step
%norm(h(:,end) - h3(:,end),2)*x_step
%plot(x,[h(1:end/2,end),h(1+end/2:end,end),h2(1:end/2,end),h2(1+end/2:end,end)])
