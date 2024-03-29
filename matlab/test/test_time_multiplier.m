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

tL = 1:10;
tLN = length(t);

h = cell(tLN,1);
t = cell(tLN,1);

timeTaken = ones(tLN,1);
error = ones(tLN-1,1);

for tolI = 1:tLN
    tic;
    h{tolI} = compute_numerical_solution(H1,H2,m2,m3,s1,s2,Q,@(x) i_double_cos(x,0.1,1),1,2*pi,2^8,tol(tolI));
    timeTaken(tolI) = toc;
end

%%
for tolI = 1:tLN-1
    error(tolI) = max(abs(h{tolI}(:,end)-h{tLN}(:,end)));
    fprintf('Method %u, error: %g, Time taken: %f,\n',tolI,error(tolI),timeTaken(tolI))
end
fprintf('Method %u, error: -, Time taken: %f,\n',tolI+1,timeTaken(tLN));


%%
save('test_time_multiplier.mat')

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
