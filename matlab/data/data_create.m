function data_create(H1, H2, m2, m3, s1, s2, Q, tL, xL, xN)

    addpath('../interfaces/','../compute/')

    inter = @(x) i_double_rand_fixed(x,0.01);

    RelTol = 1e-3; % Default: 1e-3

    tic;
    [h,t,x] = compute_numerical_solution(H1, H2, m2, m3, s1, s2, Q, inter, tL, xL, xN, RelTol);
    timeTaken = toc;

    data_save(h,t,x,timeTaken,xN,tL,H1,H2,m2,m3,s1,s2,Q);

end
