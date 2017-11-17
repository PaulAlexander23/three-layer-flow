%Error testing

fprintf('test_error_t\n')

addpath('../IF/')

Q = 1;
H1 = 0.4;
H2 = 0.7;
m2 = 1;
m3 = 1;
s1 = 1;
s2 = 1;

tFinal = 1;
inter = @(x) i_double_cos(x, 0.1, pi/2);

xCount = 2^9;
xLength = 2*pi;
xStep = xLength/xCount;
x = linspace(xStep, xLength, xCount)';  
initialise_finite_differences(length(x),x(2)-x(1),4)
func = @(t,y) f_evolution(y, H1, H2, m2, m3, s1, s2, Q);

tol = [1e-2,1e-3,1e-4,1e-5,1e-6,1e-7,1e-8];
tolN = length(tol);

h = cell(tolN,1);
t = cell(tolN,1);


timeTaken = ones(tolN,1);
error = ones(tolN-1,1);

for i = 1:tolN
    options = odeset('RelTol', tol(i),...
                     'AbsTol', 1e-8,...
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


%%
save('test_error_t_results.mat')

%%

X = [ones(length(tol),1) log10(tol)'];
b1 = X\log10(timeTaken);
scatter(log10(tol),log10(timeTaken));
hold on
plot(log10(tol),X*b1);
set(gca, 'XDir','reverse')
title({'A log - log plot of the computation time',' against relative tolerance for the two schemes'})
xlabel('Relative tolerance, 10^x')
ylabel('Error, 10^y')

figure
X = [ones(length(tol)-1,1) log10(tol(1:end-1))'];
b2 = X\log10(error);
scatter(log10(tol(1:end-1)),log10(error));
hold on
plot(log10(tol(1:end-1)),X*b2);
set(gca, 'XDir','reverse')
title({'A log - log plot of the error in the derivatives of y = cos(x)',' against relative tolerance for the two schemes'})
xlabel('Relative tolerance, 10^x')
ylabel('Error, 10^y')
