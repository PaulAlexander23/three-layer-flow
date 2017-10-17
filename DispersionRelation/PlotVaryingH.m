function PlotVaryingH( H_1, H_2, mu_2, mu_3, sigma_1, sigma_2, Q )
%%% Plot M-P instabilities in H

k = 0.001;

N = 201;
dh = 1/(N-1);
h = 0:dh:1;

omega_DR = nan(N,N);
omega_F = nan(N,N);
omega_G = nan(N,N);

for i = 1:N-1
    for j = i+1:N
        omega_DR(i,j) = max(real(DispersionRelation(k,h(i),h(j),mu_2,mu_3,sigma_1,sigma_2,Q)));
        omega_F(i,j) = max(-real(eigF(h(i),h(j),mu_2,mu_3,sigma_1,sigma_2,Q)));
        omega_G(i,j) = max(imag(eigG(h(i),h(j),mu_2,mu_3,sigma_1,sigma_2,Q)));
    end
end
%%
%figure;
hold on;
bin_map = [1   1   1
          0.5 0.5 0.5];
colormap(bin_map)
imagesc(h,h,omega_DR'>0,'alphadata',~isnan(omega_DR'));
%imagesc(h,h,omega_DR','alphadata',~isnan(omega_DR'));
set(gca,'YDir','normal');

[X, Y] = meshgrid(h,h);

contour(X,Y,omega_G',[0.0001,0.0001],'k');
contour(X,Y,omega_F',[0,0],'k--');

plot(H_1,H_2,'xk');

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