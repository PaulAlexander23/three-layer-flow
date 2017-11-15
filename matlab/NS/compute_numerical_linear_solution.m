function [h,x,t] = compute_numerical_linear_solution(H1, H2, m2, m3, s1, s2, Q, tFinal, xCount, inter)
    %COMPUTE_NUMERICAL_LINEAR_SOLUTION Computes the numerical solution up to tFinal
    %   Detailed explanation goes here
    
    xLength = 2*pi;
    xStep = xLength/xCount;
    x = linspace(xStep, xLength, xCount)';
    
    % Set Up Finite Differences
    initialise_finite_differences(length(x),x(2)-x(1),4)
    
    func = @(t,y) f_evolution_linear(y, Q, H1, H2, m2, m3, s1, s2);
    
    options = odeset('Vectorized','on',...
                     'Event',@(t,y) event_collision(t,y,H1,H2));
    
    tic
    [t, h, te, ye, ie] = ode15s(func, [0,tFinal], inter(x), options);
    toc
    
    if ~isempty(te)
        fprintf('Intersection detected at: %f\n',te)
    end
    h = h';
end
