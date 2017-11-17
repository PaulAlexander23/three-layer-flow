function plot_dispersion_relation_varying_m( H1, H2, s1, s2, Q )
    %plot_dispersion_relation_varying_mu Plots a slice of the parameter
    % space with white for linearly stable, grey for M-P unstable and
    % black for flux unstable.
    
    k = 0.001;
    
    nm = 201;
    m = linspace(0,2,nm);
    
    omegaDR = nan(nm,nm);
    omegaG = nan(nm,nm);
    
    for i = 2:nm
        for j = 2:nm
            omegaDR(i,j) = max(real(compute_dispersion_relation(k,H1,H2,m(i),m(j),s1,s2,Q)));
            omegaG(i,j) = max(imag(eig(compute_g_linear(H1,H2,m(i),m(j),Q))));
        end
    end
    
    % Uncomment for magnitudes
    %     omegaDR(omegaDR<=0) = nan;
    %     imagesc(h,h,real(log10(omegaDR')),'alphadata',~isnan(omegaDR'));
    
    img = nan(nm,nm);
    img(~isnan(omegaDR')) = 0;
    img(omegaDR'>0) = 0.5;
    img(omegaG'>0) = 1;
    
    triMap = [1.0   1.0   1.0
              0.5   0.5   0.5
              0.0   0.0   0.0];
    colormap(triMap)
    
    imagesc(m,m,img,'alphadata',~isnan(img));
    set(gca,'YDir','normal');
    
    xlabel('m_2')
    ylabel('m_3')
    title({'Plot of the regions of instability.'})
    caxis([0 1])
    colorbar('ticks',[0.125,0.5,0.875],'ticklabels',{'Linearly Stable','M-P Instabilities','Flux Instabilities'})
    axis equal;
    
end