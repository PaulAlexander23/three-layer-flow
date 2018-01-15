function [img, h] = plot_stability_h(k, m2, m3, s1, s2, Q)
    %PLOT_STABILITY_H Plots a slice of the parameter
    % space with white for linearly stable, grey for M-P unstable and
    % black for flux unstable.
    
    h1 = linspace(0,1,201);
    h2 = linspace(0,1,201);
    
    omegaDR = nan(length(h1),length(h2));
    omegaMP = nan(length(h1),length(h2));
    
    for i = 1:length(h1)-1
        for j = 2:length(h2)
            if h1(i)<h2(j)
                omegaDR(i,j) = max(max(real(compute_dispersion_relation(k,h1(i),h2(j),m2,m3,s1,s2,Q))));
                omegaMP(i,j) = max(max(real(compute_dispersion_relation(k,h1(i),h2(j),m2,m3,s1,s2,Q)-...
                compute_dispersion_relation(k,h1(i),h2(j),m2,m3,0,0,Q))));
            end
        end
    end
    
    
    img = nan(length(h));
    
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
    
    %colormap(triMap);
    img = zeros(length(h),length(h),3);
    img(:,:,1) = (omegaMP'>0);
    img(:,:,3) = (omegaG'>0);
    
    image(h,h,img)
    %image(h,h,[omegaMP'>0,zeros(length(h)),omegaG'>0]);
    %imagesc(h,h,img,'alphadata',~isnan(img));
    
%     imagesc(h,h,-(omegaMP'>0),'alphadata',(omegaMP'>0)*0.5);
%     caxis([0 1]);
%     
%     hold on;
%     
%     %colormap('bone')
%     imagesc(h,h,omegaG'>0,'alphadata',(omegaG'>0)*0.5);
%     caxis([-1 1]);
%     
    set(gca,'YDir','normal');
    %colorbar('ticks',[-0.66,0,0.66],'ticklabels',{'M-P Instabilities','Linearly Stable','Flux Instabilities'});
    %caxis([-2 1]);
    axis equal;
    axis([0,1,0,1]);
    
    xlabel('H_1');
    ylabel('H_2');
    title({'Plot of the regions of instability.'});
    
end