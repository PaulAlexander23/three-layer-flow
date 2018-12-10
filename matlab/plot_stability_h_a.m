function [img, h1, h2] = plot_stability_h_a(k, m2, m3, Q)
    %PLOT_STABILITY_H Plots a slice of the parameter
    % space with white for linearly stable, grey for M-P unstable and
    % black for flux unstable.
    
    h1 = linspace(0,1,801);
    h2 = linspace(0,1,801);
    
    omegaG = nan(length(h1),length(h2));
    
    parfor i = 2:length(h1)-1
        v1 = nan(1,length(h2));
        for j = 3:length(h2)-1
            if h1(i) < h2(j)
                v1(j) = max(real(compute_dispersion_relation(k,h1(i),h2(j),m2,m3,0,0,Q)));
            end
        end
        omegaG(i,:) = v1;
    end
    
    img = zeros(length(h1),length(h2));
    
    % Flux Region
    img(omegaG>1e-13) = 1;
    
    colormap([1   1   1
              0.5 0.5 0.5
              0   0   0])
    
    % Plot
    imagesc(h1,h2,img')

    set(gca,'YDir','normal');
    
    %colorbar('ticks',[0.1666,0.5,0.8333],'ticklabels',{'Stable','Unstable','Alpha Unstable'});
    caxis([0 1]);
    
    axis image;
    
    xlabel('H_1');
    ylabel('H_2');
    %title({'Plot of the regions of instability.'});
    
end