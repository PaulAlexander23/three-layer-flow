function [eta,c] = compute_travelling_wave(x,eta0,k,H1,H2,m2,m3,s1,s2,Q)
    %COMPUTE_TRAVELLING_WAVE Summary of this function goes here
    %   Detailed explanation goes here

    xN = length(x);

    c0 = -imag(compute_dispersion_relation(k,H1,H2,m2,m3,s1,s2,Q))/k;
    y0 = [-k*c0(1); eta0(:,end)];

    compute_finite_differences_init(xN,x(1),4);

    func = @(y) [y(2)-y0(2);...
        y(1) * reshape(compute_diff_fd(reshape(y(2:end),xN,2),1),2*xN,1) + compute_rhs_fd(0, x, y(2:end), @(t, x, y, dy) f_evolution(y, dy, H1, H2, m2, m3, s1, s2, Q),[1,3,4])];

    options = optimoptions('fsolve','Display','iter'...,'MaxFunctionEvaluations',50000
        );

    tic
    y = fsolve(func,y0,options);
    toc

    c = -y(1)/k;
    eta = y(2:end);

end
