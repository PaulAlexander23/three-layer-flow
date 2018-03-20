function plot_eigenfunctions(a, k, H1, H2, m2, m3, s1, s2, Q)
    
    x = linspace(0,2*pi,100)';
    
    y = compute_eigenfunctions(x,a,k,H1,H2,m2,m3,s1,s2,Q);
    
    figure;
    subplot(2,1,1);
    plot(x,y(1+end/2:end,1));
    
    title('Least stable Eigenfunction');
    
    %xlabel('x');
    ylabel('\eta_2');
    xlim([0,2*pi]);
    axis('equal')
    
    subplot(2,1,2);
    plot(x,y(1:end/2,1));
    
    xlabel('x');
    ylabel('\eta_1');
    xlim([0,2*pi]);
    axis('equal')
   
    figure;
    subplot(2,1,1);
    plot(x,y(1+end/2:end,2));
    
    title('Most stable Eigenfunction');
    
    %xlabel('x');
    ylabel('\eta_2');
    xlim([0,2*pi]);
    axis('equal')

        
    subplot(2,1,2);
    plot(x,y(1:end/2,2));
    
    xlabel('x');
    ylabel('\eta_1');
    xlim([0,2*pi]);
    axis('equal')
end