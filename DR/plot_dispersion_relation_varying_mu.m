function plot_dispersion_relation_varying_mu(H1, H2, m2, m3, s1, s2, Q )
    %plot_dispersion_relation_varying_mu Plots a slice of the parameter
    %space with white for linearly stable, grey for M-P unstable and
    %enclosed by a black line for flux unstable.
    
    k = 0.001;
    
    nm = 201;
    m = linspace(0,2,nm);
    
    omega_DR = nan(nm,nm);
    omega_F = nan(nm,nm);
    omega_G = nan(nm,nm);
    
    for i = 2:nm
        for j = 2:nm
            omega_DR(i,j) = max(real(compute_dispersion_relation(k,H1,H2,m(i),m(j),s1,s2,Q)));
            omega_F(i,j) = max(real(eig(compute_f_linear(H1,H2,m(i),m(j),s1,s2))));
            omega_G(i,j) = max(imag(eig(compute_g_linear(H1,H2,m(i),m(j),Q))));
        end
    end
    
    %figure;
    hold on;
    bin_map = [1   1   1
        0.5 0.5 0.5];
    colormap(bin_map)
    imagesc(m,m,omega_DR'>0,'alphadata',~isnan(omega_DR'));
    %imagesc(m,m,omega_DR','alphadata',~isnan(omega_DR'));
    set(gca,'YDir','normal');
    
    [X, Y] = meshgrid(m,m);
    
    contour(X,Y,omega_G',[0.0001,0.0001],'k');
    contour(X,Y,omega_F',[0,0],'k--');
    
    plot(m2,m3,'xk');
    
    xlabel('m_2')
    ylabel('m_3')
    title({'Location in parameter space'})
    
    axis equal;
    % %%
    % figure;
    % imagesc(m,m,omega_DR','alphadata',~isnan(omega_DR'));
    % set(gca,'YDir','normal');
    % %%
    % figure;
    % imagesc(m,m,omega_F','alphadata',~isnan(omega_DR'));
    % set(gca,'YDir','normal');
    % %%
    % figure;
    % imagesc(m,m,omega_G','alphadata',~isnan(omega_DR'));
    % set(gca,'YDir','normal');
    
end