function [h,x,t] = compute_numerical_solution(H1, H2, m2, m3, s1, s2, Q, inter, tFinal, xL, xN, RelTol)
    %COMPUTE_NUMERICAL_SOLUTION Computes the numerical solution up to tFinal

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
        %compute_finite_differences_init(xN,xS,4)
        %func = @(t,y) compute_rhs_fd(t, x, y, ...

    % Pseudo Spectral
    func = @(t,y) compute_rhs_ps(t, x, y, ...
        @(t, x, y, dy) - f_evolution(y, dy, H1, H2, m2, m3, s1, s2, Q),...
        [1,3,4]);

    options = odeset('Vectorized','on',...
        'BDF','on',... % Backward differentiation formulae
        'Event',@(t,y) event_collision_and_timeout(t,y,H1,H2,xS,tic),...
        'RelTol',RelTol,... % Default: 1e-3
        'AbsTol',1e-8);  % Default: 1e-6

    [t, h, te, ~, ~] = ode15s(func, [0:1e-1:tFinal], inter(x), options); %inter(x)

    if ~isempty(te)
        fprintf('Intersection detected at: %f\n',te)
    end
    
    h = h';
    t = t';
end
