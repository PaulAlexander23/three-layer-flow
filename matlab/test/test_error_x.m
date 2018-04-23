%Error testing - IS THIS NEEDED IN THE X DIRECTION? WHAT TOLERANCE ARE WE
%USING?

addpath('../interfaces/','../compute/','../plots/')

Q = 1;
H1 = 0.4;
H2 = 0.7;
m2 = 1;
m3 = 1;
s1 = 1;
s2 = 1;

tFinal = 1;
inter = @(x) i_double_cos(x, 0.1, pi/2);

xCount = 2.^(4:8);
%xCount = 2^5:2^5:2^8;
%xCount = 25:25:250;
xN = length(xCount);
dx = 2*pi./xCount;

h = cell(xN,1);
x = cell(xN,1);
t = cell(xN,1);


timeTaken = ones(xN,1);
error = ones(xN-1,1);

for i = 1:xN
    tic;
    [h{i},x{i},t{i}] = compute_numerical_solution(H1,H2,m2,m3,s1,s2,Q,tFinal,xCount(i),inter);
    timeTaken(i) = toc;
end
%%

for i = 1:xN-1
    error(i) = max(abs(h{i}(:,end) - h{xN}(xCount(xN)/xCount(i):xCount(xN)/xCount(i):end,end)));
    fprintf('Method %u, error: %g, Time taken: %f,\n',i,error(i),timeTaken(i))
end
fprintf('Method %u, error: -, Time taken: %f,\n',i+1,timeTaken(xN));


%%
save('test_error_x_results.mat')

%%
% hold on
% for i = 1:xN
% plot(x{i}, h{i}(1:end/2,end))
% end

%%
plot_loglog_with_regression(xCount,timeTaken);
title({'A log - log plot of the computation time',' against the number of x steps'})
xlabel('x steps, 10^x')
ylabel('Computation time, 10^y')


figure
plot_loglog_with_regression(xCount(1:end-1),error);
title({'A log - log plot of the error',' against the number of x steps'})
xlabel('x steps, 10^x')
ylabel('Error, 10^y')

function gradient = plot_loglog_with_regression(x,y)
    X = [ones(length(x),1) log10(x)'];
    c = X\log10(y);
    scatter(log10(x),log10(y));
    hold on
    plot(log10(x),X*c);
    hold off

    gradient = c(2);
end
