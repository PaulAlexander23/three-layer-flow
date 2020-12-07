function data_continue(filename, tL)

    addpath('../interfaces/','../compute/')

    load(filename);

    inter = @(~) h;

    RelTol = 1e-3; % Default: 1e-3

    tic;
    [h,x,t] = compute_numerical_solution(H1, H2, m2, m3, s1, s2, Q, inter, tL, xL, xN, RelTol);
    timeTaken = toc;

    data_save(h,x,t,timeTaken,xN,xL,tL,H1,H2,m2,m3,s1,s2,Q);

end
