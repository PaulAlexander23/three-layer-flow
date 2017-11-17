function [h,x,t] = compute_numerical_solution(H1, H2, m2, m3, s1, s2, Q, tFinal, xN, inter)
    %COMPUTE_NUMERICAL_SOLUTION Computes the numerical solution up to tFinal
    %   Detailed explanation goes here
    
    xL = 2*pi;
    xS = xL/xN;
    x = linspace(xS, xL, xN)';
    
    % Finite Differences
    %     initialise_finite_differences(xCount,xStep,4)
    %     func = @(t,y) rhs_fd(t, x, y, ...
    
    % Pseudo Spectral
    func = @(t,y) rhs_ps(t, x, y, ...
        @(t, x, y, dy) compute_evolution(y, dy, H1, H2, m2, m3, s1, s2, Q),...
        [1,3,4]);
    
    options = odeset('Vectorized','on',...
        'Event',@(t,y) event_collision(t,y,H1,H2),...
        'RelTol',1e-3,... % Default: 1e-3
        'AbsTol',1e-6);  % Default: 1e-6
    
    tic
    [t, h, te, ~, ~] = ode15s(func, [0,tFinal], inter(x), options);
    toc
    
    if ~isempty(te)
        fprintf('Intersection detected at: %f\n',te)
    end
    h = h';
end