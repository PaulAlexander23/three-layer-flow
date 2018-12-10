function [img, Q, m3] = plot_stability_m_Q(k, H1, H2, m2, s1, s2)
    %PLOT_STABILITY_M_Q Plots a slice of the parameter
    % space with white for linearly stable, grey for M-P unstable and
    % black for flux unstable.
    
    Q = linspace(0,0.2,801);
    m3 = linspace(0,2,801);
    
    omegaDR = nan(length(Q),length(m3));
    omegaG = nan(length(Q),length(m3));
    
    parfor i = 2:length(Q)-1
        v1 = nan(1,length(m3));
        v2 = nan(1,length(m3));
        for j = 2:length(m3)-1
            v1(j) = max(real(compute_dispersion_relation(k,H1,H2,m2,m3(j),s1,s2,Q(i))));
            v2(j) = max(real(compute_dispersion_relation(k,H1,H2,m2,m3(j),0,0,Q(i))));
        end
        omegaDR(i,:) = v1;
        omegaG(i,:) = v2;
    end
    
    img = zeros(length(Q),length(m3));
    
    % Unstable Region
    img(omegaDR>0) = 0.5;
    
    % Flux Region
    img(omegaG>1e-13) = 1;
    
    colormap([1   1   1
        0.5 0.5 0.5
        0   0   0])
    
    % Plot
    imagesc(Q,m3,img')
    
    set(gca,'YDir','normal');
    
    %colorbar('ticks',[0.1666,0.5,0.8333],'ticklabels',{'Stable','Unstable','Alpha Unstable'});
    caxis([0 1]);
    
    %axis image;
    
    xlabel('Q');
    ylabel('m_3');
    %title({'Plot of the regions of instability.'});
    
end
