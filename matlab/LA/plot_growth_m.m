function [img, m2, m3] = plot_growth_m(k, H1, H2, s1, s2, Q)
    %PLOT_GROWTH_M Plots a slice of the parameter
    % space with white for linearly stable, grey for M-P unstable and
    % black for flux unstable.
    
    m2 = linspace(0,2,201);
    m3 = linspace(0,2,201);
    
    omegaDR = nan(length(m2),length(m3));
    
    for i = 2:length(m2)-1
        for j = 2:length(m3)-1
            omegaDR(i,j) = max(real(compute_dispersion_relation(k,H1,H2,m2(i),m3(j),s1,s2,Q)));
        end
    end
        
    omegaDR = omegaDR.*(omegaDR>0);
    
    colormap(flipud(gray));
    
    % Plot
    imagesc(m2,m3,omegaDR')

    set(gca,'YDir','normal');
    
    colorbar();
    
    axis equal;
    axis([min(m2),max(m2),min(m3),max(m3)]);
    
    xlabel('m_2');
    ylabel('m_3');
    title({'Plot of the regions of instability.'});
    
end