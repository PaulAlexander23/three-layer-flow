function data_create(H1, H2, m2, m3, s1, s2, Q, inter, tL, xL, xN)

    RelTol = 1e-3; % Default: 1e-3

    tic;
    [h,x,t] = compute_numerical_solution(H1, H2, m2, m3, s1, s2, Q, inter, tL, xL, xN, RelTol);
    timeTaken = toc;

    data_save(h,t,x,timeTaken,xN,tL,H1,H2,m2,m3,s1,s2,Q);

end
