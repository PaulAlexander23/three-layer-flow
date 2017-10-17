%%%
%%% Driver for plotting multiple stability regions
%%%

close all;

sigma_1 = 1;
sigma_2 = 1;
Q = 1;
k = 0.001;

%% Plot Stability - Symmetric H

M = 101;
dm = 2/(M-1);
m = 0:dm:2;

N = 101;
dh = 0.5/(N-1);
h = 0:dh:0.5;

omega_DR = nan(N,N);
omega_F = nan(N,N);
omega_G = nan(N,N);

for i = 2:M
    for j = 1:N-1
        omega_DR(i,j) = max(real(DispersionRelation(k,h(j),1-h(j),m(i),1,sigma_1,sigma_2,Q)));
        omega_F(i,j) = max(-real(eigF(h(j),1-h(j),m(i),1,sigma_1,sigma_2,Q)));
        omega_G(i,j) = max(imag(eigG(h(j),1-h(j),m(i),1,sigma_1,sigma_2,Q)));        
    end
end

%% Plot Stability - Symmetric mu
%figure;
hold on;
%bin_map = [1   1   1
%          0.5 0.5 0.5];
%colormap(bin_map)
%imagesc(m,m,omega_DR'>0,'alphadata',~isnan(omega_DR'));
imagesc(m,h,omega_DR','alphadata',~isnan(omega_DR'));
set(gca,'YDir','normal');

[X, Y] = meshgrid(m,h);

contour(X,Y,omega_G',[0.0001,0.0001],'k');
contour(X,Y,omega_F',[0,0],'k--');

%plot(mu_2,h,'xk');

xlabel('\mu_2')
ylabel('H_1, 1-H_2')
title({'Location in parameter space'})

axis equal;