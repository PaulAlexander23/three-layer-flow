function plot_regions(h, t, x, Q, H1, H2, m2, m3)
    %plot_regions Calculates the different regions of stability/class and plots
    %them
    %   
    
    type = zeros(length(x), length(t));
    
    for t_i = 1:length(t)
        for x_i = 1:length(x)/2
            type(t_i,x_i) = max(imag(eig(compute_g_nonlinear(h(x_i,t_i), h(x_i+end/2,t_i), Q, H1, H2, m2, m3))))>0;
        end
    end
    
    bin_map = [1   1   1
        0.5 0.5 0.5];
    colormap(bin_map)
    imagesc(x,t,type>0);
    set(gca,'Ydir','Normal')
    
    xlabel('x')
    ylabel('t')
    title('Regions where the Jacobian is ellipitic')
end