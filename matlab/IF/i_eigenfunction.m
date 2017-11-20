function h = i_eigenfunction(x, H1, H2, m2, m3, s1, s2, Q, a, mode, mostStable)
    y = compute_eigenfunctions(x,H1,H2,m2,m3,s1,s2,Q,a,mode);
    if mostStable
        h = y(:,2);
    else
        h = y(:,1);
    end
    
end