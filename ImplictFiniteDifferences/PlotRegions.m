%PlotRegions Calculates the different regions of stability/class and plots
%them

k = 0.1;
type = zeros(length(x), length(t));

for t_i = 1:length(t)
    for x_i = 1:length(x)
        %type(x_i,t_i) = max(real(DispersionRelation(k, h(x_i,1,t_i), h(x_i,2,t_i), m2, m3, sigma1, sigma2, Q)));
        %type(x_i,t_i) = eigDR(k, h(x_i,1,t_i), h(x_i,2,t_i), m2, m3, sigma1, sigma2, Q);
        type(x_i,t_i) = max(imag(eig(G_nonlinear(h(t_i,x_i), h(t_i,x_i+end/2), mu_2, mu_3))))>0;
    end
end

bin_map = [1   1   1
          0.5 0.5 0.5];
colormap(bin_map)
imagesc(x,t,type'>0);
set(gca,'Ydir','Normal')

xlabel('x')
ylabel('t')
title('Regions where the Jacobian is ellipitic')
