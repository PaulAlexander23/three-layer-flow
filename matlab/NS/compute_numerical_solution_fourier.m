function [h,x,t] = compute_numerical_solution_fourier(H1, H2, m2, m3, s1, s2, Q, inter, tFinal, xL, xN, RelTol)
    %COMPUTE_NUMERICAL_SOLUTION Computes the numerical solution up to tFinal
    %   Detailed explanation goes here
    
    if nargin < 10
        xL = 2*pi;
    end
    if nargin < 11
        xN = 2^8;
    end
    if nargin < 12
        RelTol = 1e-3;
    end
    
    
    xS = xL/xN;
    x = linspace(xS, xL, xN)';
    
    % Finite Differences
    %     initialise_finite_differences(xCount,xStep,4)
    %     func = @(t,y) rhs_fd(t, x, y, ...
    
    % Pseudo Spectral
    func = @(t,y) rhs_ps_f(t, x, y, ...
        @(t, x, y, dy) compute_evolution(y, dy, H1, H2, m2, m3, s1, s2, Q),...
        [1,3,4]);
    
    options = odeset('Vectorized','on',...
        'BDF','on',... % Backward differentiation formulae
        'Event',@(t,y) event_collision(t,y,H1,H2),...
        'RelTol',RelTol,... % Default: 1e-3
        'AbsTol',1e-6);  % Default: 1e-6
    
    h0 = inter(x);
    h0 = reshape(h0,xN,2);
    h0 = fft(h0);
    h0 = reshape(h0,xN*2,1);
    
    tic
    [t, h, te, ~, ~] = ode15s(func, [0,tFinal], h0, options);
    toc
    
    h = h';
    
    h = reshape(h,xN,length(t)*2);
    h = ifft(h);
    h = reshape(h,xN*2,length(t));
    
    if ~isempty(te)
        fprintf('Intersection detected at: %f\n',te)
    end
end