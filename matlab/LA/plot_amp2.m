
H1 = 0.6;
H2 = 0.95;
m2 = 0.5;
m3 = 3.1;
s1 = 1.0;
s2 = 1.0;
Q = 1.0;

%k = 1;

zN = 201;
z0 = 0.1;
z1 = 20;
z = linspace(z0,z1,zN);

w = zeros(zN,1);
amp = zeros(zN,1);
phi = zeros(zN,1);

for j = 1:zN
    [e,V] = compute_dispersion_relation(z(j),H1,H2,m2,m3,s1,s2,Q);
    w(j) = e(1);
    amp(j) = abs(V(2,1))/abs(V(1,1));
    phi(j) = imag(V(2,1)) - imag(V(1,1));
end


plot(z,real(w),z,zeros(size(z)),'k');
title('Growth rate against k');
xlabel('k');
ylabel('Growth rate');
figure;
plot(z,amp,z,ones(size(z)),'k');
title('Amplitude ratio, \eta_2/\eta_1, against k');
xlabel('k');
ylabel('Amplitude ratio');
figure;
plot(z,phi,z,zeros(size(z)),'k');
title('Phase shift of \eta_2 from \eta_1 against k');
xlabel('k');
ylabel('Phase shift');
