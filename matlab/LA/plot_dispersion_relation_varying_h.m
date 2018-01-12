function [img, h] = plot_dispersion_relation_varying_h( m2, m3, s1, s2, Q )
    %plot_dispersion_relation_varying_h Plots a slice of the parameter
    % space with white for linearly stable, grey for M-P unstable and
    % black for flux unstable.
    
    k = [0.001,0.01,0.1,1,10];
    
    h = linspace(0,1,201);
    
    omegaDR = nan(length(h));
    omegaG = nan(length(h));
    omegaMP = nan(length(h));
    img = nan(length(h));
    
    for i = 1:length(h)-1
        for j = i+1:length(h)
            omegaDR(i,j) = max(max(real(compute_dispersion_relation(k,h(i),h(j),m2,m3,s1,s2,Q))));
            omegaG(i,j) = max(imag(eig(compute_g_linear(h(i),h(j),m2,m3,Q))));
            omegaMP(i,j) = max(max(real(compute_dispersion_relation(k,h(i),h(j),m2,m3,s1,s2,Q)-...
                compute_dispersion_relation(k,h(i),h(j),m2,m3,0,0,Q))));
        end
    end
    
    % Uncomment for magnitudes
    %     omegaDR(omegaDR<=0) = nan;
    %     imagesc(h,h,real(log10(omegaDR')),'alphadata',~isnan(omegaDR'));
    
    img(~isnan(omegaDR')) = 0;
    %img(omegaDR'>0) = 0.5;
    img(omegaMP'>0) = img(omegaMP'>0) + 1;
    img(omegaG'>0) = img(omegaG'>0) - 2;
    
%     triMap = [1.0   1.0   1.0
%               0.5   0.5   0.5
%               0.0   0.0   0.0];
    triMap = [1.0   0.0   0.0
              1.0   1.0   1.0
              0.0   0.0   1.0];
    map = [1.0 0.0 0.0
           1.0 0.2 0.2
           1.0 0.4 0.4
           1.0 0.6 0.6
           1.0 0.8 0.8
           1.0 1.0 1.0
           0.8 0.8 1.0
           0.6 0.6 1.0
           0.4 0.4 1.0
           0.2 0.2 1.0
           0.0 0.0 1.0];
    
    colormap(triMap);
    
    %imagesc(h,h,img,'alphadata',~isnan(img));
    
    imagesc(h,h,-(omegaMP'>0),'alphadata',(omegaMP'>0)*0.5);
    caxis([0 1]);
    
    hold on;
    
    %colormap('bone')
    imagesc(h,h,omegaG'>0,'alphadata',(omegaG'>0)*0.5);
    caxis([-1 1]);
    
    set(gca,'YDir','normal');
    colorbar('ticks',[-0.66,0,0.66],'ticklabels',{'M-P Instabilities','Linearly Stable','Flux Instabilities'});
    %caxis([-2 1]);
    axis equal;
    axis([0,1,0,1]);
    
    xlabel('H_1');
    ylabel('H_2');
    title({'Plot of the regions of instability.'});
    
end