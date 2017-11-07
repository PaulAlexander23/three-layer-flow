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

%xCount = 2.^(5:8);
xCount = 2^6:2^5:2^8;
%xCount = 25:25:250;
xN = length(xCount);
dx = 2*pi./xCount;

h = cell(xN,1);
x = cell(xN,1);
t = cell(xN,1);


timeTaken = ones(xN,1);
error_norm = ones(xN-1,1);
error_value = ones(xN-1,1);

for i = 1:xN
    tic;
    [h{i},x{i},t{i}] = compute_numerical_solution(H1,H2,m2,m3,s1,s2,Q,tFinal,xCount(i),inter);
    timeTaken(i) = toc;
end

%% Run again from here
for i = 1:xN-1
    % error(i) = norm(h{i}(:,end)-h{xN}(1:xCount(xN)/xCount(i):end,end))*sqrt(dx(i));
    error_norm(i) = norm(h{i}(:,end)-h{xN}(1:xCount(xN)/xCount(i):end,end));%*dx(i);
    fprintf('Method %u, error: %g, Time taken: %f,\n',i,error_norm(i),timeTaken(i))
end
fprintf('Method %u, error: -, Time taken: %f,\n',i+1,timeTaken(xN));

for i = 1:xN-1
    error_value(i) = max(abs(h{i}(:,end) - h{xN}(1:xCount(xN)/xCount(i):end,end)));
end

%save('test_error_results.mat')

%%
plot_loglog_with_regression(xCount,timeTaken);

figure
plot_loglog_with_regression(xCount(1:end-1),error_value);

figure
plot_loglog_with_regression(xCount(1:end-1),error_norm);

function plot_loglog_with_regression(x,y)
    X = [ones(length(x),1) log(x)'];
    c = X\log(y);
    scatter(log(x),log(y));
    hold on
    plot(log(x),X*c);
    
    c(2)
end