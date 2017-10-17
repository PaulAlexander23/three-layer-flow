function PlotDispersionRelation(  H_1, H_2, mu_2, mu_3, sigma_1, sigma_2, Q, kf )

N = 101;
dk = kf/(N-1);
k = 0:dk:kf;
omega = zeros(N,1);

for i = 1:N
    omega(i,:) = max(real(DispersionRelation(k(i),H_1,H_2,mu_2,mu_3,sigma_1,sigma_2,Q)));
end

plot(k,omega)
xlabel('k')
ylabel('Re(\omega)')
title('Dispersion Relation')

end

