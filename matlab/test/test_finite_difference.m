% A short script to test the validity of the psuedo spectral differentiation
% against a simple exact case ( y = cos(x) )

%fprintf('test_finite_difference\n')

addpath('../IF/')

order = 4;

xN = 2.^(4:10)';
xL = 2*pi;
xS = xL./xN;

%% Single Derivatives
error = zeros(length(xN),4);

for degree = 1:4
    error(:,degree) = compute_exact_error(xN, xL, xS, degree, order);   
end

hold on
for degree = 1:4
    scatter_with_lobf(log10(xL./xN),log10(error(:,degree)));
end
set(gca, 'XDir','reverse')
title({'A log - log plot of the error',' against dx'})
xlabel('dx, 10^x')
ylabel('Error, 10^y')
legend({'First derivative','','Second derivative',''...
    'Third derivative','','Fourth derivative',''},'Location','southwest');

%% Full problem rhs

error = compute_approx_error(xN,xL,xS,order);
figure();
scatter_with_lobf(log10(xL./xN(1:end-1)),log10(error));
set(gca, 'XDir','reverse')
title({'A log - log plot of the error',' against dx'})
xlabel('dx, 10^x')
ylabel('Error, 10^y')

%%
function error = compute_exact_error(xN,xL,xS,degree,order)
    global D
    error = ones(length(xN),1);
    for i = 1:length(xN)
        x = linspace(xS(i), xL, xN(i))';
        initialise_finite_differences(xN(i),xS(i),order);
        y = cos(x);
        if degree == 1
            dy = -sin(x);
        elseif degree == 2
            dy = -cos(x);
        elseif degree == 3
            dy = sin(x);
        else
            dy = cos(x);
        end
        dyApprox = D{degree}*y;
        error(i) = max(abs(dyApprox - dy));
    end
end

%%
function error = compute_approx_error(xN,xL,xS,order)
    Q = 1;
    H1 = 0.4;
    H2 = 0.7;
    m2 = 1;
    m3 = 1;
    s1 = 1;
    s2 = 1;
    a = 0.1;
    theta = 1;
    
    error = ones(length(xN)-1,1);
    
    x = linspace(xS(end), xL, xN(end))';
    initialise_finite_differences(xN(end),xS(end),order);
    yApp = rhs_fd(0,x,i_double_cos(x,a,theta),...
                  @(t, x, y, dy) compute_evolution(y, dy, H1, H2, m2, m3, s1, s2, Q),...
                  [1,3,4]);
    
    for i = 1:length(xN)-1
        x = linspace(xS(i), xL, xN(i))';
        initialise_finite_differences(xN(i),xS(i),order);
        y = rhs_fd(0,x,i_double_cos(x,a,theta),...
                  @(t, x, y, dy) compute_evolution(y, dy, H1, H2, m2, m3, s1, s2, Q),...
                  [1,3,4]);
        
        error(i) = max(abs(y -  yApp(xN(end)/xN(i):xN(end)/xN(i):end)));
    end
end