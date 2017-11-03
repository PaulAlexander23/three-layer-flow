% Test script to determine which method to employ

addpath('../IF/')

Q = 1;
H1 = 0.4;
H2 = 0.7;
m2 = 1;
m3 = 1;
s1 = 1;
s2 = 1;

t_final = 10;

x_length = 2*pi;
x_count = 2^9;
x_step = x_length/x_count;
x = linspace(x_step, x_length, x_count)';

initialise_finite_differences(length(x),x(2)-x(1),4)

func = @(t,y) f_evolution(y, Q, H1, H2, m2, m3, s1, s2);
inter = @(x) i_double_cos(x, 0.1, pi/2);

noMethods = 3;
timeTaken = ones(noMethods,1);
error = ones(noMethods,1);
h = cell(noMethods,1);
t = cell(noMethods,1);

options = odeset('Vectorized','on',...
                 'Event',@(t,y) event_collision(t,y,H1,H2));
tic;
[t{1}, h{1}] = ode15s(func, [0, t_final], inter(x), options);
timeTaken(1) = toc;
h{1} = h{1}';


%%
tic;
[t{2}, h{2}] = ode23t(func, [0, t_final], inter(x), options);
timeTaken(2) = toc;
h{2} = h{2}';
%%
tic;
[t{3}, h{3}] = ode23tb(func, [0, t_final], inter(x), options);
timeTaken(3) = toc;
h{3} = h{3}';


x2_length = 2*pi;
x2_count = 2^10;
x2_step = x2_length/x2_count;
x2 = linspace(x2_step, x2_length, x2_count)';

initialise_finite_differences(length(x2),x2(2)-x2(1),4)

options = odeset('Vectorized','on',...
                 'Event',@(t,y) event_collision(t,y,H1,H2));

tic;
[t_approx,h_approx] = ode15s(func,[0,t_final],inter(x2),options);
timeTaken_approx = toc;
h_approx = h_approx';

%%
for i = 1:noMethods
    error(i) = norm(h{i}(:,end)-h_approx(1:(x2_count/x_count):end,end))...
                *sqrt(x_step);
    fprintf('Method %u, error: %g, Time taken: %f,\n',i,error(i),timeTaken(i))
end
%%
save('test_method_2_results.mat')