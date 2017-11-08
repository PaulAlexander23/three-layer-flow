%Error testing

addpath('../IF/')

Q = 1;
H1 = 0.4;
H2 = 0.7;
m2 = 1;
m3 = 1;
s1 = 1;
s2 = 1;

tFinal = 10;
inter = @(x) i_double_cos(x, 0.1, pi/2);

% xCount = 2.^(4:8);
xCount = 2^7;
xLength = 2*pi;
xStep = xLength/xCount;
x = linspace(xStep, xLength, xCount)';  
initialise_finite_differences(length(x),x(2)-x(1),4)
func = @(t,y) f_evolution(y, Q, H1, H2, m2, m3, s1, s2);

tol = [1e-2,1e-3,1e-4,1e-5,1e-6,1e-7,1e-8];
tolN = length(tol);

h = cell(tolN,1);
t = cell(tolN,1);


timeTaken = ones(tolN,1);
error = ones(tolN-1,1);

for i = 1:tolN
    options = odeset('RelTol', tol(i),...
                     'AbsTol', 1e-10,...
                     'Vectorized', 'on',...
                     'Event', @(t,y) event_collision(t,y,H1,H2));
    tic;
    [t{i}, h{i}] = ode15s(func, [0,tFinal], inter(x), options);
    h{i} = h{i}';
    timeTaken(i) = toc
end

%%
for i = 1:tolN-1
    error(i) = max(abs(h{i}(:,end)-h{tolN}(:,end)));
    fprintf('Method %u, error: %g, Time taken: %f,\n',i,error(i),timeTaken(i))
end
fprintf('Method %u, error: -, Time taken: %f,\n',i+1,timeTaken(tolN));

save('test_error_t_results.mat')

%%

X = [ones(length(tol),1) log(tol)'];
b1 = X\log(timeTaken);
scatter(log(tol),log(timeTaken));
hold on
plot(log(tol),X*b1);

figure
X = [ones(length(tol)-1,1) log(tol(1:end-1))'];
b2 = X\log(error);
scatter(log(tol(1:end-1)),log(error));
hold on
plot(log(tol(1:end-1)),X*b2);