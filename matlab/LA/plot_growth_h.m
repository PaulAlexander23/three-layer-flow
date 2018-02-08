function [img, h1, h2] = plot_growth_h(k, m2, m3, s1, s2, Q)
    %PLOT_GROWTH_H Plots a slice of the parameter
    % space with white for linearly stable, grey for M-P unstable and
    % black for flux unstable.
    
    h1 = linspace(0,1,201);
    h2 = linspace(0,1,201);
    
    omegaDR = nan(length(h1),length(h2));
    
    for i = 2:length(h1)-1
        for j = 3:length(h2)-1
            if h1(i) < h2(j)
                omegaDR(i,j) = max(real(compute_dispersion_relation(k,h1(i),h2(j),m2,m3,s1,s2,Q)));
            end
        end
    end
    
    omegaDR = omegaDR.*(omegaDR>0);
    
    colormap(flipud(gray));
    
    % Plot
    imagesc(h1,h2,omegaDR')

    set(gca,'YDir','normal');
    
    colorbar();
    
    axis equal;
    axis([0,1,0,1]);
    
    xlabel('H_1');
    ylabel('H_2');
    title({'Plot of the regions of instability.'});
    
end