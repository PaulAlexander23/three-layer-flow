function [h,x,t] = compute_numerical_solution(H1, H2, m2, m3, s1, s2, Q, tFinal, xCount, inter)
    %COMPUTE_NUMERICAL_SOLUTION Computes the numerical solution up to tFinal
    %   Detailed explanation goes here
    
    %t_count = 2^5;
    %t = linspace(0,t_final,t_count)';
    
    xLength = 2*pi;
    xStep = xLength/xCount;
    x = linspace(xStep, xLength, xCount)';
    
    % Set Up Finite Differences
    initialise_finite_differences(length(x),x(2)-x(1),4)
    
    %func = @(t,y) f_evolution_flux(y,1,0.5,2);
    %func = @(t,y) f_evolution_linear(y, Q, H1, H2, m2, m3, s1, s2);
    func = @(t,y) f_evolution(y, Q, H1, H2, m2, m3, s1, s2);
    
    
    
    %inter = i_double_rand(x, 0, 0,0.2);

    %%
    %options = odeset('RelTol',1e-8,'AbsTol',1e-10);
    
    tic
    [t, h] = ode15s(func, [0,tFinal], inter(x));%, options);
    toc
    
    h = h';
end

