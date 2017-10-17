function PlotVaryingMu(H_1, H_2, mu_2, mu_3, sigma_1, sigma_2, Q )
%%% Plot M-P instabilities in H

k = 0.001;

N = 201;
dm = 1/(N-1);
m = 0:dm:1;

omega_DR = nan(N,N);
omega_F = nan(N,N);
omega_G = nan(N,N);

for i = 2:N
    for j = 2:N
        omega_DR(i,j) = max(real(DispersionRelation(k,H_1,H_2,m(i),m(j),sigma_1,sigma_2,Q)));
        omega_F(i,j) = max(-real(eigF(H_1,H_2,m(i),m(j),sigma_1,sigma_2,Q)));
        omega_G(i,j) = max(imag(eigG(H_1,H_2,m(i),m(j),sigma_1,sigma_2,Q)));
    end
end
%%
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

plot(mu_2,mu_3,'xk');

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