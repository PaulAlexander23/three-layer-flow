function plot_log_l2_norm_with_gradient(h,t,x,H1,H2,m2,m3,s1,s2,Q,sy,sx,sl)

    t2 = linspace(0,t(end),1001);
    h2 = compute_interpolation(h,t,x,t2,x);

    plot_log_l2_norm(h2,t2,x);
    m = log10(exp(1))*max(real(compute_dispersion_relation(2*pi/x(end),H1,H2,m2,m3,s1,s2,Q)));
    plot_gradient(sx,sy,m,sl)
end
