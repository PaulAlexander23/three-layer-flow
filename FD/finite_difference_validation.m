% A short script to test the validity of the constructed finite differences
% against a simple exact case ( y = cos(x) )

xCount = 25:25:250;
xN = length(xCount);
dx = 2*pi./xCount;
xLength = 2*pi;

global D1 D2 D3 D4
error2 = ones(xN,1);
for i = 1:xN
    x = linspace(dx(i), xLength, xCount(i))';
    initialise_finite_differences(length(x),dx(i),2)
    error2(i) = norm(D1*cos(x) + sin(x))*sqrt(dx(i));
end

error4 = ones(xN,1);
for i = 1:xN
    x = linspace(dx(i), xLength, xCount(i))';
    initialise_finite_differences(length(x),dx(i),4)
    error4(i) = norm(D1*cos(x) + sin(x))*sqrt(dx(i));
end


X = [ones(length(xCount),1) log(xCount)'];
b2 = X\log(error2);
scatter(log(xCount),log(error2));
hold on
plot(log(xCount),X*b2);

b2(2)

X = [ones(length(xCount),1) log(xCount)'];
b2 = X\log(error4);
scatter(log(xCount),log(error4));
hold on
plot(log(xCount),X*b2);

b2(2)

function error = compute_error(xCount,degree,order)
    error = ones(length(xCount),1);
    for i = 1:length(xCount)
        x = linspace(2*pi/xCount(i), 2*pi, xCount(i))';
        initialise_finite_differences(xCount(i),x(2)-x(1),order);
        error(i) = norm(D1*cos(x) + sin(x))*sqrt(x(2)-x(1));
    end
end
