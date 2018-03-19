function script_for_cluster(H1, H2, m2, m3, s1, s2, Q, tL, xL, xN)

    addpath('NS/','IF/','PS/')
    
    inter = @(x) i_double_rand_fixed(x,0.01);
    
    RelTol = 1e-3; % Default: 1e-3
    
    tic;
    [h,t,x] = compute_numerical_solution(H1, H2, m2, m3, s1, s2, Q, inter, tL, xL, xN, RelTol);
    timeTaken = toc;
    
    save_data(h,t,x,timeTaken,xN,tL,H1,H2,m2,m3,s1,s2,Q);
    
end

