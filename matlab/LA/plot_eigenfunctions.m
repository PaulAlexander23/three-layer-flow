function plot_eigenfunctions(a, k, H1, H2, m2, m3, s1, s2, Q)
    
    x = linspace(0,2*pi,100)';
    
    y = compute_eigenfunctions(x,a,k,H1,H2,m2,m3,s1,s2,Q);
    
    
    figure('position',[680,558,5*80,5*60]);
    title('Least stable Eigenfunction');
    plot_double(x,y(:,1));
    
    figure('position',[680,558,5*80,5*60]);
    title('Most stable Eigenfunction');
    plot_double(x,y(:,2));
    
    

    function plot_double(x,y)
        subplot(2,1,1);
        plot(x,y(1+end/2:end),'k');

        %xlabel('x');
        ylabel('\eta_2');
        xlim([0,2*pi]);
        axis('equal')


        subplot(2,1,2);
        plot(x,y(1:end/2),'k');

        xlabel('x');
        ylabel('\eta_1');
        xlim([0,2*pi]);
        axis('equal')
    end
end