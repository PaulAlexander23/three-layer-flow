% Plots the interfaces and imaginary part of the Jacobian

m2 = 0.5;
m3 = 0.25;

xN = 100;
xd = 2*pi/xN;
x = 0:xd:2*pi-xd;

h1 = 0.5+0.1*cos(x);
h2 = 0.7*ones(1,xN);

Im = zeros(xN,1);
for ix = 1:xN
    Im(ix) = max(imag(-eigenvalue(h1(ix),h2(ix),m2,m3)));
end

figure;
subplot(2,1,1);
plot(x,[h1;h2]);
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