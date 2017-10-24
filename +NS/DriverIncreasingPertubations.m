

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
H1 = 0.5;
H2 = 0.6;
m2 = 0.3;
m3 = 0.8;

xN = 101;
x = linspace(0,2*pi,xN);

N_pert = 101;
pert = linspace(0,(H2-H1)*0.8,N_pert);

type = NaN(N_pert,xN);

for i_pert = 1:N_pert
    for i_x = 1:xN
        type(i_pert,i_x) = max(imag(eig(G_nonlinear(H1 + pert(i_pert)*sin(x(i_x)),H2 + pert(i_pert)*sin(x(i_x)), m2, m3))));
    end
end

figure;
subplot(1,2,1)
hold on;
for i_pert = 1:20:N_pert
    plot(x,[H1 + pert(i_pert)*sin(x);H2 + pert(i_pert)*sin(x)],'color',(0.2 + 0.8*i_pert/N_pert)*[0.2,0.2,0.8]);
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
