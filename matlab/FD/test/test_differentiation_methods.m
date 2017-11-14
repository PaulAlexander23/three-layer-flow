% A short script to test the validity of the psuedo spectral differentiation
% against a simple exact case ( y = cos(x) )

fprintf('test_pseudo_spectral\n')

addpath('../IF/')

xN = 2.^(4:14)';
xL = 2*pi;
xS = xL./xN;

hold on
for degree = 2
    error = compute_exact_error(xN, xL, xS, degree);   
end

plot_linear_interpolation(log10(xN),log10(error));

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
        dyApprox = diff_ps(y,degree,0.5);
        error(i) = max(abs(dyApprox - dy));
        figure();
        plot(x,dy,x,dyApprox);
    end
end

function error = compute_approx_error(xCount,order)
    Q = 1;
    H1 = 0.4;
    H2 = 0.7;
    m2 = 1;
    m3 = 1;
    s1 = 1;
    s2 = 1;
    a = 0.1;
    theta = 1;
    
    error = ones(length(xCount)-1,1);
    
    x = linspace(2*pi/xCount(end), 2*pi, xCount(end))';
    initialise_finite_differences(xCount(end),x(2)-x(1),order);
    yApp = f_evolution(i_double_cos(x,a,theta),Q,H1,H2,m2,m3,s1,s2);
    
    for i = 1:length(xCount)-1
        x = linspace(2*pi/xCount(i), 2*pi, xCount(i))';
        initialise_finite_differences(xCount(i),x(2)-x(1),order);
        y = f_evolution(i_double_cos(x,a,theta),Q,H1,H2,m2,m3,s1,s2);
        
        error(i) = max(abs(y -  yApp(xCount(end)/xCount(i):xCount(end)/xCount(i):end)));
    end
end

function plot_linear_interpolation(x, y)
    L = length(x);
    X = [ones(L,1) x];
    c = X\y;
    scatter(x,y);
    plot(x,X*c);
    % fprintf('Gradient: %f \n',c(2));
end