%Error testing - Resolution Increase

H1 = 1/3;
H2 = 2/3;
m2 = 1;
m3 = 1;
s1 = 1;
s2 = 1;
Q = 1;

tFinal = 1000;
inter = @(x) i_double_cos(x, [0.1,0.1], pi/2);

xCount = 2.^(4:10);
xN = length(xCount);
dx = 2*pi./xCount;

h = cell(xN,1);
x = cell(xN,1);
t = cell(xN,1);

timeTaken = ones(xN,1);

for i = 1:xN
    tic;
    [h{i},x{i},t{i}] = compute_numerical_solution(H1,H2,m2,m3,s1,s2,Q,inter,tFinal,2*pi,xCount(i));
    timeTaken(i) = toc;
end

%save('test_error_x_results.mat')

%%
hBest = 6;
tNew = linspace(0,t{hBest}(end),200);

hI = cell(7,1);
for i = 1:7
    hI{i} = compute_interpolation(h{i},t{i},x{i},tNew,x{hBest});
end
hError = cell(7,1);
for i = 1:7
    hError{i} = hI{i} - hI{hBest};
end

%%
for i = 1:7
    plot_log_l2_norm(hError{i},tNew,x{hBest});
end

err = zeros(7,1);
for i = 1:7
    %err(i) =
    %norm(hError{i}(:,end))*(x{hBest}(2)-x{hBest}(1))*(2*pi/xCount(hBest));
    %Abs
    err(i) = norm(hError{i}(:,end))/norm(h{hBest}(:,end)); %Rel
end

figure
scatter_with_lobf(log2(xCount),log10(err));

