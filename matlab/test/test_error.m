%TEST_ERROR_T Error testing in the temporal direction

addpath('../interfaces/','../compute/','../plots/')


fprintf('test_error_t\n')

Q = 1;
H1 = 0.4;
H2 = 0.7;
m2 = 1;
m3 = 1;
s1 = 1;
s2 = 1;

tol = [1e-2,1e-3,1e-4,1e-5,1e-6,1e-7,1e-8,1e-9];
tolN = length(tol);

xN = 2.^(4:8);
xNN = length(xN);

h = cell(tolN,1);
t = cell(tolN,1);

timeTaken = ones(tolN,xNN);
error = ones(tolN,xNN);

for xNI = 1:xNN
    for tolI = 1:tolN
        tic;
        h{tolI,xNI} = compute_numerical_solution(H1,H2,m2,m3,s1,s2,Q,@(x) i_double_cos(x,0.1,1),1,2*pi,xN(xNI),tol(tolI));
        timeTaken(tolI,xNI) = toc;
    end
end

save('test_error.mat')
%%
for xNI = 1:xNN
    for tolI = 1:tolN
        error(tolI,xNI) = max(abs(h{tolI,xNI}(:,end)-h{tolN,xNN}(2^(xNN-xNI):2^(xNN-xNI):end,end)));
        fprintf('Tolerance %g, step count %g, error: %g, Time taken: %f,\n',tol(tolI),xN(xNI),error(tolI,xNI),timeTaken(tolI,xNI))
    end
end

%%
imagesc(log2(xN),log10(tol),log10(error));

%%
figure;
[X,Y] = meshgrid(log2(xN),log10(tol));
surf(X,Y,log10(error));

%%
figure;
imagesc(log2(xN),log10(tol),log10(timeTaken));

%%
figure;
[X,Y] = meshgrid(log2(xN),log10(tol));
surf(X,Y,log10(timeTaken));

%%

scatter_with_lobf(log10(tol),log10(timeTaken));
set(gca, 'XDir','reverse')
title({'A log - log plot of the computation time',' against relative tolerance'})
xlabel('Relative tolerance, 10^x')
ylabel('Computation time, 10^y')

figure
scatter_with_lobf(log10(tol(1:end-1)),log10(error));
set(gca, 'XDir','reverse')
title({'A log - log plot of the error',' against relative tolerance'})
xlabel('Relative tolerance, 10^x')
ylabel('Error, 10^y')
