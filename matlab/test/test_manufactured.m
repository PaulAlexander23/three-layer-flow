
H1 = 0.4;
H2 = 0.7;
m2 = 0.5;
m3 = 1;
s1 = 1;
s2 = 1;
Q = 1;

a = 0.1;
theta = 1;
c = -1;

tL = 10; RelTol = 1e-3;
hold on;

for xN = 2.^(4:8)
    [t, y] = compute_numerical_manufactured_solution(xN, tL, RelTol,...
        a, theta, c, H1, H2, m2, m3, s1, s2, Q);
    
    yExact = compute_exact_solution(xN,t',a,c,theta);
    
    yError = abs(y - yExact);
    
    plot(t,max(yError))
end

save('results_manufactured.mat')

%% Functions

function y = compute_exact_solution(xN,t,a,theta,c)
    
    xL = 2*pi;
    x = linspace(xL/xN,xL,xN)';
    
    y = [a*cos(x + c*t); a*cos(x + c*t + theta)];
    
end


function [t, y] = compute_numerical_manufactured_solution(...
        xN, tL, RelTol, a, theta, c, H1, H2, m2, m3, s1, s2, Q)
    
    xL = 2*pi;
    xS = xL/xN;
    x = linspace(xS,xL,xN)';
    
    func = @(t,y) compute_rhs_ps(t, x, y, ...
        @(t, x, y, dy) - f_evolution(y, dy, H1, H2, m2, m3, s1, s2, Q),...
        [1,3,4]) - compute_manufacted_rhs2(x,t,a,theta,c,H1,H2,m2,m3,s1,s2,Q);
    
    options = odeset('Vectorized','on',...
        'BDF','on',... % Backward differentiation formulae
        'Event',@(t,y) event_collision(t,y,H1,H2,xS),...
        'RelTol',RelTol,... % Default: 1e-3
        'AbsTol',1e-6);  % Default: 1e-6
    
    tic
    [t, y, te, ~, ~] = ode15s(func, [0, tL], i_double_cos(x,[a,a],theta), options);
    toc
    
    if ~isempty(te)
        fprintf('Intersection detected at: %f\n',te)
    end
    
    y = y';
    
end