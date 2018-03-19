function plot_eigenfunctions(a, k, H1, H2, m2, m3, s1, s2, Q)
    
    x = linspace(0,2*pi,100)';
    
    y = compute_eigenfunctions(x,a,k,H1,H2,m2,m3,s1,s2,Q);
    
    figure;
    subplot(2,1,1);
    plot(x,y(1,1:end/2));
    
    title('An Eigenfunction');
    
    %xlabel('x');
    ylabel('\eta_1');
    xlim([0,2*pi]);
    axis('equal')
    
    subplot(2,1,2);
    plot(x,y(1,1+end/2:end));
    
    xlabel('x');
    ylabel('\eta_2');
    xlim([0,2*pi]);
    axis('equal')
    
end