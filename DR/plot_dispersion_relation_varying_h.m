function plot_dispersion_relation_varying_h( H1, H2, m2, m3, s1, s2, Q )
    %plot_dispersion_relation_varying_h Plots a slice of the parameter 
    %space with white for linearly stable, grey for M-P unstable and
    %enclosed by a black line for flux unstable.
    
    k = [0.001,0.01,0.1,1,10];
    
    nh = 201;
    dh = 1/(nh-1);
    h = 0:dh:1;
    
    omegaDR = nan(nh,nh);
    omegaF = nan(nh,nh);
    omegaG = nan(nh,nh);
    
    for i = 1:nh-1
        for j = i+1:nh
            omegaDR(i,j) = max(max(real(compute_dispersion_relation(k,h(i),h(j),m2,m3,s1,s2,Q))));
            omegaF(i,j) = max(real(eig(compute_f_linear(h(i),h(j),m2,m3,s1,s2))));
            omegaG(i,j) = max(imag(eig(compute_g_linear(h(i),h(j),m2,m3,Q))));
        end
    end
    
    %figure;
    hold on;
    bin_map = [1   1   1
        0.5 0.5 0.5];
    colormap(bin_map)
    imagesc(h,h,omegaDR'>0,'alphadata',~isnan(omegaDR'));
    %imagesc(h,h,omega_DR','alphadata',~isnan(omega_DR'));
    set(gca,'YDir','normal');
    
    [X, Y] = meshgrid(h,h);
    
    contour(X,Y,omegaG',[0.0001,0.0001],'k');
    contour(X,Y,omegaF',[0,0],'k--');
    
    plot(H1,H2,'xk');
    
    xlabel('H_1')
    ylabel('H_2')
    title({'Location in parameter space'})
    
    axis equal;
    % %%
    % figure;
    % imagesc(h,h,omega_DR','alphadata',~isnan(omega_DR'));
    % set(gca,'YDir','normal');
    % %%
    % figure;
    % imagesc(h,h,omega_F','alphadata',~isnan(omega_DR'));
    % set(gca,'YDir','normal');
    % %%
    % figure;
    % imagesc(h,h,omega_G','alphadata',~isnan(omega_DR'));
    % set(gca,'YDir','normal');
    
end