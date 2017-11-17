function [h,x,t] = compute_numerical_linear_solution(H1, H2, m2, m3, s1, s2, Q, tFinal, xCount, inter)
    %COMPUTE_NUMERICAL_LINEAR_SOLUTION Computes the numerical solution up to tFinal
    %   Detailed explanation goes here
    
    xLength = 2*pi;
    xStep = xLength/xCount;
    x = linspace(xStep, xLength, xCount)';
    
    % Set Up Finite Differences
    func = @(t,y) rhs_ps(t, x, y, ...
        @(t, x, y, dy) compute_evolution_linear(y, dy, H1, H2, m2, m3, s1, s2, Q),...
        [1,3,4]);
    
    options = odeset('Vectorized','on',...
        'Event',@(t,y) event_collision(t,y,H1,H2));
    
    tic
    [t, h, te, ~, ~] = ode15s(func, [0,tFinal], inter(x), options);
    toc
    
    if ~isempty(te)
        fprintf('Intersection detected at: %f\n',te)
    end
    h = h';
end

