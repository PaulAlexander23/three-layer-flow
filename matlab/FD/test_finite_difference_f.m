% A short script to test the validity of the constructed finite differences
% against a simple exact case ( y = cos(x) )

addpath('../IF/')

xCount = 2.^(3:11);
xN = length(xCount);
dx = 2*pi./xCount;
xLength = 2*pi;

figure
hold on
for order = [2 4]
    error = compute_error(xCount,order,@f_custom);
    X = [ones(length(xCount)-1,1) log(xCount(1:end-1))'];
    b2 = X\log(error);
    fprintf('Order: %u, Gradient: %f \n',order,b2(2));
    scatter(log(xCount(1:end-1)),log(error));
    plot(log(xCount(1:end-1)),X*b2);
end

function dy = f_custom(y)
    global D
    %dy = (D{4}*y);
    dy = 0.0001*(D{4}*y) + 0.1*(D{1}*y) + y;
    
end

function error = compute_error(xCount,order,f)
    a = 0.1;
    theta = 1;
    
    error = ones(length(xCount)-1,1);
    
    x = linspace(2*pi/xCount(end), 2*pi, xCount(end))';
    initialise_finite_differences(xCount(end),x(2)-x(1),order);
    yApp = f(i_single_cos(x,a,theta));
    
    for i = 1:length(xCount)-1
        x = linspace(2*pi/xCount(i), 2*pi, xCount(i))';
        initialise_finite_differences(xCount(i),x(2)-x(1),order);
        y = f(i_single_cos(x,a,theta));
        
        error(i) = max(abs(y -  yApp(xCount(end)/xCount(i):xCount(end)/xCount(i):end)));
    end
end