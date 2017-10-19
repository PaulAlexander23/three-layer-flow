function PlotDispersionRelation(  H1, H2, m2, m3, s1, s2, Q, kf )

N = 101;
dk = kf/(N-1);
k = 0:dk:kf;
omega = zeros(N,1);

for i = 1:N
    omega(i,:) = max(real(DispersionRelation(k(i),H1,H2,m2,m3,s1,s2,Q)));
end

plot(k,omega)
xlabel('k')
ylabel('Re(\omega)')
title('Dispersion Relation')

end

