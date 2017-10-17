% Plots the interfaces and imaginary part of the Jacobian

mu_2 = 0.5;
mu_3 = 0.25;

N_x = 100;
d_x = 2*pi/N_x;
x = 0:d_x:2*pi-d_x;

h_1 = 0.5+0.1*cos(x);
h_2 = 0.7*ones(1,N_x);

Im = zeros(N_x,1);
for ix = 1:N_x
    Im(ix) = max(imag(-eigenvalue(h_1(ix),h_2(ix),mu_2,mu_3)));
end

figure;
subplot(2,1,1);
plot(x,[h_1;h_2]);
axis([0,2*pi,0,1]);
xlabel('x');
ylabel('y');
title('Interfaces');

subplot(2,1,2);
plot(x,Im);
axis([0,2*pi,0,0.03]);
xlabel('x');
ylabel('i\eta');
title('Largest imaginary part of the eigenvalues of the Jacobian');