function plot_eigenfunctions(a, k, H1, H2, m2, m3, s1, s2, Q)
    
    x = linspace(0,2*pi,100)';
    
    y = compute_eigenfunctions(x,a,k,H1,H2,m2,m3,s1,s2,Q);
    
    plot(x,H1 + y(1:end/2),x,H2 + y(1+end/2:end));
    
    title('An Eigenfunction')
    xlabel('x')
    ylabel('y')
    
    axis([0,2*pi,0,1])
    
end