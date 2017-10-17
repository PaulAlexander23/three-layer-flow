function PlotVaryingThetaInterfaces(  H_1, H_2 )
%PLOTVARYINGTHETAINTERFACES Summary of this function goes here
%   Detailed explanation goes here

N_x = 101;
x = linspace(0,2*pi,N_x);

N_theta = 11;
theta = linspace(0,pi,N_theta);

pert = (H_2-H_1)* 2^-2;

hold on;
plot(x,[H_1 + pert*sin(x); H_2 + pert*sin(x - theta(1))],'k');
for i_theta = 2:N_theta
    plot(x, H_2 + pert*sin(x - theta(i_theta)),'color',(0.1+0.8*i_theta/N_theta)*ones(1,3));
end

xlabel('x');
ylabel('y');
title('Interfaces with phase shift')

end

