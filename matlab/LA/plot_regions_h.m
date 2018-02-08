function [img, h1, h2] = plot_regions_h(k, m2, m3, s1, s2, Q)
    %PLOT_REGIONS_H Plots a slice of the parameter
    % space with white for linearly stable, grey for M-P unstable and
    % black for flux unstable.
    
    h1 = linspace(0,1,201);
    h2 = linspace(0,1,201);
    
    omegaDR = nan(length(h1),length(h2));
    omegaG = nan(length(h1),length(h2));
    omegaMP = nan(length(h1),length(h2));
    
    for i = 2:length(h1)-1
        for j = 3:length(h2)-1
            if h1(i) < h2(j)
                omegaDR(i,j) = max(max(real(compute_dispersion_relation(k,h1(i),h2(j),m2,m3,s1,s2,Q))));
                omegaG(i,j) = max(real(compute_dispersion_relation(k,h1(i),h2(j),m2,m3,0,0,Q)));
                omegaMP(i,j) = max(max(real(compute_dispersion_relation(k,h1(i),h2(j),m2,m3,s1,s2,Q)-...
                compute_dispersion_relation(k,h1(i),h2(j),m2,m3,0,0,Q))));
            end
        end
    end
    
    img = zeros(length(h1),length(h2));
    
    % Madja-Pego Region
    img(omegaMP>0) = 0.3;
    
    % Flux Region
    img(omegaG>1e-13) = 0.9;
    
    % Both
    both = (omegaMP>0).*(omegaG>1e-13);
    img(both>0) = 0.6;
    
    colormap([1   1   1
              0.7 0.7 0.7
              0.4 0.4 0.4
              0.1 0.1 0.1])
    
    % Plot
    imagesc(h1,h2,img')

    set(gca,'YDir','normal');
    
    colorbar('ticks',[0.125,0.375,0.625,0.875],'ticklabels',{'No Instablities','M-P','Both','Alpha'});
    caxis([0 1]);
    
    axis equal;
    axis([0,1,0,1]);
    
    xlabel('H_1');
    ylabel('H_2');
    title({'Plot of the regions of instability.'});
    
end