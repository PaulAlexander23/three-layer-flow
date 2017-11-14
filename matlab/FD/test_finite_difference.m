% A short script to test the validity of the constructed finite differences
% against a simple exact case ( y = cos(x) )

fprintf('test_finite_difference\n')

xCount = 2.^(4:10);
xN = length(xCount);
dx = 2*pi./xCount;
xLength = 2*pi;

hold on
for order = [2 4]
    for degree = 1:4
        error = compute_error(xCount,degree,order);
        X = [ones(length(xCount),1) log10(xCount)'];
        b2 = X\log10(error);
        fprintf('Order: %u, Degree: %u, Gradient: %f \n',order,degree,b2(2));
        scatter(log10(xCount),log10(error));
        plot(log10(xCount),X*b2);
    end
end

title({'A log - log plot of the error in the derivatives of y = cos(x)',' against number of points for the two schemes'})
xlabel('No of points, 10^x')
ylabel('Error, 10^y')

save('test_finite_difference_results.mat')

function error = compute_error(xCount,degree,order)
    global D
    error = ones(length(xCount),1);
    for i = 1:length(xCount)
        x = linspace(2*pi/xCount(i), 2*pi, xCount(i))';
        initialise_finite_differences(xCount(i),x(2)-x(1),order);
        if degree == 1
            y = -sin(x);
        elseif degree == 2
            y = -cos(x);
        elseif degree == 3
            y = sin(x);
        else
            y = cos(x);
        end
        error(i) = max(abs((D{degree}*cos(x) - y )));
    end
end