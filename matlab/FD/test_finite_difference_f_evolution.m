% A short script to test the validity of the constructed finite differences
% against a simple exact case ( y = cos(x) )

fprintf('test_finite_difference_evolution\n')

addpath('../IF')

xCount = 2.^(3:11);
xN = length(xCount);
dx = 2*pi./xCount;
xLength = 2*pi;

figure
hold on
for order = [2 4]
    error = compute_error(xCount,order);
    X = [ones(length(xCount)-1,1) log10(xCount(1:end-1))'];
    b2 = X\log10(error);
    fprintf('Order: %u, Gradient: %f \n',order,b2(2));
    scatter(log10(xCount(1:end-1)),log10(error));
    plot(log10(xCount(1:end-1)),X*b2);
end

title({'A log - log plot of the error in the evaluation of f',' against number of points for the two schemes'})
xlabel('No of points, 10^x')
ylabel('Error, 10^y')

save('test_finite_difference_f_evolution_results.mat');

function error = compute_error(xCount,order)
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