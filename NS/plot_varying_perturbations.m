function plot_varying_perturbations(interface,Q,H1,H2,m2,m3)
    
    xN = 101;
    x = linspace(0,2*pi,xN)';
    N_pert = 101;
    pert = linspace(0,(H2-H1)*0.8,N_pert);
    type = NaN(N_pert,xN);
    
    for i_pert = 1:N_pert
        inter = interface(x,pert(i_pert),0);
        for i_x = 1:xN
            type(i_pert,i_x) = max(imag(eig(compute_g_nonlinear(inter(i_x),inter(i_x+end/2), Q, H1, H2, m2, m3))));
        end
    end
    
    bin_map = [1   1   1
        0.5 0.5 0.5];
    colormap(bin_map)
    imagesc(x,pert,type>0);
    set(gca,'YDir','normal');
    
    xlabel('x')
    ylabel('Perturbation Amplitude')
    colorbar('ticks',[0.25,0.75],'ticklabels',{'Hyperbolic','Elliptc'})
    title('Regions of Type for different pertubations')
end