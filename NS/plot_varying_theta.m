function plot_varying_theta( H1, H2, m2, m3 )
    %plot_varying_theta Plots the matrix type for different shifts of cos
    
    xN = 101;
    x = linspace(0,2*pi,xN);
    
    thetaN = 101;
    theta = linspace(0,2*pi,thetaN);
    
    type = NaN(thetaN,xN);
    
    pert = (H2-H1)* 2^-2;
    for thetai = 1:thetaN
        for xi = 1:xN
            type(thetai, xi) = max(imag(eig(compute_g_nonlinear(H1 + pert*sin(x(xi)),H2 + pert*sin(x(xi) - theta(thetai)), m2, m3))));
        end
    end
    
    bin_map = [1   1   1
        0.5 0.5 0.5];
    colormap(bin_map)
    imagesc(x,theta,type>0);%'alphadata',~isnan(type'));
    set(gca,'YDir','normal');
    
    %view([90 -90])
    
    xlabel('x');
    ylabel('\theta');
    title('Regions of equation type for various shifts')
    colorbar('ticks',[0.25,0.75],'ticklabels',{'Hyperbolic','Elliptc'})
    
end

