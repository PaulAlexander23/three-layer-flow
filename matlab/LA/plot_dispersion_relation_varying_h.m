function [img, h] = plot_dispersion_relation_varying_h( m2, m3, s1, s2, Q )
    %plot_dispersion_relation_varying_h Plots a slice of the parameter
    % space with white for linearly stable, grey for M-P unstable and
    % black for flux unstable.
    
    k = [0.001,0.01,0.1,1,10];
    
    h = linspace(0,1,201);
    
    omegaDR = nan(length(h));
    omegaG = nan(length(h));
    img = nan(length(h));
    
    for i = 1:length(h)-1
        for j = i+1:length(h)
            omegaDR(i,j) = max(max(real(compute_dispersion_relation(k,h(i),h(j),m2,m3,s1,s2,Q))));
            omegaG(i,j) = max(imag(eig(compute_g_linear(h(i),h(j),m2,m3,Q))));
        end
    end
    
    % Uncomment for magnitudes
    %     omegaDR(omegaDR<=0) = nan;
    %     imagesc(h,h,real(log10(omegaDR')),'alphadata',~isnan(omegaDR'));
    
    img(~isnan(omegaDR')) = 0;
    img(omegaDR'>0) = 0.5;
    img(omegaG'>0) = 1;
    
    triMap = [1.0   1.0   1.0
              0.5   0.5   0.5
              0.0   0.0   0.0];
    colormap(triMap);
    
    imagesc(h,h,img,'alphadata',~isnan(img));
    
    set(gca,'YDir','normal');
    colorbar('ticks',[0.125,0.5,0.875],'ticklabels',{'Linearly Stable','M-P Instabilities','Flux Instabilities'});
    caxis([0 1]);
    axis equal;
    axis([0,1,0,1]);
    
    xlabel('H_1');
    ylabel('H_2');
    title({'Plot of the regions of instability.'});
    
end