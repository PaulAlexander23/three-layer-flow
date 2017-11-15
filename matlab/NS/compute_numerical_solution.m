function [h,x,t] = compute_numerical_solution(H1, H2, m2, m3, s1, s2, Q, tFinal, xCount, inter)
    %COMPUTE_NUMERICAL_SOLUTION Computes the numerical solution up to tFinal
    %   Detailed explanation goes here
    
    xLength = 2*pi;
    xStep = xLength/xCount;
    x = linspace(xStep, xLength, xCount)';
    
    % Finite Differences
%     initialise_finite_differences(xCount,xStep,4)
%     func = @(t,y) rhs_fd(t, x, y, ...
%                          @(t, x, y, dy) compute_evolution(y, dy, Q, H1, H2, m2, m3, s1, s2),...
%                          [1,3,4]);
    
    % Pseudo Spectral
%     func = @(t,y) rhs_ps(t, x, y, ...
%                         @(t, x, y, dy) compute_evolution(y, dy, Q, H1, H2, m2, m3, s1, s2),...
%                         [1,3,4]);
    
    % Pseudo Spectral Linear
%      func = @(t,y) rhs_ps(t, x, y, ...
%                           @(t, x, y, dy) compute_evolution_linear(y, dy, Q, H1, H2, m2, m3, s1, s2),...
%                           [1,4]);
	
    
    % Pseudo Spectral burgers
%     func = @(t,y) rhs_ps(t, x, y, ...
%                         @(t, x, y, dy) compute_burgers(y, dy),...
%                         [1,2]);

    % Pseudo Spectral thin film
    func = @(t,y) rhs_ps(t, x, y, ...
                        @(t, x, y, dy) compute_thin_film(y, dy, Q),...
                        [1,3,4]);


    %options = odeset('RelTol',1e-8,'AbsTol',1e-10);
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

