
xN = 1000;
dx = 2*pi/xN;
x = linspace(dx,2*pi,xN)';
initialise_finite_differences(xN,dx,2);
global D
y = cos(x);
Dy = zeros(xN,1);

Dy(1) = (y(end-1)-4*y(end)+6*y(1)-4*y(2)+y(3))*dx^-4;
Dy(2) = (y(end)-4*y(1)+6*y(2)-4*y(3)+y(4))*dx^-4;
for i = 3:xN-2
    Dy(i) = (y(i-2)-4*y(i-1)+6*y(i)-4*y(i+1)+y(i+2))*dx^-4;
end
Dy(end-1) = (y(end-3)-4*y(end-2)+6*y(end-1)-4*y(end)+y(1))*dx^-4;
Dy(end) = (y(end-2)-4*y(end-1)+6*y(end)-4*y(1)+y(2))*dx^-4;


figure
plot(x,y,x,D{4}*y,x,Dy)

dx^2
max(abs(y-D{4}*y))
max(abs(y-Dy))
max(abs(Dy-D{4}*y))

