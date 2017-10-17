

% Stable
% H_1 = 0.5;
% H_2 = 0.7;
% mu_2 = 0.9;
% mu_3 = 0.8;

% Unstable
% H_1 = 0.5;
% H_2 = 0.7;
% mu_2 = 0.5;
% mu_3 = 0.25;

% M-P 
H_1 = 0.5;
H_2 = 0.6;
mu_2 = 0.3;
mu_3 = 0.8;

N_x = 101;
x = linspace(0,2*pi,N_x);

N_pert = 101;
pert = linspace(0,(H_2-H_1)*0.8,N_pert);

type = NaN(N_pert,N_x);

for i_pert = 1:N_pert
    for i_x = 1:N_x
        type(i_pert,i_x) = max(imag(eig(G_nonlinear(H_1 + pert(i_pert)*sin(x(i_x)),H_2 + pert(i_pert)*sin(x(i_x)), mu_2, mu_3))));
    end
end

figure;
subplot(1,2,1)
hold on;
for i_pert = 1:20:N_pert
    plot(x,[H_1 + pert(i_pert)*sin(x);H_2 + pert(i_pert)*sin(x)],'color',(0.2 + 0.8*i_pert/N_pert)*[0.2,0.2,0.8]);
end
hold off;
axis([0,2*pi,0,1]);
xlabel('x')
ylabel('y')
title('Pertubation Interfaces')

subplot(1,2,2);
bin_map = [1   1   1
          0.5 0.5 0.5];
colormap(bin_map)
imagesc(x,pert,type>0);
set(gca,'YDir','normal');

xlabel('x')
ylabel('Perturbation Amplitude')
colorbar('ticks',[0.25,0.75],'ticklabels',{'Hyperbolic','Elliptc'})
title('Regions of Type for different pertubations')
