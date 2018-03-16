
zN = 101;
z0 = 0.1;
z1 = 2;
z = linspace(z0,z1,zN);

w = zeros(zN,1);
amp = zeros(zN,1);
phi = zeros(zN,1);

for j = 1:zN
    [e,V] = compute_dispersion_relation(k,H1,H2,m2,z(j),s1,s2,Q);
    w(j) = e(1);
    amp(j) = abs(V(2,1))/abs(V(1,1));
    phi(j) = imag(V(2,1)) - imag(V(1,1));
end


plot(z,w);
figure;
plot(z,amp);
figure;
plot(z,phi);

