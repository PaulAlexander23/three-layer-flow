function PlotVaryingTheta( H_1, H_2, mu_2, mu_3 )
%PLOTVARYINGTHETA Summary of this function goes here
%   Detailed explanation goes here

N_x = 101;
x = linspace(0,2*pi,N_x);

N_theta = 101;
theta = linspace(0,2*pi,N_theta);

type = NaN(N_theta,N_x);

pert = (H_2-H_1)* 2^-2;
for i_theta = 1:N_theta
   for i_x = 1:N_x
       type(i_theta, i_x) = max(imag(eig(G_nonlinear(H_1 + pert*sin(x(i_x)),H_2 + pert*sin(x(i_x) - theta(i_theta)), mu_2, mu_3))));
   end
end

bin_map = [1   1   1
          0.5 0.5 0.5];
colormap(bin_map)
imagesc(x,theta,type>0);%'alphadata',~isnan(type'));
set(gca,'YDir','normal');

%view([90 -90])

xlabel('x');
ylabel('\theta');
title('Regions of equation type for various shifts')
colorbar('ticks',[0.25,0.75],'ticklabels',{'Hyperbolic','Elliptc'})

end

