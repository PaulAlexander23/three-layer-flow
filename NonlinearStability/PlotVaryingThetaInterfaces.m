function PlotVaryingThetaInterfaces(  H1, H2 )
%PLOTVARYINGTHETAINTERFACES Summary of this function goes here
%   Detailed explanation goes here

xN = 101;
x = linspace(0,2*pi,xN);

thetaN = 11;
theta = linspace(0,pi,thetaN);

pert = (H2-H1)* 2^-2;

hold on;
plot(x,[H1 + pert*sin(x); H2 + pert*sin(x - theta(1))],'k');
for thetai = 2:thetaN
    plot(x, H2 + pert*sin(x - theta(thetai)),'color',(0.1+0.8*thetai/thetaN)*ones(1,3));
end

xlabel('x');
ylabel('y');
title('Interfaces with phase shift')

end

