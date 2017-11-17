% A short script to test the validity of the psuedo spectral differentiation
% against a simple exact case ( y = cos(x) )

fprintf('test_pseudo_spectral\n')

addpath('../IF/')

xN = 2.^(4:14)';
xL = 2*pi;
xS = xL./xN;

%% Single Derivatives
error = zeros(length(xN),4);

for degree = 1:4
    error(:,degree) = compute_exact_error(xN, xL, xS, degree);   
end

hold on
for degree = 1:4
    plot_linear_interpolation(log10(xN),log10(error(:,degree)));
end

%% Full problem rhs

error = compute_approx_error(xN,xL,xS);
figure();
plot_linear_interpolation(log10(xN(1:end-1)),log10(error));



function error = compute_exact_error(xN,xL,xS,degree)
    error = ones(length(xN),1);
    for i = 1:length(xN)
        x = linspace(xS(i), xL, xN(i))';
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
        dyApprox = diff_ps(y,degree);
        error(i) = max(abs(dyApprox - dy));
    end
end

function error = compute_approx_error(xN,xL,xS)
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
    yApp = rhs_ps(0,x,i_double_cos(x,a,theta),...
                  @(t, x, y, dy) compute_evolution(y, dy, H1, H2, m2, m3, s1, s2, Q),...
                  [1,3,4]);
    
    for i = 1:length(xN)-1
        x = linspace(xS(i), xL, xN(i))';
        y = rhs_ps(0,x,i_double_cos(x,a,theta),...
                  @(t, x, y, dy) compute_evolution(y, dy, H1, H2, m2, m3, s1, s2, Q),...
                  [1,3,4]);
        
        error(i) = max(abs(y -  yApp(xN(end)/xN(i):xN(end)/xN(i):end)));
    end
end

function plot_linear_interpolation(x, y)
    L = length(x);
    X = [ones(L,1) x];
    c = X\y;
    
    scatter(x,y);
    hold on
    plot(x,X*c);
    % fprintf('Gradient: %f \n',c(2));
end