function [img, m2, m3] = plot_stability_m(k, H1, H2, s1, s2, Q)
    %PLOT_STABILITY_M Plots a slice of the parameter
    % space with white for linearly stable, grey for M-P unstable and
    % black for flux unstable.
    
    m2 = linspace(0,2,201);
    m3 = linspace(0,2,201);
    
    omegaDR = nan(length(m2),length(m3));
    omegaG = nan(length(m2),length(m3));
    omegaMP = nan(length(m2),length(m3));
    
    for i = 2:length(m2)-1
        for j = 2:length(m3)-1
            omegaDR(i,j) = max(real(compute_dispersion_relation(k,H1,H2,m2(i),m3(j),s1,s2,Q)));
            omegaG(i,j) = max(real(compute_dispersion_relation(k,H1,H2,m2(i),m3(j),0,0,Q)));
            omegaMP(i,j) = max(real(compute_dispersion_relation(k,H1,H2,m2(i),m3(j),s1,s2,Q)-...
                compute_dispersion_relation(k,H1,H2,m2(i),m3(j),0,0,Q)));
        end
    end
    
    img = zeros(length(m2),length(m3));
    
    % Unstable Region
    img(omegaDR>0) = 0.5;
    
    % Flux Region
    img(omegaG>1e-13) = 1;
    
    colormap([1   1   1
        0.5 0.5 0.5
        0   0   0])
    
    % Plot
    imagesc(m2,m3,img')
    
    set(gca,'YDir','normal');
    
    colorbar('ticks',[0.1666,0.5,0.8333],'ticklabels',{'Stable','Unstable','Alpha Unstable'});
    caxis([0 1]);
    
    axis equal;
    axis([0,2,0,2]);
    
    xlabel('m_2');
    ylabel('m_3');
    title({'Plot of the regions of instability.'});
    
end