
H1 = 0.4; H2 = 0.7; m2 = 0.5; m3 = 1; s1 = 0; s2 = 0; Q = 1;
tL = 10;

[y,x,t] = compute_numerical_solution_fourier(H1,H2,m2,m3,s1,s2,Q,...
    @(x) i_double_cos(x,0.01,1),tL,2*pi,2^6,1e-3);