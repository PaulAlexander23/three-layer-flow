% A short script to test the validity of the constructed finite differences
% against a simple exact case ( y = cos(x) )

xCount = 25:25:250;
xN = length(xCount);
dx = 2*pi./xCount;
xLength = 2*pi;

hold on
for degree = 1:4
    for order = [2 4]
        error = compute_error(xCount,degree,order);
        X = [ones(length(xCount),1) log(xCount)'];
        b2 = X\log(error);
        scatter(log(xCount),log(error));
        plot(log(xCount),X*b2);
    end
end


function error = compute_error(xCount,degree,order)
    global D
    error = ones(length(xCount),1);
    for i = 1:length(xCount)
        x = linspace(2*pi/xCount(i), 2*pi, xCount(i))';
        initialise_finite_differences(xCount(i),x(2)-x(1),order);
        if degree == 1
            y = -sin(x);
        elseif degree == 2;
            y = -cos(x);
        elseif degree == 3;
            y = sin(x);
        else
            y = cos(x);
        end
        error(i) = norm(D{degree}*cos(x) - y )*sqrt(x(2)-x(1));
    end
end