% A short script to test the validity of the constructed finite differences
% against a simple exact case ( y = cos(x) )

xCount = 2.^(2:11);
xN = length(xCount);
dx = 2*pi./xCount;
xLength = 2*pi;

figure
hold on
for order = [2 4]
    error = compute_error(xCount,order);
    X = [ones(length(xCount)-1,1) log(xCount(1:end-1))'];
    b2 = X\log(error);
    
    scatter(log(xCount(1:end-1)),log(error));
    plot(log(xCount(1:end-1)),X*b2);
end

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
    yApp = f_evolution_linear(i_double_cos(x,a,theta),Q,H1,H2,m2,m3,s1,s2);
    
    for i = 1:length(xCount)-1
        x = linspace(2*pi/xCount(i), 2*pi, xCount(i))';
        initialise_finite_differences(xCount(i),x(2)-x(1),order);
        y = f_evolution_linear(i_double_cos(x,a,theta),Q,H1,H2,m2,m3,s1,s2);
        
        error(i) = max(abs(y -  yApp(xCount(end)/xCount(i):xCount(end)/xCount(i):end)));
    end
end